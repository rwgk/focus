import math

def adopt_init_args(obj, args):
  del args["self"]
  obj.__dict__.update(args)

class dict_with_default_factory(dict):

  def __init__(self, default_factory):
    self.default_factory = default_factory

  def __getitem__(self, key):
    try: return dict.__getitem__(self, key)
    except: pass
    val = self.default_factory()
    dict.__setitem__(self, key, val)
    return val

class command_line_options:

  def __init__(self, argv, keywords):
    self.keywords = keywords
    self.n = 0
    for keyword in keywords:
      setattr(self, keyword, 0)
    self.regular_args = []
    for arg in argv:
      if (not arg.startswith("--")):
        self.regular_args.append(arg)
        continue
      if (not arg[2:] in keywords):
        raise AssertionError, "Unknown option: " + arg
      setattr(self, arg[2:], 1)
      self.n += 1

def apply_rstrip(list_of_strings):
  for i in xrange(len(list_of_strings)):
    list_of_strings[i] = list_of_strings[i].rstrip()

class empty: pass

class read_gsas_exp:

  def __init__(self, file_object, file_name):
    self.file_name = file_name
    self.plain_file = file_object.readlines()
    import re
    # ('      DESCR ',2X,A66)DESCR
    # ('CRSp  ABC   ',3F10.6,4X,A1,4X,I1)(ABC(I),I=1,3),IREF,IDAMP
    # ('CRSp  ANGLES',3F10.4)ANGLES(I),I=1,3
    # ('CRSp  SG SYM',2X,A20)SPSGSYM
    # ('HST hh ICONR',3F10.0,2X,3A1,4X,I1,F10.0,I5,F10.0) # not correct!
    # ('HST hh NREF ',I5,F10.4,2(4X,A1))NREF,DMIN,IFFOS,IFFCS
    #   DIFC,DIFA,ZERO,IREF,IDAMP,POLA,IPOLA,KRATIO
    # ('HAPphhPRCF  ',2I5,F10.5,4X,I1,20A1)
    #   PTYP,NCOF,CTOF,IDAMP,(IREF(I),I=1,NCOF)
    # ('HAPphhPRCF c',4E15.6)(COF(I),I=1,NCOF)
    #              c = 1 to 1+(NCOF-1)/4
    apply_rstrip(self.plain_file)
    CRS = dict_with_default_factory(empty)
    HST = dict_with_default_factory(empty)
    HAP = dict_with_default_factory(empty)
    for line in self.plain_file:
      m = re.match(
        r"      DESCR   (.{1,66})", line)
      if (m):
        self.DESCR = m.group(1).strip()
        continue
      m = re.match(
        r"CRS(...)ABC   (.{10})(.{10})(.{10})    (.)    (\d)", line)
      if (m):
        CRS[int(m.group(1))].ABC = tuple(
          [float(m.group(i+2)) for i in xrange(3)])
        continue
      m = re.match(
        r"CRS(...)ANGLES(.{10})(.{10})(.{10})", line)
      if (m):
        CRS[int(m.group(1))].ANGLES = tuple(
          [float(m.group(i+2)) for i in xrange(3)])
        continue
      m = re.match(
        r"CRS(...)SG SYM  (.{1,22})", line)
      if (m):
        CRS[int(m.group(1))].SG_SYM = m.group(2).strip()
        continue
      m = re.match(r"HST(...) ICONR(.{10})", line)
      if (m):
        HST[int(m.group(1))].ICONR_DIFC = float(m.group(2))
        continue
      m = re.match(r"HST(...) NREF (.{5})", line)
      if (m):
        HST[int(m.group(1))].NREF = int(m.group(2))
        continue
      m = re.match(r"HAP(.)(..)PRCF ([ 0-9])(.*)", line)
      if (m):
        phase_id = int(m.group(1))
        histogram_id = int(m.group(2))
        key = m.group(3)
        if (key == " "): key = "0"
        setattr(HAP[(phase_id,histogram_id)], "key"+key, m.group(4))
        continue
    self.CRS = dict(CRS)
    self.HST = dict(HST)
    self.HAP = dict(HAP)

  def get_unit_cell_parameters(self, phase_id):
    CRSp = self.CRS[phase_id]
    return CRSp.ABC + CRSp.ANGLES

  def get_space_group_symbol(self, phase_id):
    CRSp = self.CRS[phase_id]
    return CRSp.SG_SYM

  def get_wave_length(self, histogram_id):
    HSThh = self.HST[histogram_id]
    return HSThh.ICONR_DIFC

  def get_nref(self, histogram_id):
    HSThh = self.HST[histogram_id]
    return HSThh.NREF

  def init_validate(self, phase_id, histogram_id, other_file_name):
    import sys
    from cctbx_boost import uctbx
    from cctbx_boost import sgtbx
    print "Validating:"
    print " ", self.file_name
    print "    phase id:", phase_id
    print "    histogram id:", histogram_id
    print " ", other_file_name
    info = empty()
    info.unit_cell = uctbx.UnitCell(self.get_unit_cell_parameters(phase_id))
    info.space_group = sgtbx.SpaceGroup(sgtbx.SpaceGroupSymbols(
      self.get_space_group_symbol(phase_id)))
    info.wave_length = self.get_wave_length(histogram_id)
    return info

class gsas_rfl_record:
  def __init__(self, ihkl,mul,stol,tth,fwhm,fosq,sig,fobs,id,phas):
    adopt_init_args(self, locals())

class read_gsas_rfl:

  def __init__(self, file_object, file_name):
    self.file_name = file_name
    # (3I4,I8,F10.7,2F10.3,F10.0,F10.1,F10.4,I4,F10.3)
    records = []
    for line in file_object.xreadlines():
      ihkl = tuple([int(line[i*4:(i+1)*4]) for i in xrange(3)])
      rest = line[12:]
      if (ihkl == (0,0,0)):
        assert rest.strip() == "-100.0000   1"
        break
      flds = []
      for n in (8,10,10,10,10,10,10,4,10):
        flds.append(rest[:n])
        rest = rest[n:]
      mul,stol,tth,fwhm,fosq,sig,fobs,id,phas = [float(s) for s in flds]
      mul,                            id      = [int(flds[i]) for i in (0,7)]
      records.append(
        gsas_rfl_record(ihkl,mul,stol,tth,fwhm,fosq,sig,fobs,id,phas))
    self.records = records

  def prune(self, gsas_exp, histogram_id=1):
    nref = gsas_exp.get_nref(histogram_id)
    if (len(self.records) > nref):
      self.records = self.records[:nref]

  def validate(self, gsas_exp, phase_id=1, histogram_id=1):
    info = gsas_exp.init_validate(phase_id, histogram_id, self.file_name)
    for r in self.records:
      mul = info.space_group.multiplicity(r.ihkl, 1)
      assert r.mul == mul, (r.ihkl, r.mul, mul)
      stol = info.unit_cell.stol(r.ihkl)
      assert abs(r.stol - stol) < 1.e-4, (r.ihkl, r.stol, stol)
      tth = info.unit_cell.two_theta_deg(r.ihkl, info.wave_length)
      assert abs(r.tth - tth) < 1.e-2, (r.ihkl, r.tth, tth)
    print "OK"

class divide_pr_record:
  def __init__(self, hkl,m,e,sintl,ttheta,hw,fold,fnew):
    adopt_init_args(self, locals())

class read_divide_pr:

  def __init__(self, file_object, file_name):
    self.file_name = file_name
    header_line = "H  K  L  M  E  SINTL   2THETA  HW(TT)  GROUP |F|**2OLD" \
      + " |F|**2NEW    |F|OLD    |F|NEW      ACAL   |E|OLD |E|NEW"
    mode = 0
    for line in file_object.xreadlines():
      if (mode == 0):
        if (line.strip() == header_line):
          offs = line.index("H") - 2
          records = []
          mode = 1
      else:
        if (len(line.strip()) == 0):
          mode = 0
        else:
          l = line[offs:]
          hkl = tuple([int(l[i*3:(i+1)*3]) for i in xrange(3)])
          m = int(l[9:12])
          e = int(l[12:15])
          sintl = float(l[15:22])
          ttheta = float(l[22:31])
          hw = float(l[31:39])
          fold = float(l[66:76])
          fnew = float(l[76:86])
          records.append(
            divide_pr_record(hkl,m,e,sintl,ttheta,hw,fold,fnew))
    self.records = records

  def validate(self, gsas_exp, phase_id=1, histogram_id=1):
    info = gsas_exp.init_validate(phase_id, histogram_id, self.file_name)
    for r in self.records:
      m = info.space_group.multiplicity(r.hkl, 1) / 2
      assert r.m == m, (r.hkl, r.m, m)
      e = info.space_group.epsilon(r.hkl) * 2
      assert r.e == e, (r.hkl, r.e, e)
      sintl = info.unit_cell.stol(r.hkl)
      assert abs(r.sintl - sintl) < 1.e-2, (r.hkl, r.sintl, sintl)
      ttheta = info.unit_cell.two_theta_deg(r.hkl, info.wave_length)
      assert abs(r.ttheta - ttheta) < 1.e-1, (r.hkl, r.ttheta, ttheta)
    print "OK"

def get_focus_input_template():
  import os
  focus_input_template = []
  try:
    p = os.popen("focus")
    focus_input_template = p.readlines()
    p.close()
  except:
    raise RuntimeError, \
      "Cannot run focus. Please make sure focus is available."
  apply_rstrip(focus_input_template)
  return focus_input_template

def format_focus_input(gsas_exp, gsas_rfl, divide_pr,
                       phase_id=1, histogram_id=1,
                       default_overlap_factor=0.15):
  focus_input_template = get_focus_input_template()
  mode = 0
  for line in focus_input_template:
    if (line.startswith("Title")):
      title = gsas_exp.DESCR
      if (divide_pr):
        title += ", FIPS partitioning"
      print "Title", title
      print "# GSAS EXP file is attached."
      print
      mode = 1
    elif (line.startswith("UnitCell")):
      print "UnitCell  %.6g %.6g %.6g %.6g %.6g %.6g" % (
        gsas_exp.get_unit_cell_parameters(phase_id))
    elif (line.startswith("SpaceGroup")):
      print "SpaceGroup ", \
        gsas_exp.get_space_group_symbol(phase_id)
    elif (line.startswith("Lambda")):
      print "Lambda  %.6g" % (gsas_exp.get_wave_length(histogram_id),)
    elif (line.startswith("OverlapFactor")):
      print "OverlapFactor  %.6g" % (default_overlap_factor,)
    elif (line.startswith("OverlapAction")):
      if (not divide_pr):
        print "OverlapAction  EqualMF2"
      else:
        print "OverlapAction  NoAction"
    elif (line.startswith("#  h   k   l ")):
      print line
      fmt = " %3d %3d %3d %10.4f          *   %6.3f"
      if (not divide_pr):
        print "# GSAS RFL file:", gsas_rfl.file_name
        for r in gsas_rfl.records:
          print fmt % (r.ihkl + (r.fobs, r.fwhm))
      else:
        print "# XTAL DIVIDE file:", divide_pr.file_name
        for r in divide_pr.records:
          print fmt % (r.hkl + (r.fnew, r.hw))
    elif (mode):
      print line
  print
  print
  print "GSAS EXP file:", gsas_exp.file_name
  print
  for line in gsas_exp.plain_file:
    print line

def format_xtal_input(gsas_exp, gsas_rfl,
                      phase_id=1, histogram_id=1):
  print "COMPID ZAP"
  print "RESET LMAX 10000000"
  print
  print "# GSAS EXP file:", gsas_exp.file_name
  print "STARTX"
  print "CELL   %.6g %.6g %.6g %.6g %.6g %.6g" % \
    gsas_exp.get_unit_cell_parameters(phase_id)
  print "SPACEG", \
    gsas_exp.get_space_group_symbol(phase_id)
  print "CELMOL  1"
  print "****** ENTER CORRECT CELL CONTENTS AND REMOVE THIS LINE ******"
  print "CELCON  SI    2"
  print "CELCON  O     1"
  print "EXPER     1  %.6g" % (gsas_exp.get_wave_length(histogram_id),)
  print "END"
  print
  print "# GSAS RFL file:", gsas_rfl.file_name
  print "ADDREF nobay"
  print "reduce f2tof"
  print "HKLIN  hkl 1941 1940 f2rl sgf2"
  print "SETID  HKL"
  for r in gsas_rfl.records:
    for h in r.ihkl: print h,
    print r.tth, r.fwhm, r.fosq, r.sig
  print "SETID"
  print "END"
  print
  print "SORTRF ord hkl sort 1"
  print "END"
  print
  print "GENEV fixu 0.02 fixk 1.0"
  print "end"
  print
  print "##################################################################"
  print "# TO ALSO RUN DIVIDE, COMMENT OUT THE FOLLOWING FINISH STATEMENT #"
  print "##################################################################"
  print "FINISH"
  print
  print "DIVIDE"
  print "MOVITM  1601  1600"
  print "END"
  print
  print "DIVIDE"
  print "MOVITM  1603  1602"
  print "END"
  print
  print "DIVIDE PR"
  print "OVLAPF 0.15"
  print "DIVFMU"
  print "END"
  print
  print "FINISH"

def format_8_2(value):
  for i in (5,4,3,2,1):
    s = ("%8."+str(i)+"f") % (value,)
    if (i > 1):
      if (s[-1] == "0"): continue
    else:
      if (s[-1] == "0"):
        s = "%7.0f." % (value,)
    if (len(s) == 8): return s
  raise RuntimeError,  "Value does not fit Shelx HKLF -4 format: "+str(value)

def format_hklf_4(h, f_sq, sigma_f_sq=0.01):
  s = "%4d%4d%4d%s%s" % (h + (format_8_2(f_sq), format_8_2(sigma_f_sq)))
  assert len(s) == 28, \
    "Miller index does not fit Shelx HKLF -4 format: " + str(h)
  return s

def format_shelx_input(gsas_exp, gsas_rfl, divide_pr,
                       phase_id=1, histogram_id=1):
  title = gsas_exp.DESCR
  if (divide_pr):
    title += ", FIPS partitioning"
  print "TITL", title
  print "CELL 1.0 %.6g %.6g %.6g %.6g %.6g %.6g" % (
    gsas_exp.get_unit_cell_parameters(phase_id))
  print "ZERR 1 0.01 0.01 0.01 0 0 0" # XXX could use gsas_exp
  print "****** Use http://cci.lbl.gov/cctbx/shelx.html ******"
  print "****** to create the LATT and SYMM cards for   ******"
  print "****** space group %-27s ******" % (
    gsas_exp.get_space_group_symbol(phase_id),)
  print "HKLF -4"
  if (not divide_pr):
    for r in gsas_rfl.records:
      print format_hklf_4(r.ihkl, r.fosq, r.sig)
  else:
    for r in divide_pr.records:
      print format_hklf_4(r.hkl, r.fnew**2)
  print format_hklf_4((0,0,0), 0, 0)

def run():
  import sys, os.path
  Flags = command_line_options(sys.argv[1:], (
    "focus",
    "xtal",
    "shelx",
    "validate",
  ))
  if (not len(Flags.regular_args) in (2,3)):
    print "usage: %s YOUR.EXP YOUR.RFL [squared.lst] <options>" % (
      os.path.basename(sys.argv[0]))
    print "available options:"
    for keyword in Flags.keywords:
      print "  --" + keyword
    return
  file_names = [os.path.abspath(arg) for arg in Flags.regular_args]
  f = open(file_names[0], "r")
  gsas_exp = read_gsas_exp(f, file_names[0])
  f.close()
  gsas_rfl = 0
  f = open(file_names[1], "r")
  gsas_rfl = read_gsas_rfl(f, file_names[1])
  f.close()
  gsas_rfl.prune(gsas_exp)
  divide_pr = 0
  if (len(file_names) > 2):
    f = open(file_names[2], "r")
    divide_pr = read_divide_pr(f, file_names[2])
    f.close()
  if (Flags.focus):
    format_focus_input(gsas_exp, gsas_rfl, divide_pr)
  if (Flags.xtal):
    format_xtal_input(gsas_exp, gsas_rfl)
  if (Flags.shelx):
    format_shelx_input(gsas_exp, gsas_rfl, divide_pr)
  if (Flags.validate):
    if (gsas_rfl): gsas_rfl.validate(gsas_exp)
    if (divide_pr): divide_pr.validate(gsas_exp)

if (__name__ == "__main__"):
  run()
