from __future__ import division
import sys

td_archive_table = """\
ABW 19/9 833.0
ACO 2 787.0
AEI 2309/1320 688.7
AEL 497/216 903.8
AEN 91867/35700 956.3
AET 67/32 824.1
AFG 52/25 815.5
AFI 21/10 828.0
AFN 119/60 776.8
AFO 665/288 907.4
AFR 163664/94185 686.8
AFS 273/160 655.7
AFT 123/70 684.7
AFX 123/70 688.5
AFY 22/15 585.2
AHT 35/16 853.3
ANA 12/5 933.0
APC 94/45 814.0
APD 526/231 887.5
AST 15/8 742.2
ASV 2 787.0
ATN 19/9 833.0
ATO 57/25 894.0
ATS 48/25 752.3
ATT 68/35 767.7
ATV 49/20 960.3
AWO 521/245 827.7
AWW 124/63 772.3
BCT 22/9 959.0
BEA 81978419/38785500 805.1
BEC 45712/23205 764.0
BIK 49/18 1052.3
BOG 113787/57475 780.8
BPH 273/160 667.3
BRE 12289/5265 900.5
CAN 52/25 817.0
CAS 7741/2880 1042.3
CDO 41023/14700 1053.4
CFI 122488/53361 891.8
CGF 73/35 819.0
CGS 46/25 718.0
CHA 17/10 677.0
CHI 153225069/61282144 913.3
CLO 512/385 455.5
CON 3105307/1544400 784.0
CZP 12/5 885.0
DAC 4896737/1940400 977.3
DDR 39307/15400 967.9
DFO 15268/8835 663.6
DFT 32/15 840.0
DOH 145707/55055 1001.9
DON 115133/52650 851.0
EAB 66/35 735.0
EDI 2 786.2
EMT 2071/1400 584.0
EON 8250284717/3573052560 873.4
EPI 89441/35280 978.7
ERI 66/35 738.3
ESV 135694813/59909850 874.8
ETR 4282/2475 675.2
EUO 395365279/150965100 964.9
EZT 671/350 754.3
FAR 52/25 805.9
FAU 10/7 579.0
FER 55921/21000 1021.4
FRA 158/77 801.6
GIS 11/6 726.0
GIU 52/25 810.5
GME 123/70 694.0
GON 1996/845 926.2
GOO 2032/945 840.2
HEU 4903/2100 908.6
IFR 50359/24750 797.5
IHW ~2.69689 1012.7
IMF ~2.5374974 964.3
ISV 38432/18445 772.0
ITE 41224/19305 824.2
ITH 112796/47025 909.9
ITW 923/400 901.3
IWR 15463/7920 759.1
IWV ~2.0996404 802.5
IWW ~2.2695989 848.8
JBW 113/50 890.3
KFI 12/7 681.0
LAU 622/315 782.0
LEV 318/175 719.0
LIO 52/25 815.7
LIT 59/30 768.0
LOS 52/25 816.0
LOV 34233/15125 879.2
LTA 8/5 641.0
LTL 13/7 746.0
LTN 3384/1615 779.2
MAR 52/25 808.3
MAZ 11271/5390 823.0
MEI 301573/159390 727.9
MEL 121417/50050 944.1
MEP 421222/146965 1058.8
MER 28/15 738.0
MFI 96965483/39139100 959.9
MFS 127349/49000 994.8
MON 287/108 1033.0
MOR 298988/124215 938.3
MOZ 27/14 757.1
MSE ~2.2599131 867.4
MSO 25/12 821.8
MTF 24499519/8668296 1082.9
MTN 4522/1625 1049.1
MTT 17672791/6670125 1015.0
MTW 3194357/1372140 911.7
MWW 25813/11440 850.5
NAB 20/9 873.4
NAT 20/9 834.2
NES 352325/143451 922.1
NON 321277/117000 1037.5
NPO 9/4 869.0
NSI 751/288 1016.3
OBW 6700027/3237234 756.3
OFF 66/35 739.0
OSI 7/3 892.0
OSO 387/200 747.0
OWE 72/35 809.2
PAR 518384/259875 773.2
PAU 144/77 728.1
PHI 143/75 750.5
PON 87/40 845.3
RHO 8/5 641.0
RON 7441/3600 771.1
RRO 2693/1120 924.3
RSN 5570407/2359500 913.6
RTE 451/210 844.3
RTH 384632/184275 816.8
RUT 1293083/561600 902.1
RWR 13036/4725 1052.0
RWY 1 410.0
SAO 18/11 632.4
SAS 44/25 700.5
SAT 29/15 763.0
SAV 37/21 690.3
SBE 27704/17955 619.0
SBS 7739/4830 617.2
SBT 713/455 617.2
SFE 18952597/8232840 892.4
SFF 5885369968/2564186625 880.1
SFF 5885369968/2564186625 880.1
SFG 54787639/21474180 931.8
SFH 201941/92950 835.0
SFN 368827/177450 819.0
SFO 854/495 681.2
SGT 13979/5400 962.2
SIV 143/75 741.0
SOD 2 791.0
SOS 199/105 728.3
SSY 237277/100800 900.1
STF 1084438/482625 876.5
STF 1084438/482625 876.5
STI 2107/975 851.9
STT ~2.28211634 859.4
SZR 4507/1925 910.3
TER 173/78 871.8
THO 2 784.2
TOL 52/25 815.7
TON 1951/750 1005.7
TSC 152/105 589.5
TUN ~2.410007 929.3
UEI 521/245 831.7
UFI 2224384/1156155 746.5
UOZ 160/81 776.2
USI 5951/3360 691.4
UTL 1514986789/707566860 825.8
VET 544799/198744 1023.4
VFI 27/16 668.7
VNI 611375421655/227293178112 971.0
VSV 1227/500 948.1
WEI 425/216 773.4
WEN 148/77 755.0
YUG 754/315 935.0
ZON 328/161 797.8
"""

class td_record(object):

  def __init__(self, td10=None, exact_mean_a=None, approx_mean_a=None):
    self.td10 = td10
    self.exact_mean_a = exact_mean_a
    self.approx_mean_a = approx_mean_a

def td_archive_as_dict():
  result = {}
  for line in td_archive_table.splitlines():
    if (line.startswith("#")): continue
    flds = line.split()
    assert len(flds) in [2,3]
    r = td_record()
    tag, mean_a = flds[:2]
    if (len(flds) == 2):
      r.td10 = None
    else:
      r.td10 = float(flds[2])
    if (mean_a[0] == "~"):
      r.approx_mean_a = float(mean_a[1:])
    else:
      r.exact_mean_a = mean_a
      r.approx_mean_a = eval(mean_a)
    result[tag] = r
  return result

def extract_section(lines, label):
  result = []
  begin = ">Begin %s" % label
  end = ">End %s" % label
  lines = iter(lines)
  for line in lines:
    if (line.startswith(begin)):
      break
  else:
    raise RuntimeError("Missing %s" % begin)
  for line in lines:
    if (line.startswith(end)):
      break
    result.append(line)
  else:
    raise RuntimeError("Missing %s" % end)
  return result

def extract_coseq(lines):
  result = {}
  lines = iter(extract_section(lines=lines, label="coseq"))
  label = None
  terms = None
  for line in lines:
    if (line[:1] != " "):
      if (terms is not None):
        result[label] = terms
      terms = [1]
      flds = line.split()
      label, flds = flds[0], flds[1:]
    elif (line.endswith(" ...")):
      line = lines.next()
      s = " equal those of "
      i = line.find(s)
      if (i < 0):
        raise RuntimeError("Unexpected line: %s" % line)
      result[label] = line[i+len(s):].strip()
      terms = None
      flds = None
    elif (line.startswith("    N1 to ")):
      assert terms is not None
      result[label] = terms
      terms = None
      flds = None
    else:
      flds = line.split()
    if (flds is not None):
      terms.extend([int(v) for v in flds])
  if (terms is not None):
    result[label] = terms
  return result

def extract_site_multiplicities(lines):
  result = {}
  for line in extract_section(lines=lines, label="SiteFrame_eD_PeakList"):
    flds = line.split()
    assert len(flds) == 14
    result[flds[0]] = int(flds[9])
  return result

def sum(values):
  if (len(values) == 0): return None
  sum_v = 0
  for v in values:
    sum_v += v
  return sum_v

def mean(values, weights=None):
  if (weights is None):
    sum_v = sum(values=values)
    if (sum_v is None): return None
    return sum_v / len(values)
  assert len(weights) == len(values)
  sum_wv = 0
  sum_w = 0
  for w,v in zip(weights, values):
    sum_wv += w * v
    sum_w += w
  if (sum_w == 0): return None
  return sum_wv / sum_w

def mean_a(terms, n_tail):
  a_list = []
  for k,n in enumerate(terms):
    if (k == 0): continue
    a_list.append(n / k**2)
  return mean(values=a_list[-n_tail:])

def mean_mean_a_3(site_multiplicities, dict_of_terms, n_tail):
  len_terms = None
  ms = []
  ws = []
  for label,terms in dict_of_terms.items():
    if (isinstance(terms, str)):
      terms = dict_of_terms[terms]
    if (len_terms is None):
      len_terms = len(terms)
    else:
      assert len(terms) == len_terms
    ms.append(mean_a(terms=terms, n_tail=n_tail))
    ws.append(site_multiplicities[label])
  print ms
  return len_terms-1, mean(values=ms, weights=ws)/3

def mean_td10(site_multiplicities, dict_of_terms):
  ts = []
  ws = []
  for label,terms in dict_of_terms.items():
    if (isinstance(terms, str)):
      terms = dict_of_terms[terms]
    assert len(terms) >= 11
    ts.append(sum(terms[:11]))
    ws.append(site_multiplicities[label])
  print ts
  return mean(values=ts, weights=ws)

def quick_compare(td_archive):
  for line in open("TD_from_christian_2007_03_16.txt"):
    tag, td10, mma3 = line.split()
    r = td_archive[tag]
    if (r.td10 != None and abs(float(td10) - r.td10) > 0.5):
      print "LOOK", tag, td10, r.td10
    if (abs(float(mma3) - r.approx_mean_a/3) > 0.001):
      print "LOOK", tag, mma3, r.approx_mean_a/3
  print

def run(args):
  n_tail = 100
  td_archive = td_archive_as_dict()
  #quick_compare(td_archive=td_archive)
  td_archive_use_flags = {}
  for tag in td_archive.keys():
    td_archive_use_flags[tag] = False
  td10_substitutes = {}
  n_unknown = 0
  n_td10_mismatch = 0
  n_approx_mismatch = 0
  exact_unknown = []
  n_inexact = 0
  for fo_file_name in args:
    print fo_file_name
    fo_lines = open(fo_file_name).read().splitlines()
    site_multiplicities = extract_site_multiplicities(lines=fo_lines)
    dict_of_terms = extract_coseq(lines=fo_lines)
    mma3_terms, mma3 = mean_mean_a_3(
      site_multiplicities=site_multiplicities,
      dict_of_terms=dict_of_terms,
      n_tail=n_tail)
    td10 = mean_td10(
      site_multiplicities=site_multiplicities,
      dict_of_terms=dict_of_terms)
    tag = fo_file_name.split(".")[0]
    td_record = td_archive.get(tag)
    s_current_td10 = "%.1f" % td10
    s_current_mma3 = "%.3f" % mma3
    print fo_file_name, "TD10=%s" % s_current_td10, \
      "TD%s:%s=%s" % (mma3_terms, n_tail, s_current_mma3)
    print "COMPARE", tag, s_current_td10, s_current_mma3,
    if (td_record is None):
      print "UNKNOWN",
      n_unknown += 1
    else:
      td_archive_use_flags[tag] = True
      s_archived_mma3 = "%.3f" % (td_record.approx_mean_a/3)
      print s_archived_mma3,
      if (s_archived_mma3 != s_current_mma3):
        if (td_record.exact_mean_a is not None):
          print "INEXACT",
          n_inexact += 1
        else:
          print "MISMATCH_APPROX",
          n_approx_mismatch += 1
      elif (td_record.exact_mean_a is None):
        print "EXACT_UNKNOWN",
        exact_unknown.append(fo_file_name)
      if (td_record.td10 is not None):
        s_archived_td10 = "%.1f" % td_record.td10
        if (s_archived_td10 != s_current_td10):
          print "MISMATCH_TD10", s_archived_td10, s_current_td10
          n_td10_mismatch += 1
    print
    if (td_record is None):
      print "RECORD %s ~%.8g %.1f" % (tag, mma3*3, td10)
    print "TABLE", tag, "%.0f" % td10,
    if (td_record is not None and td_record.exact_mean_a is not None):
      print "%.3f" % (td_record.approx_mean_a/3),
    else:
      print "~"+s_current_mma3,
    print
    if (td_record is not None and td_record.td10 is None):
      td10_substitutes[tag] = s_current_td10
    print
  unused = []
  for tag,flag in td_archive_use_flags.items():
    if (not flag): unused.append(tag)
  unused.sort()
  u = len(unused)
  if (u != 0 and u <= 15):
    u = " ".join(unused)
  print "Unused archive records:", u
  print
  print "Exact unknown:", " ".join(exact_unknown)
  print
  print "number of unknown tags:", n_unknown
  print "number of td10 mismatches:", n_td10_mismatch
  print "number of approximation mismatches:", n_approx_mismatch
  print "number of exact unknown:", len(exact_unknown)
  print "number of inexact approximations:", n_inexact
  #
  if (len(td10_substitutes) != 0):
    print
    print "New td_archive_table with additional current TD10:"
    for line in td_archive_table.splitlines():
      if (line[0] != "#"):
        tag = line.split()[0]
        s_current_td10 = td10_substitutes.get(tag)
        if (s_current_td10 is not None):
          line += " "+s_current_td10
      print line

if (__name__ == "__main__"):
  run(sys.argv[1:])
