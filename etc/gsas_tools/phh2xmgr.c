#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>


#define Fprintf (void) fprintf
#define Fclose  (void) fclose
#define Fflush  (void) fflush


static const char *progn = "phh2xmgr";


#define progerror(message) p_rogerror(message, __LINE__)

static void p_rogerror(const char *message, const int source_code_line)
{
  fflush(stdout);
  fprintf(stderr, "%s(%d): %s\n", progn, source_code_line, message);
  exit(1);
}


#define InternalError() I_nternalError(__LINE__)

static void I_nternalError(const int source_code_line)
{
  p_rogerror("Internal Error", source_code_line);
}


#define NotEnoughCore() N_otEnoughCore(__LINE__)

static void N_otEnoughCore(const int source_code_line)
{
  p_rogerror("Not enough core", source_code_line);
}


#define IllegalLine(fnin, lcount) I_llegalLine(fnin, lcount, __LINE__)

static void I_llegalLine(const char *fnin, int lcount, int source_code_line)
{
  fflush(stdout);
  fprintf(stderr, "%s(%d): Illegal line #%d",
    progn, source_code_line, lcount);
  if (fnin != NULL) fprintf(stderr, " in %s", fnin);
  putc('\n', stderr);
  exit(1);
}


static int fgetline(FILE *fpin, char s[], int size_s)
{
  int         last_s, c, i;


  last_s = size_s - 1;

  i = 0;

  while ((c = getc(fpin)) != EOF && c != '\n')
  {
#ifdef __MSDOS__
    if (c == 0x1A /* CtrlZ */) {
      ungetc(c, fpin);
      c = EOF;
      break;
    }
#endif

    if (i < last_s) s[i++] = (char) c;
  }

  s[i] = '\0';

  if (i == 0 && c == EOF)
    return 0;

  return 1;
}


static int str_icmp(const char *s, const char *t)
{
  char  cs, ct;


  while (*s || *t)
  {
    cs = toupper(*s++);
    ct = toupper(*t++);
    if (cs < ct) return -1;
    if (cs > ct) return  1;
  }

  return 0;
}


static char firstnonblank(const char *s)
{
  while (isspace(*s)) s++;
  return *s;
}


static float OptimalTickSpacing(float Range, int IdealT, int MaxT)
{
  int          i, isc, osc;
  float        min_sp, idl_sp, sp, sc, Delta, MinDelta, BestSp;
  const float  SpLib[] = { 1., 2., 4., 5.};


  idl_sp = fabs(Range / IdealT);
  min_sp = fabs(Range / MaxT);

  MinDelta = -1.;
  BestSp   = idl_sp;

  for (osc = -1; osc <= 1; osc++)
  {
    for (i = 0; i < sizeof SpLib / sizeof (*SpLib); i++)
    {
          sc = log10(idl_sp / SpLib[i]);
      if (sc < 0.)
        isc = (int)(sc - 1.e-6) + osc;
      else
        isc = (int)(sc + 1.e-6) + osc;

      sp = SpLib[i] * pow(10., (float) isc);

      if (sp < min_sp) continue;

                     Delta = fabs(idl_sp - sp);
      if (MinDelta > Delta || MinDelta < 0.)
      {
        MinDelta = Delta;
        BestSp   = sp;
      }
    }
  }

  return BestSp;
}


typedef struct
  {
    int    icode;
    float  t;
    float  yo;
    float  ycb;
  }
  T_Data;


static void usage(void)
{
  Fprintf(stderr, "usage: %s [-#Dilute] [-Fcal] [read_phh_output]\n", progn);
  exit(1);
}


#define BUFLEN 255


int main(int argc, char *argv[])
{
  int   iarg, i, n;
  long  lcount;
  char  xtrac;
  char  *fnin;
  FILE  *fpin;

  int  F_Dilute, F_Fcal, iSet;

  static char  buf[BUFLEN + 1];

  int    icode, iovlp;
  float  t, yo, yc, yi, yb, yw, cw, ytmajor, ytminor, xLblOC, yLblOC;

  int     mData, nData, iData;
  T_Data  *Data;

  float  Min_2t;
  float  Max_2t;
  float  Max_yo;
  float  Max_ycb;
  float  Min_yo_ycb;
  float  Max_yo_ycb;
  float  yo_ycb;
  float  ReflM, OffsD, Max_y, ymin, ymax;


  F_Dilute = 0;
  F_Fcal   = 0;
  fnin     = NULL;

  for (iarg = 1; iarg < argc; iarg++)
  {
    if (str_icmp(argv[iarg], "-Fcal") == 0)
    {
      if (F_Fcal) usage();
      F_Fcal = 1;
    }
    else if (argv[iarg][0] == '-')
    {
      if (F_Dilute) usage();

          n = sscanf(argv[iarg], "%d %c", &i, &xtrac);
      if (n != 1 || i >= 0)
        usage();

      F_Dilute = -i;
    }
    else
    {
      if (fnin == NULL)
        fnin = argv[iarg];
      else
        usage();
    }
  }

  if (F_Dilute == 0) F_Dilute = 1;

  if (fnin == NULL)
    fpin = stdin;
  else
  {
        fpin = fopen(fnin, "r");
    if (fpin == NULL)
    {
      Fprintf(stderr, "%s: Can't open %s\n", progn, fnin);
      exit(1);
    }
  }
                    mData = 18000;
      Data = malloc(mData * sizeof (*Data));
  if (Data == NULL)
    NotEnoughCore();

  nData = 0;

  lcount = 0;

  while (fgetline(fpin, buf, sizeof buf))
  {
    lcount++;

    if (firstnonblank(buf) == '#') continue;

    n = sscanf(buf, "%d%f%f%f%f%f%f%f%d",
               &icode, &t, &yo, &yc, &yi, &yb, &yw, &cw, &iovlp);

    if (n != 9) IllegalLine(fnin, lcount);

    if (mData == nData)
    {                          mData += 18000;
          Data = realloc(Data, mData * sizeof (*Data));
      if (Data == NULL)
        NotEnoughCore();
    }

    Data[nData].icode = icode;
    Data[nData].t     = t;
    Data[nData].yo    = yo;
    Data[nData].ycb   = yc + yb;
         nData++;
  }

  if (fpin != stdin)
    Fclose(fpin);

  if (nData == 0) exit(0);

                           mData = nData;
      Data = realloc(Data, mData * sizeof (*Data));
  if (Data == NULL)
    InternalError();

  Min_2t     = Data[0].t;
  Max_2t     = Data[0].t;
  Max_yo     = Data[0].yo;
  Max_ycb    = Data[0].ycb;
  Min_yo_ycb =
  Max_yo_ycb = Max_yo - Max_ycb;

  for (iData = 1; iData < nData; iData++)
  {
    if (Min_2t  > Data[iData].t  ) Min_2t  = Data[iData].t;
    if (Max_2t  < Data[iData].t  ) Max_2t  = Data[iData].t;

    if (Max_yo  < Data[iData].yo ) Max_yo  = Data[iData].yo;
    if (Max_ycb < Data[iData].ycb) Max_ycb = Data[iData].ycb;

                     yo_ycb = Data[iData].yo - Data[iData].ycb;
    if (Min_yo_ycb > yo_ycb) Min_yo_ycb = yo_ycb;
    if (Max_yo_ycb < yo_ycb) Max_yo_ycb = yo_ycb;
  }

      Max_y = Max_yo;
  if (Max_y < Max_ycb && F_Fcal)
      Max_y = Max_ycb;

  ReflM = Max_y * .024;
  OffsD = ReflM + Max_yo_ycb + (Max_yo_ycb - Min_yo_ycb) * .1;
  ymax = Max_y - OffsD - Min_yo_ycb;
  ymin = -OffsD + Min_yo_ycb - ymax * .024;
  ymax = Max_y               + ymax * .024;
  ytmajor = OptimalTickSpacing(Max_y, 5, 7);
  ytminor = ytmajor / 2.;
  xLblOC = Min_2t / 100. - (Max_2t - Min_2t) / 100. * .05;
  yLblOC = -OffsD;

  putc('#', stdout);
  for (iarg = 0; iarg < argc; iarg++) Fprintf(stdout, " %s", argv[iarg]);
  putc('\n', stdout);

  Fprintf(stdout, "# Min_2t     = %.6g\n", Min_2t / 100.);
  Fprintf(stdout, "# Max_2t     = %.6g\n", Max_2t / 100.);
  Fprintf(stdout, "# Max_yo     = %.6g\n", Max_yo);
  Fprintf(stdout, "# Max_ycb    = %.6g\n", Max_ycb);
  Fprintf(stdout, "# Min_yo_ycb = %.6g\n", Min_yo_ycb);
  Fprintf(stdout, "# Max_yo_ycb = %.6g\n", Max_yo_ycb);
  Fprintf(stdout, "# ReflM = %.6g\n", ReflM);
  Fprintf(stdout, "# OffsD = %.6g\n", OffsD);
  Fprintf(stdout, "# Take every %d. profile point\n", F_Dilute);

  Fprintf(stdout, "@with g0\n");
  Fprintf(stdout, "@g0 on\n");
  Fprintf(stdout, "@ world xmin %.6g\n", Min_2t / 100.);
  Fprintf(stdout, "@ world xmax %.6g\n", Max_2t / 100.);
  Fprintf(stdout, "@ world ymin %.6g\n", ymin);
  Fprintf(stdout, "@ world ymax %.6g\n", ymax);
  Fprintf(stdout, "@ xaxis  tick major 10\n");
  Fprintf(stdout, "@ xaxis  tick minor 5\n");
  Fprintf(stdout, "@ xaxis  ticklabel char size 0.55\n");
  Fprintf(stdout, "@ xaxis  ticklabel prec 0\n");
  Fprintf(stdout, "@ xaxis  label \"2-Theta (degree)\"\n");
  Fprintf(stdout, "@ xaxis  label char size 0.7\n");
  Fprintf(stdout, "@ xaxis  ticklabel start type spec\n");
  Fprintf(stdout, "@ xaxis  ticklabel start 10\n");
  Fprintf(stdout, "@ xaxis  ticklabel stop type spec\n");
  Fprintf(stdout, "@ xaxis  ticklabel stop %.6g\n", Max_2t / 100. - 3.);
  Fprintf(stdout, "@ yaxis  tick major %.6g\n", ytmajor);
  Fprintf(stdout, "@ yaxis  tick minor %.6g\n", ytminor);
  Fprintf(stdout, "@ yaxis  ticklabel char size 0.55\n");
  Fprintf(stdout, "@ yaxis  ticklabel prec 0\n");
  Fprintf(stdout, "@ yaxis  label \"Counts\"\n");
  Fprintf(stdout, "@ yaxis  label char size 0.7\n");
  Fprintf(stdout, "@ yaxis  ticklabel start type spec\n");
  Fprintf(stdout, "@ yaxis  ticklabel start 0\n");
  Fprintf(stdout, "@ yaxis  ticklabel stop type spec\n");
  Fprintf(stdout, "@ yaxis  ticklabel stop %.6g\n", ymax * .97);

  Fprintf(stdout, "@with string\n");
  Fprintf(stdout, "@    string on\n");
  Fprintf(stdout, "@    string loctype world\n");
  Fprintf(stdout, "@    string g0\n");
  Fprintf(stdout, "@    string %.6g, %.6g\n", xLblOC, yLblOC);
  Fprintf(stdout, "@    string linewidth 1\n");
  Fprintf(stdout, "@    string color 1\n");
  Fprintf(stdout, "@    string rot 90\n");
  Fprintf(stdout, "@    string font 4\n");
  Fprintf(stdout, "@    string just 2\n");
  Fprintf(stdout, "@    string char size 0.7\n");
  Fprintf(stdout, "@string def \"Obs.-Calc.\"\n");

  iSet = 0;

  if (F_Fcal) /* then print Fobs with "+" */
  {
    Fprintf(stdout, "@ s%d symbol 9\n", iSet);
    Fprintf(stdout, "@ s%d symbol size 0.40\n", iSet);
    Fprintf(stdout, "@ s%d symbol color 1\n", iSet);
    Fprintf(stdout, "@ s%d linestyle 0\n", iSet);
    Fprintf(stdout, "@ s%d color 1\n", iSet);
    iSet++;
  }

  Fprintf(stdout, "@ s%d color 1\n", iSet);
  iSet++;
  Fprintf(stdout, "@ s%d color 1\n", iSet);
  iSet++;
  Fprintf(stdout, "@ s%d color 1\n", iSet);
  iSet++;
  Fprintf(stdout, "@ s%d symbol 12\n", iSet);
  Fprintf(stdout, "@ s%d linestyle 0\n", iSet);
  iSet++;

  for (iData = 0; iData < nData; iData += F_Dilute)
    Fprintf(stdout, "%.6g %.6g\n",
      Data[iData].t / 100., Data[iData].yo);
  Fprintf(stdout, "&\n");

  if (F_Fcal)
  {
    for (iData = 0; iData < nData; iData += F_Dilute)
      Fprintf(stdout, "%.6g %.6g\n",
        Data[iData].t / 100., Data[iData].ycb);
    Fprintf(stdout, "&\n");
  }

  Fprintf(stdout, "%.6g %.6g\n", Min_2t / 100., -OffsD);
  Fprintf(stdout, "%.6g %.6g\n", Max_2t / 100., -OffsD);
  Fprintf(stdout, "&\n");

  for (iData = 0; iData < nData; iData += F_Dilute)
    Fprintf(stdout, "%.6g %.6g\n",
      Data[iData].t / 100., Data[iData].yo - Data[iData].ycb - OffsD);
  Fprintf(stdout, "&\n");

  for (iData = 0; iData < nData; iData++)
  {
    if (Data[iData].icode >> 2 == 0) continue;

    Fprintf(stdout, "%.6g %.6g\n",
      Data[iData].t / 100., -ReflM);
  }
  Fprintf(stdout, "&\n");

  return 0;
}
