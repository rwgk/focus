#include <stdio.h>
#include <stdlib.h>


static const char *progn = "fixrec80";


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


void usage(void)
{
  fprintf(stderr, "usage: %s [gsas-file]\n", progn);
  exit(1);
}


int main(int argc, char *argv[])
{
  int          iarg, i;
  long         lcount;
  char         *fnin, buf[81], *cp;
  FILE         *fpin;


  fnin = NULL;
  fpin = NULL;

  for (iarg = 1; iarg < argc; iarg++)
  {
    if (argv[iarg][0] == '-') usage();

    if (fnin) usage();
    fnin = argv[iarg];
  }

  if (fnin == NULL)
    fpin = stdin;
  else
  {
        fpin = fopen(fnin, "r");
    if (fpin == NULL)
    {
      fprintf(stderr, "%s: Can't open %s\n", progn, fnin);
      exit(1);
    }
  }

  lcount = 0;

  while (fgetline(fpin, buf, sizeof buf))
  {
    lcount++;

    cp = buf;
    for (i = 0; i < 80; i++)
    {
      if (*cp)
        putc(*cp++, stdout);
      else
        putc(' ', stdout);
    }
  }

  fclose(fpin);

  return 0;
}
