/*
  gsas_fwhm: a simple tool to extract GSAS FWHM

  (c) 1995-98 Ralf W. Grosse-Kunstleve
  email: rwgk@laplace.csb.yale.edu

  Permission to use, copy, modify, and distribute this software for any
  purpose and without fee is hereby granted, provided that the above
  copyright notice appears in all copies. This software is provided "as is"
  and without any express or implied warranties.
*/


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <ctype.h>


#ifndef M_PI
#define M_PI            3.14159265358979323846
#endif
#ifndef M_PI_2
#define M_PI_2          1.57079632679489661923
#endif
#define PIover180 (M_PI / 180.)


char     *progn = "gsas_fwhm";


static double  GU, GV, GW;
static double  LX, LY, trns;
static double  asym, shft, GP;
static double  stec, ptec, sfec;


static void progerror(char *message)
{
  fprintf(stderr, "\a");
  fprintf(stderr, "\n%s: %s\n", progn, message);

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


#ifndef __TURBOC__
static int stricmp(char *s, char *t)
{
  char     cs, ct;

  while (*s || *t)
  { cs = toupper(*s++);
    ct = toupper(*t++);
    if (cs < ct) return -1;
    if (cs > ct) return  1;
  }
  return 0;
}
#endif


static char *strxcpy(char *dest, char *src, size_t n)
{
  while (--n && *src) *dest++ = *src++;
  *dest = '\0';

  return dest;
}


static int strbegin(char *s1, char *s2) /* string begin */
{
  while (*s1 && *s2)
  { if      (*s1   < *s2  ) return -1;
    else if (*s1++ > *s2++) return  1;
  }
  if (*s2) return -1;
  return 0;
}


#define IllegalLine(fnin, lcount) I_llegalLine(fnin, lcount, __LINE__)

static void I_llegalLine(char *fnin, long lcount, int source_code_line)
{
  fflush(stdout);
  fprintf(stderr, "%s(%d): Illegal line #%ld",
    progn, source_code_line, lcount);
  if (fnin != NULL) fprintf(stderr, " in %s", fnin);
  putc('\n', stderr);
  exit(1);
}


/* BEGIN: COPY from lattice.h and lattice.c */


typedef struct {
                 double   a, b, c;
                 double   alpha, beta, gamma;
                 double   sa, sb, sg;
                 double   ca, cb, cg;
                 double   v;
                 char     calcs, calcc;
               }
               T_LatticeConstants;


double Q_hkl(int h, int k, int l, T_LatticeConstants *rlc)
{
  double    Q;

  Q =   (int)(h * h) * (rlc->a * rlc->a)
      + (int)(k * k) * (rlc->b * rlc->b)
      + (int)(l * l) * (rlc->c * rlc->c)
      + (int)(2 * h * k) * (rlc->a * rlc->b * rlc->cg)
      + (int)(2 * h * l) * (rlc->a * rlc->c * rlc->cb)
      + (int)(2 * k * l) * (rlc->b * rlc->c * rlc->ca);

  if (Q <= 0.) Q = 0.;

  return Q;
}


#define EpsPI (1.e-6) /* ARBITRARY */

static double sinC(double arg)
{
  if (M_PI_2 - EpsPI <= arg && arg <= M_PI_2 + EpsPI)
    return 1.;
  else
    return sin(arg);
}


static double cosC(double arg)
{
  if (M_PI_2 - EpsPI <= arg && arg <= M_PI_2 + EpsPI)
    return 0.;
  else
    return cos(arg);
}


int Lc2RLc(T_LatticeConstants *lc, T_LatticeConstants *rlc)
{
  /* Transformation Lattice Constants -> Reciprocal Lattice Constants
     after Kleber, W., 17. Aufl., Verlag Technik GmbH Berlin 1990, P.352
   */

  double  D;


  if (lc->calcs)
  { lc->sa = sinC(lc->alpha); lc->sb = sinC(lc->beta); lc->sg = sinC(lc->gamma);
    lc->calcs = 0;
  }

  if (lc->calcc)
  { lc->ca = cosC(lc->alpha); lc->cb = cosC(lc->beta); lc->cg = cosC(lc->gamma);
    lc->calcc = 0;
  }

  D = 1. - lc->ca * lc->ca - lc->cb * lc->cb - lc->cg * lc->cg
         + 2. * lc->ca * lc->cb * lc->cg;
  if (D < 0.) return -1;

  lc->v = lc->a * lc->b * lc->c * sqrt(D);
  if (lc->v == 0.) return -1;

  if (lc->sa == 0. || lc->sb == 0. || lc->sg == 0.) return -1;

  if (rlc != NULL)
  {
    rlc->a = lc->b * lc->c * lc->sa / lc->v;
    rlc->b = lc->c * lc->a * lc->sb / lc->v;
    rlc->c = lc->a * lc->b * lc->sg / lc->v;
    rlc->ca = (lc->cb * lc->cg - lc->ca) / (lc->sb * lc->sg);
    rlc->cb = (lc->cg * lc->ca - lc->cb) / (lc->sg * lc->sa);
    rlc->cg = (lc->ca * lc->cb - lc->cg) / (lc->sa * lc->sb);
    rlc->alpha = acos(rlc->ca);
    rlc->beta  = acos(rlc->cb);
    rlc->gamma = acos(rlc->cg);
    rlc->sa = sinC(rlc->alpha);
    rlc->sb = sinC(rlc->beta);
    rlc->sg = sinC(rlc->gamma);
    rlc->v = 1. / lc->v;
    rlc->calcs = 0;
    rlc->calcc = 0;
  }

  return 0;
}


/* END: COPY from lattice.h and lattice.c */


double BraggTheta(int h, int k, int l, T_LatticeConstants *rlc, double Lambda)
{
  double  x;

               x = Q_hkl(h, k, l, rlc);
      x = sqrt(x);
  if (x <= 5.e-6) /* ARBITRARY */
    return 0.;

      x *= Lambda / 2.;
  if (x < 0. || x > 1.)
    return 0.;

  return asin(x);
}


#define Small (5.0E-7)

/* xtal's way to REDUCE ...
ELSE IF(IOUT==5)#                      F2 to f                          AR06 249
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 25 AR06 250
QX(JP1)=SQRT(AMAX1(QX(IP1),0.0))#      Convert                          AR06 251
IF(IP2!=NPUTPK)#                       Convert sigma                    AR06 252
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 26 AR06 253
IF(QX(JP1)<small:&QX(IP2)<small:) QX(JP2)=0.# Set sigma to zero         Jan93005
ELSE QX(JP2)=QX(IP2)/(QX(JP1)+SQRT(QX(IP2)+QX(JP1)**2))# Sigma f        AR06 255
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 26 AR06 256
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 25 AR06 257
#                                                                       AR06 258
*/

void ReduceF2toF(double F2rel, double sigF2rel, double *Frel, double *sigFrel)
{
  if (F2rel > 0.) *Frel = sqrt(F2rel);
  else            *Frel = 0.;

  if (*Frel < Small && sigF2rel < Small)
    *sigFrel = 0.;
  else
    *sigFrel = sigF2rel / ((*Frel) + sqrt(sigF2rel + (*Frel) * (*Frel)));
}


static double GSAS_FWHM(double Theta)
{
  double  Sigma2, Gamma_g, gamma, Gamma;
  double  tan_Theta, tan2_Theta, cos_Theta, cos2_Theta;
  double  cos_phi;
  double  G1, G2, G3, G4, G5;
  double  g1, g2, g3, g4, g5;


  tan_Theta = tan(Theta);
  tan2_Theta = tan_Theta * tan_Theta;
  cos_Theta = cos(Theta);
  cos2_Theta = cos_Theta * cos_Theta;

  cos_phi = 1.;

  Sigma2 = GU * tan2_Theta + GV * tan_Theta + GW + GP / cos2_Theta;
  Gamma_g = sqrt(8. * Sigma2 * log(2.));

  gamma = (LX + sfec * cos_phi) / cos_Theta + (LY + stec * cos_phi) * tan_Theta;

  G1 = Gamma_g;
  G2 = Gamma_g * G1;
  G3 = Gamma_g * G2;
  G4 = Gamma_g * G3;
  G5 = Gamma_g * G4;

  g1 = gamma;
  g2 = gamma * g1;
  g3 = gamma * g2;
  g4 = gamma * g3;
  g5 = gamma * g4;

  Gamma =             G5
          + 2.69269 * G4 * g1
          + 2.42843 * G3 * g2
          + 4.47163 * G2 * g3
          + 0.07842 * G1 * g4
          +                g5;

  Gamma = pow(Gamma, 0.2) * .01;

  return Gamma;
}


static void usage(void)
{
  fprintf(stderr,
    "usage: %s [-focus|-xtal|-SirPow|-ACEgr] [-NoCheck] Phase# Histogram# GSAS_texp GSAS_reflist|read_refnnp\n",
    progn);
  exit(1);
}


int main(int argc, char *argv[])
{
  int   i, n;
  long  lcount;
  char  *fnin, buf[256];
  FILE  *fpin;
  int   mode, offset;

  int     F_focus, F_xtal, F_SirPow, F_ACEgr, F_NoCheck;
  int     PhaseNumber, HistogramNumber;
  char    *fnexp, *fnref;
  char    CRSp__ABC___[13];
  char    CRSp__ANGLES[13];
  char    HAPphhPRCF_[12];
  char    HST_hh_ICONS[13];
  char    fld[11], *cp, cc;
  double   val[4];
  int     ival[3];
  T_LatticeConstants  Lc;
  T_LatticeConstants  RLc;
  double  Lambda;

  int     Mul;
  double  ESD, Theta, FWHM, sinTL;


  F_focus   = 0;
  F_xtal    = 0;
  F_SirPow  = 0;
  F_ACEgr   = 0;
  F_NoCheck = 0;

  for (i = 1; i < argc; i++)
  {
    if (argv[i][0] != '-') break;

    if      (stricmp(argv[i], "-focus") == 0)
      F_focus = 1;
    else if (stricmp(argv[i], "-xtal") == 0)
      F_xtal  = 1;
    else if (stricmp(argv[i], "-SirPow") == 0)
      F_SirPow  = 1;
    else if (stricmp(argv[i], "-ACEgr") == 0)
      F_ACEgr = 1;
    else if (stricmp(argv[i], "-NoCheck") == 0)
      F_NoCheck = 1;
    else
      usage();
  }

  if (i < argc)
  {
        n = sscanf(argv[i++], "%d", &PhaseNumber);
    if (n != 1 || PhaseNumber < 1 || PhaseNumber > 9)
      usage();
  }
  else
    usage();

  if (i < argc)
  {
        n = sscanf(argv[i++], "%d", &HistogramNumber);
    if (n != 1 || HistogramNumber < 1 || HistogramNumber > 99)
      usage();
  }
  else
    usage();

  if (i < argc) fnexp = argv[i++];
  else          usage();

  if (i < argc) fnref = argv[i++];
  else          usage();

  if (i != argc)
    usage();

  if (F_xtal) cc = ':';
  else        cc = '#';

  putc(cc, stdout);
  for (i = 0; i < argc;)
    fprintf(stdout, " %s", argv[i++]);
  putc('\n', stdout);

  sprintf(CRSp__ABC___, "CRS%d  ABC   ", PhaseNumber);
  sprintf(CRSp__ANGLES, "CRS%d  ANGLES", PhaseNumber);
  sprintf(HAPphhPRCF_ , "HAP%d%2dPRCF ", PhaseNumber, HistogramNumber);
  sprintf(HST_hh_ICONS, "HST %2d ICONS", HistogramNumber);

  GU =  GV =  GW =
  LX =  LY =  trns =
  asym =  shft = GP =
  stec =  ptec = sfec = 0.;

  fnin = fnexp;

      fpin = fopen(fnin, "r");
  if (fpin == NULL)
  {
    fprintf(stderr, "%s: Can't open %s\n", progn, fnin);
    exit(1);
  }

  lcount = 0;

  while (fgetline(fpin, buf, sizeof buf))
  {
    lcount++;

    if      (   strbegin(buf, CRSp__ABC___) == 0
             || strbegin(buf, CRSp__ANGLES) == 0)
    {
      for (i = 0; i < 3; i++)
      {
               strxcpy(fld, &buf[12 + i * 10], 11);
            n = sscanf(fld, "%lf", &val[i]);
        if (n != 1 || val[i] <= 0.)
          IllegalLine(fnin, lcount);
      }

      if (strbegin(buf, CRSp__ABC___) == 0)
      {
        Lc.a = val[0];
        Lc.b = val[1];
        Lc.c = val[2];
      }
      else
      {
        Lc.alpha = val[0] * PIover180;
        Lc.beta  = val[1] * PIover180;
        Lc.gamma = val[2] * PIover180;
      }
    }
    else if (   strbegin(buf, HAPphhPRCF_) == 0
             && buf[11] != ' ')
    {
      if (buf[12] != ' ')
        IllegalLine(fnin, lcount);

      n = sscanf(&buf[12], "%lf %lf %lf %lf",
                           &val[0], &val[1], &val[2], &val[3]);

      switch(buf[11])
      {
        case '1': if (n != 4) IllegalLine(fnin, lcount);
                  GU   = val[0];
                  GV   = val[1];
                  GW   = val[2];
                  LX   = val[3]; break;
        case '2': if (n != 4) IllegalLine(fnin, lcount);
                  LY   = val[0];
                  trns = val[1];
                  asym = val[2];
                  shft = val[3]; break;
        case '3': if (n != 4) IllegalLine(fnin, lcount);
                  GP   = val[0];
                  stec = val[1];
                  ptec = val[2];
                  sfec = val[3]; break;
        case '4': if (n != 4) IllegalLine(fnin, lcount);
                  break;
        case '5': if (n != 2) IllegalLine(fnin, lcount);
                  break;
        default:
          IllegalLine(fnin, lcount);
      }
    }
    else if (strbegin(buf, HST_hh_ICONS) == 0)
    {
             strxcpy(fld, &buf[12], 11);
          n = sscanf(fld, "%lf", &val[0]);
      if (n != 1 || val[0] <= 0.)
        IllegalLine(fnin, lcount);

      Lambda = val[0];
    }
  }

  fclose(fpin);

  Lc.calcs = 1;
  Lc.calcc = 1;
  if (Lc2RLc(&Lc, &RLc) != 0)
    progerror("Illegal lattice constants");

  if (F_SirPow == 0)
  {
    fprintf(stdout, "%c UnitCell  %.6g %.6g %.6g  %.6g %.6g %.6g\n",
      cc,
      Lc.a, Lc.b, Lc.c,
      Lc.alpha / PIover180,
      Lc.beta  / PIover180,
      Lc.gamma / PIover180);

    fprintf(stdout, "%c Lambda  %.6g\n", cc, Lambda);
    fprintf(stdout, "%c GU    GV    GW    %8.1f  %8.1f  %8.1f\n", cc, GU, GV, GW);
    fprintf(stdout, "%c LX    LY    trns  %8.3f  %8.3f  %8.2f\n", cc, LX, LY, trns);
    fprintf(stdout, "%c asym  shft  GP    %8.4f  %8.4f  %8.1f\n", cc, asym, shft, GP);
    fprintf(stdout, "%c stec  ptec  sfec  %8.2f  %8.2f  %8.2f\n", cc, stec, ptec, sfec);
  }
  else
    fprintf(stdout, "   H   K   L       M     SINTL    2THETA      FWHM      F**2     SIGMA\n");

  fnin = fnref;

      fpin = fopen(fnin, "r");
  if (fpin == NULL)
  {
    fprintf(stderr, "%s: Can't open %s\n", progn, fnin);
    exit(1);
  }

  mode =
  offset =
  lcount = 0;

  while (fgetline(fpin, buf, sizeof buf))
  {
    lcount++;

    cp = buf; while (*cp == ' ') cp++;

    if (mode == 0)
    {
      if  (    strbegin(cp, "Iref  H  K  L Mul Icod D-space    Fosq") == 0
           ||  strbegin(cp, "Iref   H  K  L Mul Icod D-space    Fosq") == 0)
      {
        cp = buf; while (*cp == ' ') { cp++; offset++; }
        offset += 4;
        mode = 1;
      }
      else if (strbegin(cp, "#  H   K   L Mul Icod      Prfo  D-space   Lambda      Fosq  esd_Fosq") == 0)
        mode   = 2;
    }
    else if (isdigit(*cp) && strstr(cp, "REFLIST") == NULL)
    {
      if (mode == 1)
      {
        /* read HKL
         */
        for (i = 0; i < 3; i++)
        {
                 strxcpy(fld, &buf[offset + i * 3], 4);
              n = sscanf(fld, "%d", &ival[i]);
          if (n != 1)
            IllegalLine(fnin, lcount);
        }

        /* read Mul
         */
        strxcpy(fld, &buf[offset + 9], 5);
              n = sscanf(fld, "%d", &Mul);
          if (n != 1 || Mul < 1)
            IllegalLine(fnin, lcount);

        /* read D-space
         */
        strxcpy(fld, &buf[offset + 18], 9);
              n = sscanf(fld, "%lf", &val[0]);
          if (n != 1 || val[0] <= 0.)
            IllegalLine(fnin, lcount);

        /* read Fosq
         */
        strxcpy(fld, &buf[offset + 26], 11);
              n = sscanf(fld, "%lf", &val[1]);
          if (n != 1 || val[1] < 0.)
            IllegalLine(fnin, lcount);

        ESD = -1.;
      }
      else
      {
        n = sscanf(buf, "%d%d%d%d%*d%*d%*f%lf%*f%lf%lf",
                   &ival[0], &ival[1], &ival[2], &Mul, &val[0], &val[1], &ESD);

        if (n != 7 || Mul < 1 || val[0] <= 0. || val[1] < 0. || ESD < 0.)
          IllegalLine(fnin, lcount);
      }

      if (F_NoCheck == 0)
      {
        /* consistency check
         */
            val[2] = sqrt(Q_hkl(ival[0], ival[1], ival[2], &RLc));
        if (val[2] > 0.) val[2] = 1. / val[2];
        if (fabs(val[0] - val[2]) > 3.e-3)
        {
          fprintf(stderr, "%s: HKL %d %d %d\n",
            progn, ival[0], ival[1], ival[2]);
          fprintf(stderr, "%s: read D-space = %.5f  computed = %.5f\n",
            progn, val[0], val[2]);
          fprintf(stderr, "%s: HKL <-> D-space mismatch at line #%ld in %s\n",
            progn, lcount, fnin);
          exit(1);
        }
      }

      sinTL = sqrt(Q_hkl(ival[0], ival[1], ival[2], &RLc)) * .5;
      Theta = BraggTheta(ival[0], ival[1], ival[2], &RLc, Lambda);
      FWHM  = GSAS_FWHM(Theta);

      if      (F_focus)
      {
        if (ESD < 0.)
        {
          ReduceF2toF(val[1], 0., &val[2], &val[3]);

          fprintf(stdout, " %3d %3d %3d  %10.2f *  %8.5f\n",
            ival[0], ival[1], ival[2],
            val[2], FWHM);
        }
        else
        {
          ReduceF2toF(val[1], ESD, &val[2], &val[3]);

          fprintf(stdout, " %3d %3d %3d  %10.2f %10.3f  %8.5f\n",
            ival[0], ival[1], ival[2],
            val[2], val[3], FWHM);
        }
      }
      else if (F_SirPow)
      {
        if (ESD < 0.) ESD = 1.;

        fprintf(stdout, "%4d%4d%4d%8d%10.5f%10.4f%10.4f%10.0f%10.1f\n",
          ival[0], ival[1], ival[2],
          Mul / 2, sinTL, 2. * Theta / PIover180, FWHM, val[1], ESD);
      }
      else if (F_xtal)
      {
        if (ESD < 0.) ESD = 1.;

        fprintf(stdout, " %3d %3d %3d  %7.3f %8.5f",
          ival[0], ival[1], ival[2],
          2. * Theta / PIover180, FWHM);
        sprintf(buf, " %10.3e", val[1]);
        for (cp = buf; *cp; cp++)
          if (  isalpha(*cp)) putc(' ', stdout);
        for (cp = buf; *cp; cp++)
          if (! isalpha(*cp)) putc(*cp, stdout);
        sprintf(buf, " %10.4e", ESD);
        for (cp = buf; *cp; cp++)
          if (  isalpha(*cp)) putc(' ', stdout);
        for (cp = buf; *cp; cp++)
          if (! isalpha(*cp)) putc(*cp, stdout);
        putc('\n', stdout);
      }
      else if (F_ACEgr)
      {
        fprintf(stdout, "%7.3f %8.5f\n",
          2. * Theta / PIover180, FWHM);
      }
      else
      {
        if (ESD < 0.) ESD = 1.;

        fprintf(stdout, " %3d %3d %3d  %7.3f %8.5f %12.6g %12.6g\n",
          ival[0], ival[1], ival[2],
          2. * Theta / PIover180, FWHM,
          val[1], ESD);
      }
    }
  }

  fclose(fpin);

  return 0;
}
