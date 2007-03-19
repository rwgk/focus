import sys, os

def write_job_file(tag):
  job_file_name = "qj%s" % tag
  f = open(job_file_name, "w")
  f.write("""\
#! /bin/csh -q
#$ -cwd -o qo%(tag)s -j y
./focus -siteframe -sitelabel -coseqsplit=500000 -coseq=1000 %(tag)s.fis >& %(tag)s.cs1000
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
    if (not node.endswith(".fis")): continue
    tag = node[:-4]
    job_file_name = write_job_file(tag=tag)
    if (submit):
      os.system("qsub %s" % job_file_name)

if (__name__ == "__main__"):
  run(sys.argv[1:])
