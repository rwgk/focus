"""
iotbx.python $HOME/focus-etc/cs_tools/strudat_as_fis.py $HOME/iza/web_atlas/strudat_web_atlas_20070316 --coseq $HOME/focus-etc/kriber/coseq
"""

from td_from_focus_output import extract_section, extract_coseq
from cctbx.crystal import coordination_sequences
from cctbx import xray
from cctbx import crystal
from iotbx.command_line.show_distances import display
from iotbx.kriber import strudat
from iotbx.option_parser import option_parser
from libtbx import easy_run
from libtbx import dict_with_default_0
from cStringIO import StringIO
import sys, os

def format_focus_input(tag, xray_structure, term_table):
  min_sym_nodes = 0
  for scatterer in xray_structure.scatterers():
    min_sym_nodes += scatterer.multiplicity()
  node_types = dict_with_default_0()
  for terms in term_table:
    node_types[terms[1]] += 1
  out = StringIO()
  print >> out, "Title Code", tag
  print >> out, "SpaceGroup", \
    str(xray_structure.space_group_info()).replace(" ","")
  print >> out, "UnitCell", \
    str(xray_structure.unit_cell())[1:-1].replace(",", "")
  print >> out, "MinNodeDistance 2.7"
  print >> out, "MinSymNodes", min_sym_nodes
  for node_type,count in node_types.items():
    print >> out, "NodeType  %d  %d" % (node_type, count)
  print >> out, "CheckTetrahedralGeometry Off"
  for scatterer in xray_structure.scatterers():
    print >> out, "%-4s" % scatterer.label, \
      "%8.5f %8.5f %8.5f" % scatterer.site
  print >> out, "End"
  return out.getvalue()

def run(args):
  command_line = (option_parser(
    usage="iotbx.python strudat_as_fis.py [options] studat_file [...]")
    .option(None, "--tag",
      action="store",
      type="string",
      help="tag as it appears in the strudat file")
    .option(None, "--coseq",
      action="store",
      type="string",
      help="name of file with known coordination sequences",
      metavar="FILE")
  ).process(args=args)
  if (len(command_line.args) == 0):
    command_line.parser.show_help()
    return
  if (command_line.options.coseq is not None):
    coseq_dict = coordination_sequences.get_kriber_coseq_file(
      file_name=command_line.options.coseq)
  else:
    coseq_dict = None
  n_fis = 0
  n_errors = 0
  for file_name in command_line.args:
    strudat_entries = strudat.read_all_entries(open(file_name))
    for entry in strudat_entries.entries:
      if (    command_line.options.tag is not None
          and command_line.options.tag != entry.tag):
        continue
      print "strudat tag:", entry.tag
      print
      xray_structure = entry.as_xray_structure()
      pairs, term_table = display(
        distance_cutoff=3.4,
        show_cartesian=False,
        max_shell=10,
        coseq_dict=coseq_dict,
        xray_structure=xray_structure)
      fis = format_focus_input(
        tag=entry.tag,
        xray_structure=xray_structure,
        term_table=term_table)
      open("tmp.fis", "w").write(fis)
      open("%s.fis" % entry.tag, "w").write(fis)
      n_fis += 1
      if (os.path.isfile("tmp.fo")):
        os.remove("tmp.fo")
      assert not os.path.isfile("tmp.fo")
      focus_run = easy_run.fully_buffered(
        command="focus -siteframe -sitelabel -coseq=10 tmp.fis > tmp.fo")
      focus_run.raise_if_errors_or_output()
      lines = open("tmp.fo").read().splitlines()
      focus_coseq = extract_coseq(lines=lines)
      for scatterer,terms in zip(xray_structure.scatterers(), term_table):
        focus_terms = focus_coseq[scatterer.label]
        if (list(terms) != focus_terms):
          print "ERROR:", entry.tag
          print "  cctbx", list(terms)
          print "  focus", focus_terms
          n_errors += 1
  print "Number of .fis files written:", n_fis
  print "Number of errors:", n_errors
  for file_name in ["tmp.fis", "tmp.fo"]:
    if (os.path.isfile(file_name)):
      os.remove(file_name)

if (__name__ == "__main__"):
  run(sys.argv[1:])
