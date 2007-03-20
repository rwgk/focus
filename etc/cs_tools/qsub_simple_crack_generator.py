import sys, os

libtbx_build = os.environ["LIBTBX_BUILD"]

def write_job_file(tag):
  job_file_name = "qj%s" % tag
  l_b = libtbx_build
  f = open(job_file_name, "w")
  f.write("""\
#! /bin/csh -q
#$ -cwd -o qo%(tag)s -j y
source %(l_b)s/setpaths.csh
libtbx.python "$HOME"/focus-etc/cs_tools/simple_crack.py %(tag)s.cs1000
""" % vars())
  f.close()
  return job_file_name

def run(args):
  submit = False
  if (len(args) == 1):
    assert args[-1] == "--submit"
    del args[-1]
    submit = True
  assert len(args) == 0
  for node in os.listdir("."):
    if (not node.endswith(".cs1000")): continue
    tag = node[:-7]
    job_file_name = write_job_file(tag=tag)
    if (submit):
      os.system("qsub %s" % job_file_name)

if (__name__ == "__main__"):
  run(sys.argv[1:])
