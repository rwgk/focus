from libtbx import dict_with_default_0
import sys

def show(tag, pl_counts):
  pl = [int(s) for s in pl_counts.keys()]
  pl.sort()
  pl.reverse()
  ep = []
  for p in pl:
    ep.extend([str(p)]*pl_counts[str(p)])
  print ",".join(ep)

def run(args):
  max_n_it = 0
  for file_name in args:
    prev_tag = ""
    pl_counts = None
    for line in open(file_name).read().splitlines():
      if (not line.startswith(": ")): continue
      op = line.find(" (")
      cp = line.find(") ")
      assert op > 0
      assert cp > op
      pl = line[2:op].split()
      n_it = int(line[op+2:cp])
      if (n_it > max_n_it): max_n_it = n_it
      tag = line[cp+2:].split()[0]
      if (prev_tag != tag):
        if (len(prev_tag) != 0):
          show(prev_tag, pl_counts)
        prev_tag = tag
        pl_counts = dict_with_default_0()
      pl_c = dict_with_default_0()
      for p in pl:
        pl_c[p] += 1
      for p,c in pl_c.items():
        pl_counts[p] = max(pl_counts[p], c)
    if (prev_tag is not None):
      show(prev_tag, pl_counts)
  print "max_n_it:", max_n_it

if (__name__ == "__main__"):
  run(sys.argv[1:])
