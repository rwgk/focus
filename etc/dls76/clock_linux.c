#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>


/* string from ctime looks like:
 * Sun Sep 16 01:03:52 1973\n\0
 * 01234567890123456789012345
 * 0         1          2
 */


void idate_(int *month, int *day, int *year)
{
  long  pvec[2];
  char  str[32], *s;

  const char *MonName[] = {
    "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
    "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
  };

  time(pvec);
  strcpy(str, ctime(pvec));

  str[ 7] = '\0';
  str[10] = '\0';
  str[24] = '\0';
  for (s = &str[4]; *s; s++) *s = toupper(*s);

  for (*month = 0; *month < 12; (*month)++)
    if (strcmp(MonName[*month], &str[4]) == 0)
      break;
  (*month)++;
  if (*month > 12) *month = 1;

  sscanf(&str[8],  "%d", day);

  sscanf(&str[20], "%d", year);
  (*year) %= 100;
}


void time_(char *timestr, int len)
{
  long  pvec[2];
  char  str[32];
  int   i;

  time(pvec);
  strcpy(str, ctime(pvec));

  for (i = 0; i < len; i++) timestr[i] = ' ';
  if (len > 8) len = 8;
  for (i = 0; i < len; i++) timestr[i] = str[11 + i];
}
