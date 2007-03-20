from __future__ import division
from td_from_focus_output import extract_section, extract_coseq
from libtbx import easy_run
import sys

def reformat_coseq(label, coseq):
  result = [label + " " + " ".join([str(v) for v in coseq[1:11]])]
  i = 11
  while (i < len(coseq)):
    result.append("     " + " ".join([str(v) for v in coseq[i:i+10]]))
    i += 10
  return result

def simple_crack(ftc, coseqs):
  result = []
  for label,coseq in coseqs.items():
    if (isinstance(coseq, str)): continue
    n = len(coseq)
    coseq_lines = reformat_coseq(label=label, coseq=coseq)
    procoseq_end_of_pl_line = ") %s %s" % (ftc, label)
    dcs = []
    dcs_max = 0
    success = None
    while not success:
      dcs_max += 1
      sum_dcs = dcs_max*(dcs_max+1)//2
      if (sum_dcs >= n-dcs_max): break
      dcs.append(str(dcs_max))
      for repetitions in xrange(1,dcs_max//2+2):
        if (success is not None): break
        if (sum_dcs * repetitions >= n-dcs_max): break
        mdcs = []
        for v in dcs: mdcs.extend([v]*repetitions)
        def run_procoseq(dcs):
          procoseq_result = easy_run.fully_buffered(
            command="procoseq -%s -dcs=%s" % (ftc, ",".join(dcs)),
            stdin_lines=coseq_lines).raise_if_errors()
          for line in procoseq_result.stdout_lines:
            if (line.startswith(": DCS Period Length ")):
              p = line.split()[-1]
              procoseq_out, success = run_procoseq(dcs=mdcs+[p])
              if (success is not None):
                return procoseq_out, success
            if (    line.startswith(":")
                and line.endswith(procoseq_end_of_pl_line)):
              return procoseq_result.stdout_lines, line
          return None, None
        procoseq_out, success = run_procoseq(dcs=mdcs)
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
