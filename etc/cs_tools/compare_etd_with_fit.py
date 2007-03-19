from __future__ import division
from scitbx.array_family import flex
from boost import rational
from libtbx import easy_run
import sys, os

def extract_etd_a(file_name):
  result = None
  for line in open(file_name).read().splitlines():
    i = line.find("<a>=")
    if (i < 0): continue
    a = rational.int(*[int(v) for v in line[i+4:].split()[0].split("/")])
    if (result is None):
      result = a
    else:
      assert result == a
  return result

def get_rcs_terms(itpl_file_name, n):
  result = []
  lines = easy_run.fully_buffered(
    command="rcs %s %d" % (itpl_file_name, n)) \
      .raise_if_errors() \
      .stdout_lines
  fwc = None
  labels = []
  terms = None
  for line in lines:
    if (not line.startswith("#")):
      terms.append(int(line))
    elif (line.startswith("# O(IT) = ")):
      f,label = " ".join(line.split()[13:-4]).split(None, 1)
      if (fwc is None):
        fwc = f
      else:
        assert fwc == f
      labels.append(label)
      assert terms is None
      terms = flex.size_t()
    elif (terms is not None):
      result.append(terms)
      terms = None
  assert terms is None
  print "labels:", " ".join(labels)
  return result

def mean_a(terms, n_tail=100):
  as = flex.double()
  for k,n in enumerate(terms):
    if (k == 0): continue
    as.append(n / k**2)
  return flex.mean(as[-n_tail:])

def run(args):
  for etd_file_name in args:
    print etd_file_name
    etd_a = extract_etd_a(file_name=etd_file_name)
    print etd_a,
    if (etd_a is not None): print float(etd_a),
    print
    itpl_file_name = etd_file_name.replace(".etd", ".itpl")
    assert os.path.isfile(itpl_file_name)
    list_of_terms = get_rcs_terms(itpl_file_name=itpl_file_name, n=1000)
    mean_mean_a = flex.mean(flex.double([
      mean_a(terms=terms) for terms in list_of_terms]))
    print mean_mean_a
    if (etd_a is not None):
      print "DELTA %.6f" % (mean_mean_a - float(etd_a))
      print etd_file_name, "<a>/3=%.3f" % (float(etd_a)/3)

if (__name__ == "__main__"):
  run(sys.argv[1:])
