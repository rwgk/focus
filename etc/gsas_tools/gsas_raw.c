/*
  gsas_raw: a simple tool to build GSAS raw files

  (c) 1995 Ralf Grosse Kunstleve, ETH Zurich
  email: ralf@kristall.erdw.ethz.ch

  Permission to use, copy, modify, and distribute this software for any
  purpose and without fee is hereby granted, provided that the above
  copyright notice appears in all copies. This software is provided "as is"
  and without any express or implied warranties.
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


char     *progn = "gsas_raw";


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


#define progerror(message) p_rogerror(message, __LINE__)

static void p_rogerror(char *message, int source_code_line)
{
  fflush(stdout);
  fprintf(stderr, "%s(%d): %s\n", progn, source_code_line, message);
  exit(1);
}


#define NotEnoughCore() N_otEnoughCore(__LINE__)

static void N_otEnoughCore(int source_code_line)
{
  p_rogerror("Not enough core", source_code_line);
}


#define FormatError(type, istep) F_ormatError(type, istep, __LINE__)

static void F_ormatError(char *type, long istep, int source_code_line)
{
  fflush(stdout);
  fprintf(stderr, "\n%s(%d): %s format error for step #%ld: value too large\n",
    progn, source_code_line, type, istep);
  exit(1);
}


static void usage(void)
{
  fprintf(stderr, "usage: %s [-ESD|RALF] [counts-file]\n", progn);
  exit(1);
}


#define BlockSize_buffer 1024


int main(int argc, char *argv[])
{
  int   i, n;
  char  *fnin;
  FILE  *fpin;
  char  buf[128];

  int    Flag_ESD, Flag_RALF;
  long   istep, steps_per_line;
  float  tof, counts, esd;

  float  *tof_buffer, *counts_buffer, *esd_buffer;
  long   N_buffer;


     tof_buffer = NULL;
  counts_buffer = NULL;
     esd_buffer = NULL;

  Flag_RALF = 0;
  Flag_ESD = 0;
  fnin = NULL;

  for (i = 1; i < argc; i++)
  {
    if (argv[i][0] == '-')
    {
      if      (stricmp(argv[i], "-ESD") == 0 && Flag_ESD == 0)
        Flag_ESD = 1;
      else if (stricmp(argv[i], "-RALF") == 0 && Flag_RALF == 0)
        Flag_RALF = 1;
      else
        usage();
    }
    else if (fnin == NULL)
      fnin = argv[i];
    else
      usage();
  }

  if (Flag_RALF)
    Flag_ESD = 1;

  if (fnin)
  {
        fpin = fopen(fnin, "r");
    if (fpin == NULL)
    {
      fprintf(stderr, "%s: Can't open %s\n", progn, fnin);
      exit(1);
    }
  }
  else
    fpin = stdin;

                             N_buffer = BlockSize_buffer;
      counts_buffer = malloc(N_buffer * sizeof (*counts_buffer));
  if (counts_buffer == NULL)
    NotEnoughCore();

  if (Flag_ESD)
  {
        esd_buffer = malloc(N_buffer * sizeof (*esd_buffer));
    if (esd_buffer == NULL)
      NotEnoughCore();
  }

  if (Flag_RALF)
  {
        tof_buffer = malloc(N_buffer * sizeof (*tof_buffer));
    if (tof_buffer == NULL)
      NotEnoughCore();
  }

  if      (Flag_RALF) steps_per_line =  4;
  else if (Flag_ESD)  steps_per_line =  5;
  else                steps_per_line = 10;

  istep = 0;

  for (;;)
  {
    if (Flag_RALF)
    {
      if ((n = fscanf(fpin, "%f", &tof)) == EOF || n != 1)
        break;

      if ((n = fscanf(fpin, "%f", &counts)) == EOF || n != 1)
      {
        fprintf(stderr, "%s(%d): Error: TOF but no Counts for step #%ld\n",
          progn, __LINE__, istep);
        exit(1);
      }
    }
    else
    {
      if ((n = fscanf(fpin, "%f", &counts)) == EOF || n != 1)
        break;
    }

    if (Flag_ESD)
    {
      if ((n = fscanf(fpin, "%f", &esd)) == EOF || n != 1)
      {
        fprintf(stderr, "%s(%d): Error: Counts but no ESD for step #%ld\n",
          progn, __LINE__, istep);
        exit(1);
      }
    }

    if (istep == N_buffer)
    {
                                       N_buffer += BlockSize_buffer;
          counts_buffer
              = realloc(counts_buffer, N_buffer * sizeof (*counts_buffer));
      if (counts_buffer == NULL)
        NotEnoughCore();

      if (Flag_ESD)
      {
            esd_buffer
              = realloc(   esd_buffer, N_buffer * sizeof (   *esd_buffer));
        if (esd_buffer == NULL)
          NotEnoughCore();
      }

      if (Flag_RALF)
      {
            tof_buffer
              = realloc(   tof_buffer, N_buffer * sizeof (   *tof_buffer));
        if (tof_buffer == NULL)
          NotEnoughCore();
      }
    }

    if (Flag_RALF)
         tof_buffer[istep] = tof;

      counts_buffer[istep] = counts;

    if (Flag_ESD)
         esd_buffer[istep] = esd;

    istep++;
  }

  fclose(fpin);

  if (istep == 0)
    exit(0);

                                         N_buffer = istep;
  counts_buffer = realloc(counts_buffer, N_buffer * sizeof (*counts_buffer));
  if (Flag_ESD)
     esd_buffer = realloc(   esd_buffer, N_buffer * sizeof (   *esd_buffer));
  if (Flag_RALF)
     tof_buffer = realloc(   tof_buffer, N_buffer * sizeof (   *tof_buffer));

  fprintf(stdout, "Put your Title here\n");

  if (! Flag_RALF)
  {
    fprintf(stdout, "BANK 1 %ld %ld CONST 0.0000 0.0000 0 0 ",
      N_buffer, (N_buffer + steps_per_line - 1) / steps_per_line);
    if (Flag_ESD)
      fprintf(stdout, "ESD");
    else
      fprintf(stdout, "STD");
  }
  else
  {
    float  bcoef1, bcoef2, bcoef3, bcoef4;

    bcoef1 = tof_buffer[0] * 32.;
    bcoef3 = tof_buffer[1] * 32.;
    bcoef2 = bcoef3 - bcoef1;
    bcoef4 = bcoef2 / bcoef3;

    fprintf(stdout, "BANK 1 %ld %ld RALF %.0f %.0f %.0f %.6g ALT",
      N_buffer, (N_buffer + steps_per_line - 1) / steps_per_line,
      bcoef1, bcoef2, bcoef3, bcoef4);
  }

  if      (Flag_RALF)
  {
    for (istep = 0; istep < N_buffer; istep++)
    {
      if (istep % steps_per_line == 0)
        putc('\n', stdout);

      sprintf(buf, "%8.0f", tof_buffer[istep] * 32.);
      fprintf(stdout, "%s", buf);
      if (strlen(buf) != 8)
        FormatError("TOF", istep);

      sprintf(buf, "%7.4f", counts_buffer[istep]);
      fprintf(stdout, "%s", buf);
      if (strlen(buf) != 7)
        FormatError("Counts", istep);

      sprintf(buf, "%5.4f", esd_buffer[istep]);
      if (buf[0] == '0' && buf[1] == '.')
        fprintf(stdout, "%s", &buf[1]);
      else
      {
        fprintf(stdout, "%s", buf);
        FormatError("ESD", istep);
      }
    }
  }
  else if (Flag_ESD)
  {
    for (istep = 0; istep < N_buffer; istep++)
    {
      if (istep % steps_per_line == 0)
        putc('\n', stdout);

      sprintf(buf, "%.6g", counts_buffer[istep]);
      if (strchr(buf, '.') == NULL) strcat(buf, ".");
      fprintf(stdout, "%s", buf);
      i = strlen(buf);
      if (i > 8) FormatError("Counts", istep);
      while (i++ < 8) putc(' ', stdout);

      sprintf(buf, "%.6g", esd_buffer[istep]);
      if (strchr(buf, '.') == NULL) strcat(buf, ".");
      fprintf(stdout, "%s", buf);
      i = strlen(buf);
      if (i > 8) FormatError("ESD", istep);
      while (i++ < 8) putc(' ', stdout);
    }
  }
  else
  {
    for (istep = 0; istep < N_buffer; istep++)
    {
      if (istep % steps_per_line == 0)
        putc('\n', stdout);

      sprintf(buf, "  %6.0f", counts_buffer[istep]);
      fprintf(stdout, "%s", buf);
      if (strlen(buf) != 8)
        FormatError("Counts", istep);
    }
  }

  putc('\n', stdout);

  return 0;
}
