from __future__ import division
from td_from_focus_output import extract_section, extract_coseq
from libtbx import easy_run
import sys

dcs_lib = """\
1,1,1
3,3,1
3,3,1
3,3,1
4,3,1
4,3,1
4,3,1
4,3,3,3
4,4,4
4,4,4,3
4,4,4,3,3
4,4,4,3,3
5,1,1
5,1,1
5,3,1
5,3,1
5,4,1
5,4,3,1
5,5,1
5,5,1
5,5,4,4
5,5,4,4,3
6,5,4,3
6,5,5
6,5,5,3
6,6,4
6,6,4,3,3
6,6,4,4,3
7,1,1
7,5,4
7,5,4,3
7,5,4,3,3
7,6,1
7,6,5
7,6,5,4
7,6,5,5
7,7,5,4
7,7,6,5,4,4,4,3
8,4,3,1
8,5,1
8,6,3,3,2
8,6,5,5,4,4
8,8,1,1
8,8,6,6,4,3
9,7,5,4
9,8,5,1
9,8,7
9,8,7,1
9,9,4
10,1,1
10,10,5,4,3
10,10,7,6,6,3,3
10,10,8,8,6,5,4,4,3
10,5,5,1
10,7,6,5,4
10,7,6,5,5,4
10,8,1
10,8,4,4
10,8,6,6,3
10,8,7,6,5,4
10,9,7
10,9,8
11,10,7,3
11,10,8,6,4,3
11,10,8,7,6,5,4
11,11,10,6,5,5,5,4,3
11,8,7,3
11,8,7,7,6,5,5,4,4,3
11,9,7,6,5,5,5,4
12,10,10,8,8,7,6,5,4,4
12,10,10,8,8,7,7,6,5,4,4
12,10,5
12,10,8,8,4,3
12,10,8,8,5,4,4,3,3
12,11,10,10,7,5,3
12,11,10,10,9,9
12,11,10,7,5,3
12,12,10,10,5,5,3
12,12,11,11,7,7,6
12,12,11,11,9,9,7,6,5
12,12,11,11,9,9,7,6,5,5
12,6,5,4,3
12,7,6,5
12,7,6,5
12,9,5,4,4
13,10,10,8,6,5,3
13,10,8,5,3
13,10,9,7,6,5,5,4,3
13,11,10,10,9,8,6,6,5
13,11,11,7,7,6,5,3
13,12,12,11,11,10,10,5,5,3
13,13,10,10,8,7,6,6,5,4
13,13,8,6,6,5,4
14,11,10,8,7
14,12,10,8,7,6,5,4
14,12,7,5,3,3
14,12,7,6,4,3,1
14,13,10,8,6
14,13,13,9,8,8,7,6,6,4,4,3
14,14,12,12,10,10,9,7,5,5
14,14,7,7,5,4
14,7,5,4
14,8,7,5,5
15,10,10,8,8,4,3,3
15,13,12,10,9,4
15,14,10,10,8,8,7,4,3
15,14,13,12,10,9,9,8,7,7,4
15,5,5,1
16,10,8,8,5,4
16,12,10,10,7,6,4,3
16,12,10,8,8,4,3
16,12,11,8,5,3
16,12,12,8,6
16,13,11,10,8,7,5
16,14,13,12,10,10,9,8,5,5
16,14,8,1
16,15,11,7
17,14,13,10,8,5,4,3
17,16,14,10,7,5,4,4,3
18,14,13,11,11,8,7,7,4
18,8,6,4
19,14,11,9,8,7,5,5
19,15,9,7,6
19,17,14,13,8,5,3
20,14,13,13,9,8,7,6
20,16,10,10,8,6,3,3
20,16,13,12,11,10,9,6
20,20,10,10,5,4,3
20,20,18,18,14,14,11,11,9,9,7,7,5
20,5,5,1
21,13,12,11,10,8,8
21,21,16,16,12,12,10,8,8,6,5
21,5,4
22,11,7,1
22,19,16,11,11,10,8,5
22,19,17,16,11,11,8,8,7,7
22,20,15,13,12,12,6,3
23,12,10,7,5
23,20,15,13,7,3
23,22,17,15,12,10,9,7
23,22,18,15,14,11,10,9
24,14,13,11,11,10,5
24,16,14,12,8
24,22,19,18,17,15,14,13,12,11,10,9,7,6,4
24,23,18,10,8,7
25,18,13,12,12,10,9,6,3
25,23,21,20,20,18,18,15,14,14,13,12,11,11,9
26,22,16,12,12,12,10,5
26,22,20,13,13,12,10,8,6,6,5
26,25,20,16,15,13,12,11,10,7,6,3
28,22,1
28,24,16
30,15,13,9,8,8,6,6,5,4,4
30,15,5,1
30,16,14,12,12,11,10,9,6,5,5
30,24,21,19,18,16,15,15,13,12,12,11,7
30,5,5,1
31,19,18,10
32,27,24,23,22,22,20,18,17,14,13,11,10,7,6,5
32,30,15,7,6,5
34,31,17,16,14,13,10,8,7,5,4
35,5,1
36,26,24,23,22,21,20,17,14,10,8,5
38,32,27,26,26,21,21,19,19,11,8,8,6
38,36,32,30,25,24,23,21,16,13
40,20,5,1
40,31,28,27,27,24,24,22,21,20,18,16,12,12,11,11,8
40,32,26,24,24,21,20,17,16,14,13,10,5,3
40,39,34,26,20,19
52,44,42,40,36,34,32,30,29,27,26,25,24,23,22,20,19,18,16,15,12,11,7
56,47,44,43,37,31,30,26,25,24,21,20,19,15,15,10,9
58,57,35,32,26,21,18,13,12,11,8,5
60,30,26,20,15,12,10,8,6,5
65,61,47,43,32,31,30,29,26,22,19,18,12,11,9,8,4
70,46,35,34,32,23,22,17,14,13,10,8,5
94,80,49,43,40,23,15,11,8,4
"""

def reformat_coseq(label, coseq):
  result = [label + " " + " ".join([str(v) for v in coseq[1:11]])]
  i = 11
  while (i < len(coseq)):
    result.append("     " + " ".join([str(v) for v in coseq[i:i+10]]))
    i += 10
  return result

def run_procoseq(ftc, label, coseq_lines, dcs):
  procoseq_result = easy_run.fully_buffered(
    command="procoseq -%s -dcs=%s" % (ftc, ",".join(dcs)),
    stdin_lines=coseq_lines).raise_if_errors()
  procoseq_end_of_pl_line = ") %s %s" % (ftc, label)
  for line in procoseq_result.stdout_lines:
    if (line.startswith(": DCS Period Length ")):
      p = line.split()[-1]
      procoseq_out, success = run_procoseq(
        ftc=ftc, label=label, coseq_lines=coseq_lines, dcs=dcs+[p])
      if (success is not None):
        return procoseq_out, success
    if (    line.startswith(":")
        and line.endswith(procoseq_end_of_pl_line)):
      return procoseq_result.stdout_lines, line
  return None, None

def simple_crack(ftc, coseqs):
  result = []
  for label,coseq in coseqs.items():
    if (isinstance(coseq, str)): continue
    n = len(coseq)
    coseq_lines = reformat_coseq(label=label, coseq=coseq)
    success = None
    for dcs in dcs_lib.splitlines():
      procoseq_out, success = run_procoseq(
        ftc=ftc, label=label, coseq_lines=coseq_lines, dcs=dcs.split(","))
      if (success is not None):
        break
    dcs = []
    dcs_max = 0
    while (success is None):
      dcs_max += 1
      sum_dcs = dcs_max*(dcs_max+1)//2
      if (sum_dcs >= n-dcs_max): break
      dcs.append(str(dcs_max))
      for repetitions in xrange(1,dcs_max//2+2):
        if (success is not None): break
        if (sum_dcs * repetitions >= n-dcs_max): break
        mdcs = []
        for v in dcs: mdcs.extend([v]*repetitions)
        procoseq_out, success = run_procoseq(
          ftc=ftc, label=label, coseq_lines=coseq_lines, dcs=mdcs)
    if (success is None):
      result.append("# No success with dcs max %s: %s %s" % (
        dcs_max, ftc, label))
    else:
      itpl_lines = extract_section(
        lines=procoseq_out, label="itpl")
      rcs_result = easy_run.fully_buffered(
        command="rcs -reduceit",
        stdin_lines = itpl_lines).raise_if_errors()
      result.extend(rcs_result.stdout_lines)
  return result

def run(args):
  for file_name in args:
    print file_name
    ftc, csxxxx = file_name.split(".")
    assert csxxxx.startswith("cs")
    coseqs = extract_coseq(lines=open(file_name).read().splitlines())
    crack_result = simple_crack(ftc=ftc, coseqs=coseqs)
    print >> open("%s.itpl" % ftc, "w"), "\n".join(crack_result)

if (__name__ == "__main__"):
  run(sys.argv[1:])
