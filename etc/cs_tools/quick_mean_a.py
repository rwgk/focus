from libtbx import easy_run
import sys

def run(args):
  for file_name in args:
    assert file_name.endswith(".itpl")
    command = "rcs -s -v -UseLCM -iFP %s 10000000 > %s" % (
      file_name, file_name.replace(".itpl", ".etd"))
    print command
    sys.stdout.flush()
    easy_run.call(command=command)

if (__name__ == "__main__"):
  run(sys.argv[1:])
