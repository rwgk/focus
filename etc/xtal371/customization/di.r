systemheader:(DIMA,*)#                                                  DIMA   1
####################################################################### DIMA   2
#                                                                     # DIMA   3
#                            *** DIVIDE ***                           # DIMA   4
#                                                                     # DIMA   5
####################################################################### DIMA   6
## Michael A. Estermann, ETH Zurich, Switzerland, XTAL3.4 Version       DIMA   7
# ORGANIZATION OF QX ARRAY                                              DIMA   8
# ========================                                              DIMA   9
#                                                                       DIMA  10
# QX(M0+1), ..., QX(M1) SYMMETRY MATRICES, WITHOUT LATTICE CENTERING    DIMA  11
# QX(M1+1), ..., QX(M2) ADDITIONAL SYMMETRY MATRICES FOR CENTERING      DIMA  12
# QX(M2+1), ..., QX(M3) REFLECTION ITEMS                                DIMA  13
# QX(M3+1), ..., QX(M4) INDEX TABLE FOR REFL. IN INCREASING SINTL       DIMA  14
# QX(M4+1), ..., QX(M5) FOUR COEF FROM INACCESSIBLE VOLUME              DIMA  15
#                                                                       DIMA  16
# ORGANIZATION OF BDF                                                   DIMA  17
# ===================                                                   DIMA  18
#                                                                       DIMA  19
# IDN IN LRCELL:                                                        DIMA  20
# --------------                                                        DIMA  21
## Packet 6                  cell volume                                DIMA  22
#                                                                       DIMA  23
# IDN IN LRSCAT:                                                        DIMA  24
# --------------                                                        DIMA  25
## IDN=1                     number of atoms of this type per unit c.   DIMA  26
## IDN=3                     atomic number                              DIMA  27
## IDN=4                     number of electron in neutral atoms        DIMA  28
#                                                                       DIMA  29
# IDN IN LREXPL:                                                        DIMA  30
# --------------                                                        DIMA  31
## IDN=2                     wavelength in angstroems                   DIMA  32
## IDN=12                    sort order of hkl                          DIMA  33
## IDN=100                   number of scale groups                     DIMA  34
## IDN=101..100+n            F relative scale factor for group n        DIMA  35
#                                                                       DIMA  36
# IDN IN LRDSET:                                                        DIMA  37
# --------------                                                        DIMA  38
## IDN=1                     data set                                   DIMA  39
## IDN=11                    maximum |h|                                DIMA  40
## IDN=12                    maximum |k|                                DIMA  41
## IDN=13                    maximum |l|                                DIMA  42
## IDN=14                    minimum sin(theta)/lambda                  DIMA  43
## IDN=15                    maximum sin(theta)/lambda                  DIMA  44
#                                                                       DIMA  45
# IDN IN LRREFL:                                                        DIMA  46
# --------------                                                        DIMA  47
#                                                                       DIMA  48
# STANDARD ITEMS                                                        DIMA  49
#                                                                       DIMA  50
## IDN=1                     miller indices                             DIMA  51
## IDN=2                     sin(theta)/lambda                          DIMA  52
## IDN=3                     refl. multiplicity, epsilon                DIMA  53
## IDN=n1000+302             |F(rel)|**2                                DIMA  54
## IDN=n1000+303             sigma |F(rel)|**2                          DIMA  55
## IDN=n1000+309             scale group number                         DIMA  56
## IDN=n1000+600             |E| normalized structure factor            DIMA  57
## IDN=n1000+604             SQRT(<|F|**2>*eps) random atoms            DIMA  58
## IDN=n1000+605             SQRT(<|F|**2>*eps) fragment                DIMA  59
## IDN=n1000+800             |F(calc)|                                  DIMA  60
## IDN=n1000+801             A(calc) (= |F(calc)|**2 for PATTERSON)     DIMA  61
##                                   (= |E(calc)|**2-1   VECTORMAP)     DIMA  62
## IDN=n1000+910             sim weight                                 DIMA  63
#                                                                       DIMA  64
# NON-STANDARD ITEMS                                                    DIMA  65
#                                                                       DIMA  66
## IDN=n1000+930             |F(rel)| single crystal                    DIMA  67
## IDN=n1000+940             Half-width in 2theta                       DIMA  68
## IDN=n1000+941             2theta position from EXTRACT               DIMA  69
## IDN=n1000+950             |E(single crystal)| norm. struct. factor   DIMA  70
## IDN=n1000+960             |E|**2 - 1                                 DIMA  71
## IDN=n1000+970             eps*|E|**2 - 1                             DIMA  72
## IDN=n1000+980             0=no overlap / 1,2,3,... overlap group     DIMA  73
##                           1=refl. belongs to 1.group                 DIMA  74
##                           2=refl. belongs to 2.group                 DIMA  75
## IDN=n1000+981             number of refl. in group                   DIMA  76
## IDN=n1000+982             max possible |E| in group                  DIMA  77
#                                                                       DIMA  78
# PHASING OF REFLECTIONS                                                DIMA  79
# ======================                                                DIMA  80
# THE PROGRAM "RFOURR"  PERFORMS A REVERSE FOURIER TRANSFORM WHICH      DIMA  81
# PHASES ONLY REFLECTIONS IN RANGE FOR   MAX /H/, /K/, /L/ AND          DIMA  82
# MIN/MAX SIN(THETA)/LAMBDA.                                            DIMA  83
#                                                                       DIMA  84
# REFLECTIONS WITH MAGNITUDE LESS THAN A 0.005 ARE NOT PHASED EITHER.   DIMA  85
# CAN BE CHANGED BY "TH" OPTION IN "RFOURR".                            DIMA  86
#                                                                       DIMA  87
# MACRO DEFINITIONS                                                     DIMA  88
# =================                                                     DIMA  89
#                                                                       DIMA  90
include:(XMACRO)#      ## Read XTAL macros from file XMACRO             DIMA  91
#                                                                       DIMA  92
# STATIC MACROS                                                         DIMA  93
#                                                                       DIMA  94
macro:(author:,' Michael A. Estermann / ETH / Zurich / Switzerland')#   SPMA  23
#
macro:(dset:,1)#          ## data set                                   DIMA  95
#                                                                       DIMA  96
macro:(nogroup:,0.0)#     ## no group, no overlap                       DIMA  97
macro:(groupok:,1.0)#     ## group of overlapping peaks, calc. ok       DIMA  98
macro:(notphased:,2.0)#   ## 1 or more refl. not phased in group        DIMA  99
macro:(sumnewzero:,3.0)#  ## sumnew=0 in group                          DIMA 100
macro:(sumoldzero:,4.0)#  ## sumold=0 in group                          DIMA 101
macro:(sumnewboost:,5.0)# ## sumnew=0 in group in booster               DIMA 102
macro:(vecltm:,6.0)#      ## |E|**2-1 < -1                              DIMA 103
macro:(stollimit:,7.0)#   ## out of stl limit                           DIMA 104
macro:(sumvbzero:,8.0)#   ## bottom of scale factor is zero             DIMA 105
#                                                                       DIMA 106
#                                                                       DIMA 107
# QX RELATED MACROS                                                     DIMA 108
#                                                                       DIMA 109
macro:(ib:,NINT(BUFIN($1)))#                                            DIMA 110
macro:(bf:,BUFIN($1))#                                                  DIMA 111
macro:(iqx:,NINT(QX($1)))#                                              DIMA 112
#                                                                       DIMA 113
# SYMOPS DATA (1..12 SYMMETRY MATRICES)                                 DIMA 114
macro:(ps:,QX($1+13))#                 Stat. weight for symop i-c(s)    DIMA 115
macro:(gs:,QX($1+14))#                 Absolut coeficient (gamma)       DIMA 116
macro:(fs:,QX($1+15))#                 Gs*(gs*ps-1) ac/ gs*(gs*ps-2)    DIMA 117
macro:(pa:,QX($1+16))#                 Address of partner symop for g   DIMA 118
macro:(nsymit:,16)#                    Number of symmetry items         DIMA 119
#                                                                       DIMA 120
# REFLECTION DATA                                                       DIMA 121
macro:(reflist:,[ifelse:($1,,NR,$1)])# Define gen list pointer          DIMA 122
#                                                                       DIMA 123
macro:(hkl:,   [QX(reflist:($1)+ 1)])# Packed hkl                       DIMA 124
macro:(stl:,   [QX(reflist:($1)+ 2)])# Sin(theta)/lambda                DIMA 125
macro:(rmul:,  [QX(reflist:($1)+ 3)])# Multiplicity                     DIMA 126
macro:(eps:,   [QX(reflist:($1)+ 4)])# Epsilon                          DIMA 127
macro:(ftold:, [QX(reflist:($1)+ 5)])# /f/**2 rel                       DIMA 128
macro:(sgft:,  [QX(reflist:($1)+ 6)])# Sigma /f/**2 rel                 DIMA 129
macro:(scgr:,  [QX(reflist:($1)+ 7)])# Scale group number               DIMA 130
macro:(ftre:,  [QX(reflist:($1)+ 8)])# /f/**2 random expectation        DIMA 131
macro:(ftfe:,  [QX(reflist:($1)+ 9)])# /f/**2 fragment expectation      DIMA 132
macro:(acal:,  [QX(reflist:($1)+10)])# A calc (f=a+ib)                  DIMA 133
macro:(simw:,  [QX(reflist:($1)+11)])# Sim weight                       DIMA 134
macro:(hw:,    [QX(reflist:($1)+12)])# Half width                       DIMA 135
macro:(ovlg:,  [QX(reflist:($1)+13)])# Overlap group                    DIMA 136
macro:(twot:,  [QX(reflist:($1)+14)])# 2 theta                          DIMA 137
macro:(rnlist:,[QX(reflist:($1)+15)])# Random list                      DIMA 138
macro:(status:,[QX(reflist:($1)+16)])#                                  DIMA 139
macro:(scl:,   [QX(reflist:($1)+17)])# Scale f**2 = scl * eps * e**2    DIMA 140
macro:(nrf:,   [QX(reflist:($1)+19)])# Number of refl. in group         DIMA 141
macro:(fcal:,  [QX(reflist:($1)+20)])# /f/ calc                         DIMA 142
macro:(fscr:,  [QX(reflist:($1)+21)])# /f/ single crystal               DIMA 143
macro:(fold:,  [QX(reflist:($1)+22)])# /f/ old                          DIMA 144
macro:(fnew:,  [QX(reflist:($1)+23)])# /f/ new                          DIMA 145
macro:(feq:,   [QX(reflist:($1)+24)])# /f/ equipartition                DIMA 146
macro:(fmu:,   [QX(reflist:($1)+25)])# /f/**2 * mul equipartition       DIMA 147
macro:(fran:,  [QX(reflist:($1)+26)])# Random partition                 DIMA 148
macro:(escr:,  [QX(reflist:($1)+27)])# /e/ single crystal               DIMA 149
macro:(eold:,  [QX(reflist:($1)+28)])# /e/                              DIMA 150
macro:(enew:,  [QX(reflist:($1)+29)])# /e/ new                          DIMA 151
macro:(etca:,  [QX(reflist:($1)+30)])# /e/**2 calc                      DIMA 152
macro:(emx:,   [QX(reflist:($1)+31)])# Max possible /e/ in group        DIMA 153
macro:(temp:,  [QX(reflist:($1)+32)])# Temporary memory                 DIMA 154
macro:(add:,   [QX(reflist:($1)+33)])# /e/**2 + add (def. -1)           DIMA 155
macro:(pst:,   [QX(reflist:($1)+34)])# Stat. weight for primitive sg    DIMA 156
macro:(fep:,   [QX(reflist:($1)+35)])# Random atom expectation          DIMA 157
macro:(gracc:, [QX(reflist:($1)+36)])# Group accessible for calculati   DIMA 158
macro:(use:,   [QX(reflist:($1)+37)])# Use ref for fourier              DIMA 159
macro:(ftnew:, [QX(reflist:($1)+38)])# /f/**2 new                       DIMA 160
macro:(nrefit:,38)#                    Number of reflection items       DIMA 161
#                                                                       DIMA 162
# EXTERNAL FOURIER COEF                                                 DIMA 163
#                                                                       DIMA 164
macro:(h:,QX($1+ 1))#                  H                                DIMA 165
macro:(k:,QX($1+ 2))#                  K                                DIMA 166
macro:(l:,QX($1+ 3))#                  L                                DIMA 167
macro:(a:,QX($1+ 4))#                  A of f=a+ib                      DIMA 168
macro:(b:,QX($1+ 5))#                  A of f=a+ib                      DIMA 169
#                                                                       DIMA 170
# COMMON BLOCKS                                                         DIMA 171
# -------------                                                         DIMA 172
systemheader:(DICM,*)#                                                  DICM   1
extrude:(DICOMN)#                                                       DICM   2
#                                                                       DICM   3
# POINTERS IN QX                                                        DICM   4
#                                                                       DICM   5
INTEGER M0#               ## start-1 of symmetry matrices, primitive    DICM   6
INTEGER M1#               ## start-1 of symmetry matrices, centered     DICM   7
INTEGER M2#               ## start-1 of reflections table               DICM   8
INTEGER M3#               ## start-1 of index table for reflections     DICM   9
INTEGER M4#               ## start-1 of external fourier coef           DICM  10
INTEGER STEPM4#           ## increment to M4                            DICM  11
INTEGER M5#               ## end     of temporary buffer                DICM  12
INTEGER NR#               ## current refl. in refl. table               DICM  13
INTEGER IND#              ## current pos in index table                 DICM  14
#                                                                       DICM  15
# LRCELL: RECORD                                                        DICM  16
#                                                                       DICM  17
REAL    VOL#              ## cell volume                                DICM  18
REAL    G1#               ## inverse metric tensor                      DICM  19
REAL    G2#               ## inverse metric tensor                      DICM  20
REAL    G3#               ## inverse metric tensor                      DICM  21
REAL    G5#               ## inverse metric tensor                      DICM  22
REAL    G6#               ## inverse metric tensor                      DICM  23
REAL    G9#               ## inverse metric tensor                      DICM  24
#                                                                       DICM  25
# LRSYMM: RECORD                                                        DICM  26
#                                                                       DICM  27
INTEGER ICNT#             ## Centricity ac=0  c=1                       DICM  28
INTEGER LTYP#             ## Lattice code                               DICM  29
INTEGER NSYM#             ## Total symmetry matrices                    DICM  30
INTEGER NROT#             ## Limit of rotation matrices                 DICM  31
#                                                                       DICM  32
# LRSCAT: RECORD                                                        DICM  33
#                                                                       DICM  34
REAL    SIG2#             ## sigma2                                     DICM  35
REAL    SIG3#             ## sigma3                                     DICM  36
REAL    SIG4#             ## sigma4                                     DICM  37
REAL    SIG5#             ## sigma5                                     DICM  38
REAL    SIG#              ## SIG3**2/(SIG2*SIG4)                        DICM  39
#                                                                       DICM  40
# LREXPL: RECORD                                                        DICM  41
#                                                                       DICM  42
REAL    LAMBDA#           ## Wavelength of radiation in Angstroem       DICM  43
#                                                                       DICM  44
# LRDSET: RECORD                                                        DICM  45
#                                                                       DICM  46
REAL    MAXH(3)#          ## maximum h, k, l from input bdf             DICM  47
REAL    STLL(2)#          ## min/max sin(theta)/lambda                  DICM  48
REAL    STCC(2)#          ## min/max sin(theta)/lambda calc limits      DICM  49
#                                                                       DICM  50
# LRREFL: RECORD                                                        DICM  51
#                                                                       DICM  52
INTEGER IFTRL#                                                          DICM  53
INTEGER ISGFT#                                                          DICM  54
INTEGER ISCGR#                                                          DICM  55
INTEGER IE#                                                             DICM  56
INTEGER IFTRE#                                                          DICM  57
INTEGER IFTFE#                                                          DICM  58
INTEGER IFCAL#                                                          DICM  59
INTEGER IACAL#                                                          DICM  60
INTEGER ISIMW#                                                          DICM  61
INTEGER IFSCR#                                                          DICM  62
INTEGER IHW#                                                            DICM  63
INTEGER IESCR#                                                          DICM  64
INTEGER IOVLG#                                                          DICM  65
INTEGER NHKL#             ## Number of hkl values                       DICM  66
INTEGER IUSE#                                                           DICM  67
INTEGER ITWOT#                                                          DICM  68
#                                                                       DICM  69
# CONTROL PARAMETERS                                                    DICM  70
#                                                                       DICM  71
INTEGER NORMAL#           ## yes:/no: decomposition                     DICM  72
INTEGER ILAPFA#           ## user defined lapfac                        DICM  73
REAL    LAPFAC#           ## Factor applied to overlap range            DICM  74
REAL    EMIN#             ##                                            DICM  75
INTEGER DIVFEQ#           ## yes:/no: divide into f eq f                DICM  76
INTEGER DIVFEP#           ## yes:/no: divide into wilson equipartitio   DICM  77
INTEGER DIVFMU#           ## yes:/no: divide into f * mu                DICM  78
INTEGER DIVRAN#           ## yes:/no: divide into f random              DICM  79
INTEGER ISEED#            ## initialization for ranf()                  DICM  80
INTEGER DIVPAT#           ## yes:/no: divide f from patterson acalc     DICM  81
INTEGER DIVVEC#           ## yes:/no: divide f from vectormap acalc     DICM  82
INTEGER DIVFCA#           ## 0/1/2  : divide f from fcal                DICM  83
INTEGER DIVEXP#           ## yes:/no: divide f from f expectation val   DICM  84
INTEGER BOOSTR#           ## yes:/no: apply exp shift                   DICM  85
REAL    BOOFAC#           ## factor in exp                              DICM  86
INTEGER WRTHKL#           ## yes:/no: write hkl file in shelx format    DICM  87
INTEGER MOVITM#           ## yes:/no: move reflection items             DICM  88
INTEGER WRTITM#           ## yes:/no: write reflection item to output   DICM  89
INTEGER PRINTL#           ## number of refelctions to be printed        DICM  90
INTEGER ITEM1#            ## item to read from                          DICM  91
INTEGER ITEM2#            ## item to write to                           DICM  92
INTEGER ITEM(20)#         ## item                                       DICM  93
INTEGER NITEM#            ## no. of items                               DICM  94
INTEGER IPSTRA#           ## calc pseudotranslational symmetry          DICM  95
INTEGER SYMTRY#                                                         DICM  96
INTEGER SYMPRY#                                                         DICM  97
INTEGER ATMTYP#                                                         DICM  98
INTEGER RECLAT#                                                         DICM  99
INTEGER DIVNEI#                                                         DICM 100
INTEGER DIVVOL#                                                         DICM 101
INTEGER SUBSEQ#                                                         DICM 102
INTEGER WRTABC#                                                         DICM 103
#                                                                       DICM 104
# COMMON BLOCKS                                                         DICM 105
#                                                                       DICM 106
COMMON/COMFDI/$#                       Common floating point            DICM 107
VOL    ,SIG2   ,SIG3   ,SIG4   ,SIG5   ,SIG    ,LAMBDA ,#               DICM 108
MAXH   ,STLL   ,LAPFAC ,BOOFAC ,EMIN   ,STCC   ,#                       DICM 109
G1     ,G2     ,G3     ,G5     ,G6     ,G9#                             DICM 110
#                                                                       DICM 111
COMMON/COMIDI/$#                       Common integer                   DICM 112
IFTRL  ,ISGFT  ,ISCGR  ,IE     ,#                                       DICM 113
IFTRE  ,IFTFE  ,IFCAL  ,IACAL  ,ISIMW  ,IFSCR  ,IHW    ,#               DICM 114
IESCR  ,NHKL   ,NORMAL ,WRTHKL ,MOVITM ,DIVFEQ ,DIVFMU ,#               DICM 115
DIVRAN ,ISEED  ,DIVPAT ,DIVVEC ,DIVFCA ,DIVEXP ,BOOSTR ,#               DICM 116
PRINTL ,ITEM1  ,ITEM2  ,ITEM   ,NITEM  ,IOVLG  ,M0     ,#               DICM 117
M1     ,M2     ,M3     ,M4     ,M5     ,#                               DICM 118
STEPM4 ,NR     ,IND    ,ILAPFA ,ICNT   ,LTYP   ,NSYM   ,#               DICM 119
NROT   ,SYMTRY ,SYMPRY ,ATMTYP ,RECLAT ,DIVFEP ,DIVNEI ,#               DICM 120
DIVVOL ,SUBSEQ ,IUSE   ,WRTABC ,WRTITM ,ITWOT  ,IPSTRA#                 DICM 121
endext:#                                                                DICM 122
#                                                                       DICM 123
systemheader:(DI00)#                                                    DI00   1
######################################################################  DI00   2
#                                                                    #  DI00   3
#                               DI00                                 #  DI00   4
#                                                                    #  DI00   5
######################################################################  DI00   6
SUBROUTINE DI00#                                                        DI00   7
include:(AACOMN)#                                                       DI00   8
include:(DICOMN)#                                                       DI00   9
#                                                                       DI00  10
CHROT(1^)=author: ; writeline:(1,0,0,1,3)#                              SP00  11
#
CALL DI10#                             Read line input                  DI00  11
#                                                                       DI00  12
IF(NORMAL==yes:)CALL DI20#             First read of bdf, setups        DI00  13
IF(NORMAL==yes: & SYMTRY==yes:)CALL DI60# Do symmetry related calc      DI00  14
IF(NORMAL==yes:)CALL DI30#             Decomposition                    DI00  15
#                                                                       DI00  16
IF(WRTHKL==yes:$#                                                       DI00  17
\  RECLAT==yes:$#                                                       DI00  18
\  WRTABC==yes:)CALL DI40#             Write hkl file in shelx format   DI00  19
IF(MOVITM==yes:)CALL DI50#             Move items                       DI00  20
IF(WRTITM==yes:)CALL DI55#             Write hkl items                  DI00  21
#                                                                       DI00  22
RETURN#                                                                 DI00  23
END#                                                                    DI00  24
systemheader:(DI10)#                   Read line input                  DI10   1
######################################################################  DI10   2
#                                                                    #  DI10   3
#                               DI10                                 #  DI10   4
#                                                                    #  DI10   5
######################################################################  DI10   6
SUBROUTINE DI10#                                                        DI10   7
include:(AACOMN)#                                                       DI10   8
include:(DICOMN)#                                                       DI10   9
#                                                                       DI10  10
INTEGER I#                             Local counter                    DI10  11
INTEGER J#                             Local counter                    DI10  12
INTEGER K#                             Local counter                    DI10  13
#                                                                       DI10  14
chardata:(DIIA, $#                                                      DI10  15
END    OVLAPF SUBSEQ DIVFEQ DIVFMU DIVRAN DIVPAT DIVVEC $#              DI10  16
DIVFCA DIVEXP BOOSTR WRTHKL MOVITM STLLIM SYMTRY ATMTYP $#              DI10  17
RECLAT DIVFEP DIVNEI DIVVOL WRTABC WRTITM PSEUDO )#                     DI10  18
chardata:(DIIB,PR )#                                                    DI10  19
#                                                                       DI10  20
datastuff:#                                                             DI10  21
#                                                                       DI10  22
# SET DEFAULT PARAMETER                                                 DI10  23
# ---------------------                                                 DI10  24
#                                                                       DI10  25
NORMAL  = yes:#                        Decomposition                    DI10  26
LAPFAC  = 0.0#                         Do not use h-w range             DI10  27
ILAPFA  = no:#                         No user interaction              DI10  28
DIVFEQ  = no:#                         No f eq f part                   DI10  29
DIVFEP  = no:#                         No wilson equipartition          DI10  30
DIVFMU  = no:#                         No f * mu part                   DI10  31
DIVRAN  = no:#                         No f random part                 DI10  32
ISEED   = 69001#                       Initatialization for ranf()      DI10  33
DIVPAT  = no:#                         No f part from patterson acalc   DI10  34
DIVVEC  = no:#                         No f part from vectormap acalc   DI10  35
DIVFCA  = no:#                         No f part from fcal              DI10  36
DIVEXP  = no:#                         No f part from expectation f     DI10  37
BOOSTR  = no:#                         Do not apply exp shift           DI10  38
BOOFAC  = 1.0#                         Exp factor in boostr             DI10  39
WRTHKL  = no:#                         Do not write hkl file            DI10  40
WRTITM  = no:#                         Do not write refl item           DI10  41
MOVITM  = no:#                         Do not move items                DI10  42
STCC(1) = 0.0#                         No actual stl limit for calc     DI10  43
STCC(2) = 100.0#                       No actual stl limit for calc     DI10  44
SYMTRY  = no:#                                                          DI10  45
SYMPRY  = 0#                                                            DI10  46
ATMTYP  = no:#                                                          DI10  47
RECLAT  = no:#                                                          DI10  48
DIVNEI  = no:#                                                          DI10  49
DIVVOL  = no:#                                                          DI10  50
SUBSEQ  = no:#                                                          DI10  51
WRTABC  = no:#                                                          DI10  52
IPSTRA  = no:#                                                          DI10  53
#                                                                       DI10  54
PRINTL  = 0#                           Print number for reflections     DI10  55
#                                                                       DI10  56
# EXTRACT OPTIONS FROM ALLINT LINE                                      DI10  57
# --------------------------------                                      DI10  58
#                                                                       DI10  59
FOR(K=1;K<mxfdim:;K=K+1)#              Loop over input fields           DI10  60
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI10  61
ifvo:(bf:(K)) BREAK#                   Go to first non-alpha field      DI10  62
stringlim:(K,I,J)#                     Find characters in input         DI10  63
compchar:(CHRIN,I,DIIB,1,2,3,NDIIB,J)# Search list of options           DI10  64
IF(J==0) BREAK#                        It must be valid                 DI10  65
#                                                                       DI10  66
ELSE IF(J==1)#                         ************ pr **************   DI10  67
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  DI10  68
PRINTL=-1#                             Signal to print all refl         DI10  69
IF(bf:(K+1)>0.0)#                      Is print number supplied         DI10  70
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  DI10  71
K=K+1; PRINTL=ib:(K)#                  Get print number                 DI10  72
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  DI10  73
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  DI10  74
#                                                                       DI10  75
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI10  76
#                                                                       DI10  77
# TAKE IN ANY OTHER INPUT LINES                                         DI10  78
# -----------------------------                                         DI10  79
#                                                                       DI10  80
REPEAT#                                Loop over lines                  DI10  81
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  DI10  82
readline:(DIIA,NDIIA)#                 Enter next input line            DI10  83
#                                                                       DI10  84
IF(LINID==1) BREAK#                    ********* end ****************   DI10  85
IF(LINID==2)#                          ********* ovlapf *************   DI10  86
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  DI10  87
ILAPFA=yes:#                           User interaction                 DI10  88
ifnv:(bf:(1)) LAPFAC=bf:(1)#           Test and take lapfac             DI10  89
ifnv:(bf:(2)) EMIN=bf:(2)#             Emin                             DI10  90
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  DI10  91
IF(LINID==3) SUBSEQ=yes:#              ******** subseq **************   DI10  92
IF(LINID==4) DIVFEQ=yes:#              ******** divfeq **************   DI10  93
IF(LINID==5) DIVFMU=yes:#              ******** divfmu **************   DI10  94
IF(LINID==6)#                          ******** divran **************   DI10  95
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  DI10  96
DIVRAN=yes:#                                                            DI10  97
ifnv:(bf:(1)) ISEED=ib:(1)#            Test and take iseed              DI10  98
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  DI10  99
IF(LINID==7) DIVPAT=yes:#              ******** divpat **************   DI10 100
IF(LINID==8) DIVVEC=yes:#              ******** divvec **************   DI10 101
IF(LINID==9)#                          ******** divfca **************   DI10 102
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  DI10 103
ifvo:(bf:(1)) DIVFCA=1#                                                 DI10 104
IF(bf:(1)<voidflg:)#                                                    DI10 105
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  DI10 106
stringlim:(1,I,J);J=J-1#                                                DI10 107
IF(CHRIN(I^J)=='SIM') DIVFCA=2#                                         DI10 108
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  DI10 109
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  DI10 110
IF(LINID==10)#                         ******** divexp **************   DI10 111
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  DI10 112
DIVEXP=1#                                                               DI10 113
IF(bf:(1)<voidflg:)#                                                    DI10 114
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 DI10 115
stringlim:(1,I,J);J=J-1#                                                DI10 116
IF(CHRIN(I^J)=='EPS')   DIVEXP=1#                                       DI10 117
IF(CHRIN(I^J)=='NOEPS') DIVEXP=2#                                       DI10 118
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 DI10 119
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  DI10 120
IF(LINID==11)#                         ********* boostr *************   DI10 121
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 DI10 122
BOOSTR=1#                              1 exp(fnew/feq-1)                DI10 123
ifnv:(bf:(1)) BOOFAC=bf:(1)#           Test and take boofac             DI10 124
ifnv:(bf:(2)) BOOSTR=ib:(2)#           2 exp(fnew/fep-1)                DI10 125
##                                     3 exp(fnew/fold-1)               DI10 126
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 DI10 127
IF(LINID==12)#                         ********* wrthkl *************   DI10 128
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 DI10 129
NORMAL=no:#                                                             DI10 130
WRTHKL=yes:#                           Write f**2 to file               DI10 131
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 DI10 132
IF(LINID==13)#                         ********* movitm *************   DI10 133
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 DI10 134
NORMAL=no:#                                                             DI10 135
ITEM1=0; ITEM2=0#                                                       DI10 136
ifnv:(bf:(1)) ITEM1=ib:(1)#            Test and take item1              DI10 137
ifnv:(bf:(2)) ITEM2=ib:(2)#            Test and take item2              DI10 138
IF(ITEM1>0 & ITEM2>0) MOVITM=yes:#                                      DI10 139
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 DI10 140
IF(LINID==14)#                         ********* stllim *************   DI10 141
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 DI10 142
ifnv:(bf:(1)) STCC(1)=bf:(1)#          Test and take                    DI10 143
ifnv:(bf:(2)) STCC(2)=bf:(2)#          Test and take                    DI10 144
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 DI10 145
IF(LINID==15)#                         ********* symtry *************   DI10 146
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 15 DI10 147
SYMTRY=yes:#                                                            DI10 148
ifnv:(bf:(1)) SYMPRY=ib:(1)#           Test and take item1              DI10 149
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 15 DI10 150
IF(LINID==16) ATMTYP=yes:#             ********* atmtyp *************   DI10 151
IF(LINID==17) RECLAT=yes:#             ********* reclat *************   DI10 152
IF(LINID==18) DIVFEP=yes:#             ********* divfep *************   DI10 153
IF(LINID==19) DIVNEI=yes:#             ********* divnei *************   DI10 154
IF(LINID==20) DIVVOL=yes:#             ********* divvol *************   DI10 155
IF(LINID==21)#                         ********* wrtabc *************   DI10 156
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16 DI10 157
NORMAL=no:#                                                             DI10 158
WRTABC=yes:#                                                            DI10 159
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 16 DI10 160
IF(LINID==22)#                         ********* wrtitm *************   DI10 161
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 17 DI10 162
NORMAL=no:; NITEM=0#                                                    DI10 163
REPEAT#                                                                 DI10 164
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 18 DI10 165
ifvo:(bf:(NITEM+1)) BREAK; NITEM=NITEM+1; ITEM(NITEM)=ib:(NITEM)#       DI10 166
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 18 DI10 167
IF(NITEM!=0) WRTITM=yes:#                                               DI10 168
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 17 DI10 169
IF(LINID==23)IPSTRA=yes:#              ********* ipstra *************   DI10 170
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  DI10 171
#                                                                       DI10 172
RETURN#                                                                 DI10 173
END#                                                                    DI10 174
systemheader:(DI20)#                   First read of bdf                DI20   1
######################################################################  DI20   2
#                                                                    #  DI20   3
#                               DI20                                 #  DI20   4
#                                                                    #  DI20   5
######################################################################  DI20   6
SUBROUTINE DI20#                                                        DI20   7
#                                                                       DI20   8
include:(AACOMN)#                                                       DI20   9
include:(DICOMN)#                                                       DI20  10
#                                                                       DI20  11
# FOR READING BINARY FILES                                              DI20  12
#                                                                       DI20  13
INTEGER I,J,K#                         Local counter                    DI20  14
REAL    H(3)#                          Hkl                              DI20  15
INTEGER MARKS#                         Begin of empty qx space          DI20  16
INTEGER IWNT(50)#                      Wanted items for indexpkt:       DI20  17
INTEGER IREL(51)#                      Pointers for qx                  DI20  18
INTEGER KEY(4)#                        Flag for indexpkt:               DI20  19
INTEGER IP#                            Packet pointer for qx            DI20  20
INTEGER PSIZ#                          Packet size filea                DI20  21
#                                                                       DI20  22
# MISCELLANEOUS                                                         DI20  23
#                                                                       DI20  24
REAL    FMT#                           Format                           DI20  25
REAL    PFAC,C,D#                                                       DI20  26
#                                                                       DI20  27
chardata:(DI20A,[$#                                                     DI20  28
GENERAL INFO])#                        Di2                              DI20  29
#                                                                       DI20  30
chardata:(DI20F,[$#                                                     DI20  31
 OVERLAPPING GROUPS FOUND ON LRREFL. IDN=1980])#                        DI20  32
chardata:(DI20G,[$#                                                     DI20  33
 2THETA(2) - 2THETA(1) <= ( HW(1) + HW(2) ) *                     $#    DI20  34
  :  OVERLAP CONDITION])#                                               DI20  35
chardata:(DI20H,[$#                                                     DI20  36
 NO HALF-WIDTH FOUND ON LRREFL. IDN=1940 / $#                           DI20  37
SET ALL HALF-WIDTHS TO 0.5])#                                           DI20  38
chardata:(DI20I,[$#                                                     DI20  39
 USE HALF-WIDTH FROM LRREFL. IDN=1940])#                                DI20  40
chardata:(DI20M,[$#                                                     DI20  41
 CONVERT OVERLAPPING SETS INTO partition: /F/**2 =...= /F/**2])#        DI20  42
chardata:(DI20Z,[$#                                                     DI20  43
 CONVERT OVERLAPPING SETS INTO partition: RANDOM ATOM EXPECTATION])#    DI20  44
chardata:(DI20N,[$#                                                     DI20  45
 CONVERT OVERLAPPING SETS INTO partition: /F/**2 * MULT =...=$#         DI20  46
 /F/**2 * MULT])#                                                       DI20  47
chardata:(DI20O,[$#                                                     DI20  48
 CONVERT OVERLAPPING SETS INTO partition: RANDOM / SEED FOR RAN()=$#    DI20  49
                       ])#                                              DI20  50
chardata:(DI20P,[$#                                                     DI20  51
 USE ACAL = /F/**2   COEFFICIENT FROM PATTERSON])#                      DI20  52
chardata:(DI20Q,[$#                                                     DI20  53
 USE ACAL = EPS*/E/**2-1 COEFFICIENT FROM VECTORMAP])#                  DI20  54
chardata:(DI20X,[$#                                                     DI20  55
 NEGLECTED TERMS OF ORDER                                         $#    DI20  56
                                    ])#                                 DI20  57
chardata:(DI20Y,[$#                                                     DI20  58
 CORRECTION FOR /E/**2 FOR DIFFERENT ATOMS                        $#    DI20  59
                                     ])#                                DI20  60
chardata:(DI20R,[$#                                                     DI20  61
 USE FCAL FROM PROGRAM =FC=])#                                          DI20  62
chardata:(DI20S,[$#                                                     DI20  63
 USE FCAL * SIM WEIGHT FROM PROGRAM =FC=])#                             DI20  64
chardata:(DI20T,[$#                                                     DI20  65
 USE </F(H)/**2> WITH EPSILON FOR ORIENTED FRAGMENTS])#                 DI20  66
chardata:(DI20U,[$#                                                     DI20  67
 USE </F(H)/**2> WITHOUT EPSILON FOR ORIENTED FRAGMENTS])#              DI20  68
chardata:(DI2V,[$#                     D                                DI20  69
 APPLY EXP SHIFT : ACAL  =  EXP{( F/FEQ - 1 ) *                $# >>>>1 DI20  70
               }])#                    <<<1                        <<<1 DI20  71
chardata:(DI2W,[$#                                                      DI20  72
 APPLY EXP SHIFT : ACAL  =  EXP{( F/FEP - 1 ) *                $# >>>>2 DI20  73
               }])#                    <<<2                        <<<2 DI20  74
chardata:(DI2X,[$#                                                      DI20  75
 APPLY EXP SHIFT : ACAL  =  EXP{( F/FOLD - 1) *                $# >>>>3 DI20  76
               }])#                    <<<3                        <<<3 DI20  77
chardata:(DI2H,[$#                                                      DI20  78
 NO 2THETA VALUES FOUND ON LRREFL. IDN=1941 / $#                        DI20  79
CALCULATE THEM FROM LATTICE CONSTANTS GIVEN IN STARTX])#                DI20  80
chardata:(DI2I,[$#                     D                                DI20  81
 USE 2THETA VALUES FROM FROM LRREFL. IDN=1941])#                        DI20  82
#                                                                       DI20  83
chardata:(FB10A, WAVELENGTH (A)                             )# D        DI20  84
chardata:(FB10H, MAXIMUM /H/ /K/ /L/                        )# D        DI20  85
chardata:(FB10I, MIN/MAX SIN(THETA/LAMBDA)                  )# D        DI20  86
chardata:(FB10J, MIN/MAX 2 THETA                            )# D        DI20  87
chardata:(FB10K, CALCULATION LIMITS                         )# D        DI20  88
#                                                                       DI20  89
chardata:(UNDL,-)#                                                      DI20  90
#                                                                       DI20  91
realdata:(FMTMH,[360413.,400413.,440413.])#                             DI20  92
realdata:(FMTSL,[360832.,440832.])#                                     DI20  93
realdata:(FM4,[300313.,380313.,500213.])#                               DI20  94
#                                                                       DI20  95
realdata:(TR11,[.5,.6666667,0.,0.,.5,.5])#                              DI20  96
realdata:(TR12,[.5,.3333333,.5,.5,0.,.5])#                              DI20  97
realdata:(TR13,[.5,.3333333,.5,.5,.5,0.])#                              DI20  98
realdata:(TR21,[.3333333,.5])#                                          DI20  99
realdata:(TR22,[.6666667,0.])#                                          DI20 100
realdata:(TR23,[.6666667,.5])#                                          DI20 101
datastuff:#                                                             DI20 102
#                                                                       DI20 103
# SET UP I/O BUFFER FOR FILE A AND FILE B                               DI20 104
# ---------------------------------------                               DI20 105
#                                                                       DI20 106
IOMARK(1) = QXSTR#                     I/o buffer for file a            DI20 107
IOMARK(2) = IOMARK(1)+bdfbuf:#         I/o buffer for file b            DI20 108
M0        = IOMARK(2)+bdfbuf:#         Mark start-1 of symop table      DI20 109
incrqx:(M1,M0,DI2001)#                 Expand qx                        DI20 110
#                                                                       DI20 111
# CELL VOLUME (LRCELL:)                                                 DI20 112
# ---------------------                                                 DI20 113
#                                                                       DI20 114
K=0#                                   Prepare to get needed cell i     DI20 115
REPEAT#                                Loop over lrcell packets         DI20 116
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  DI20 117
K=K+1#                                 Count packets as they come i     DI20 118
readwpkt:(1,lrcell:,PSIZ,IP,0)#        Read in cell record              DI20 119
IF(IP<=0) BREAK#                       Exit after last record           DI20 120
IF(K==6)VOL=QX(IP+1)#                  Save real cell volume            DI20 121
IF(K==8)#                              Inverse metric tensor            DI20 122
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  DI20 123
G1=QX(IP+1)#                           (a*)**2                          DI20 124
G2=QX(IP+2)#                           (a*)*(b*)*cos(g*)                DI20 125
G3=QX(IP+3)#                           (a*)*(c*)*cos(b*)                DI20 126
G5=QX(IP+5)#                           (b*)**2                          DI20 127
G6=QX(IP+6)#                           (b*)*(c*)*cos(a*)                DI20 128
G9=QX(IP+9)#                           (c*)**2                          DI20 129
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  DI20 130
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  DI20 131
#                                                                       DI20 132
# CENTRICITY AND LATTICE CODE AND SYMMETRY MATR.(LRSYMM:)               DI20 133
# -------------------------------------------------------               DI20 134
#                                                                       DI20 135
readwpkt:(1,lrsymm:,PSIZ,IP,0)#        Read packet                      DI20 136
IF(IP<=0) iquit:(DI2018)#              Quit if pkt not there            DI20 137
ICNT=1-NINT(QX(IP+2))#                 Centricity a=0   c=1             DI20 138
LTYP=NINT(QX(IP+1))-7*ICNT#            Lattice code, 1...7              DI20 139
NSYM=NINT(QX(IP+3))#                   Total symmetry matrices          DI20 140
NROT=NINT(QX(IP+4))#                   Limit of rotation matrices       DI20 141
#                                                                       DI20 142
#	GET SYMMETRY EQUIVALENT POSITIONS                                     DI20 143
#                                                                       DI20 144
incrqx:(M2,M0+NSYM*nsymit:,DI2019)#    Request memory all symops        DI20 145
DO I=M0+1,M2; QX(I)=0.0#               Clear out symops data            DI20 146
M1=M0+NROT*nsymit:#                    Limit of rotation matrices       DI20 147
FOR(II=M0;II<M1;II=II+nsymit:)#        Loop over symmetry matrices      DI20 148
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  DI20 149
readwpkt:(1,lrsymm:,PSIZ,IP,0)#        Read packet                      DI20 150
IF(IP<=0) BREAK#                       Break at end                     DI20 151
movereal:(QX,IP+1,QX,II+1,12,1)#       Transfer packet                  DI20 152
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  DI20 153
IF(ICNT==1)#                           If centrosymmetric               DI20 154
DO I=1,NROT*nsymit:; QX(M1+I)=-QX(M0+I)# Store inverse matrix           DI20 155
#                                                                       DI20 156
#	EXPAND SYMOP TABLE FOR CENTRES                                        DI20 157
#                                                                       DI20 158
M1=M0+NROT*nsymit:+ICNT*NROT*nsymit:#  Store primitive marker with ce   DI20 159
II=M1#                                                                  DI20 160
IF(LTYP>1)#                            Test if sg centered              DI20 161
FOR(J=M0;J<M1;J=J+nsymit:)#            Loop over symm matrices          DI20 162
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  DI20 163
movereal:(QX,J+1,QX,II+1,9,0)#         Transfer rot elements            DI20 164
QX(II+10)=QX(J+10)+TR11(LTYP-1)#       Transfer t1                      DI20 165
QX(II+11)=QX(J+11)+TR12(LTYP-1)#       Transfer t2                      DI20 166
QX(II+12)=QX(J+12)+TR13(LTYP-1)#       Transfer t3                      DI20 167
II=II+nsymit:#                         Incr storage pointer             DI20 168
IF((LTYP==2)\(LTYP>4)) NEXT#           Skip if not r or f               DI20 169
movereal:(QX,J+1,QX,II+1,9,0)#         Transfer rot elements            DI20 170
QX(II+10)=QX(J+10)+TR21(LTYP-2)#       Transfer t1                      DI20 171
QX(II+11)=QX(J+11)+TR22(LTYP-2)#       Transfer t2                      DI20 172
QX(II+12)=QX(J+12)+TR23(LTYP-2)#       Transfer t3                      DI20 173
II=II+nsymit:#                         Incr storage pointer             DI20 174
IF(LTYP!=4) NEXT#                      Skip if not f-centre             DI20 175
movereal:(QX,J+1,QX,II+1,9,0)#         Transfer rot elements            DI20 176
QX(II+10)=QX(J+10)+0.5#                Transfer t1                      DI20 177
QX(II+11)=QX(J+11)+0.5#                Transfer t2                      DI20 178
QX(II+12)=QX(J+12)+0.0#                Transfer t3                      DI20 179
II=II+nsymit:#                         Incr storage pointer             DI20 180
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  DI20 181
M2=II#                                 End of symmetry matrices         DI20 182
#                                                                       DI20 183
# SIGMA(N) FACTORS                                                      DI20 184
# ----------------                                                      DI20 185
#                                      ****** bdf record lrscat         DI20 186
IWNT(1)=1;    IWNT(2)=3#               Want atomic pop. & no.           DI20 187
KEY(1)=2;KEY(2)=0;KEY(3)=0;KEY(4)=0#   Set search delimiters            DI20 188
indexpkt:(1,lrscat:,PSIZ,IP,0,KEY,IWNT,IREL)# Locate wanted idnums      DI20 189
IF(KEY(4)<0) iquit:(DI2020)#           No celcon                        DI20 190
SIG2=0.0;SIG3=0.0;SIG4=0.0;SIG5=0.0#   Init accu                        DI20 191
IF(LTYP<5) PFAC=FLOAT(LTYP)#           Get primitivity factor           DI20 192
ELSE        PFAC=2.#                   Prim. factor =2. for a,b,c       DI20 193
REPEAT#                                Loop all atom types              DI20 194
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  DI20 195
readwpkt:(1,lrscat:,PSIZ,IP,0)#        Point to next packet             DI20 196
IF(IP<=0) BREAK#                       If no more exit                  DI20 197
I=IP+IREL(1);  C=QX(I)#                Get atoms per cell               DI20 198
I=IP+IREL(2);  D=QX(I)#                Get atomic number                DI20 199
#C=C/PFAC                              CONVERT CELCON TO PRIMITIVE      DI20 200
SIG2=SIG2+C*D**2#                      Sum n*z**2                       DI20 201
SIG3=SIG3+C*D**3#                      Sum n*z**3                       DI20 202
SIG4=SIG4+C*D**4#                      Sum n*z**4                       DI20 203
SIG5=SIG4+C*D**5#                      Sum n*z**5                       DI20 204
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  DI20 205
IF(ATMTYP==yes:) SIG=SIG3**2/(SIG2*SIG4)#                               DI20 206
ELSE             SIG=1.0#                                               DI20 207
#                                                                       DI20 208
# SCALE INFORMATION (LREXPL:)                                           DI20 209
# ---------------------------                                           DI20 210
#                                                                       DI20 211
IWNT(1)=1#                             Data set                         DI20 212
IWNT(2)=2#                             Wavelength                       DI20 213
#                                                                       DI20 214
KEY(1)=2#                              1 to key(1) mandatory items      DI20 215
KEY(2)=0#                              Key(1) + 1 to key(2) optional    DI20 216
KEY(3)=0#                              Key(2) + 1 to key(3) add/del     DI20 217
KEY(4)=0#                              Update mode                      DI20 218
indexpkt:(1,lrexpl:,PSIZ,IP,0,KEY,IWNT,IREL)# Scan directory            DI20 219
#                                                                       DI20 220
IF(IREL(1)==0) iquit:(DI2002)#         Must have data set               DI20 221
IF(IREL(2)==0) iquit:(DI2003)#         Must have wavelength             DI20 222
#                                                                       DI20 223
REPEAT#                                Loop over data sets              DI20 224
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  DI20 225
readwpkt:(1,lrexpl:,PSIZ,IP,0)#        Get packet pointer               DI20 226
IF(IP<=0) BREAK#                       Exit after last packet           DI20 227
I=IP+IREL(1); IF(dset:!=NINT(QX(I)))NEXT# Skip unwanted idnum           DI20 228
I=IP+IREL(2); LAMBDA=QX(I)#            Point to lambda                  DI20 229
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  DI20 230
#                                                                       DI20 231
# H, K, L, SIN(THETA)/LAMBDA, REFL.MULT., F(REL) (LRREFL:)              DI20 232
# --------------------------------------------------------              DI20 233
#                                                                       DI20 234
IWNT(1)  = 1#                          Miller indices packed word       DI20 235
IWNT(2)  = 2#                          Sin(theta)/lambda                DI20 236
IWNT(3)  = 3#                          Reflection multiplicity          DI20 237
IWNT(4)  = 1000+302#                   |f(rel)|**2                      DI20 238
IWNT(5)  = 1000+303#                   Sigma |f(rel)|**2                DI20 239
IWNT(6)  = 1000+309#                   Scale group number               DI20 240
IWNT(7)  = 1000+600#                   |e|                              DI20 241
IWNT(8)  = 1000+604#                   Expectation value f**2 random    DI20 242
IWNT(9)  = 1000+605#                   Expectation value f**2 fragmen   DI20 243
IWNT(10) = 1000+800#                   |f(cal)|                         DI20 244
IWNT(11) = 1000+801#                   A(cal)                           DI20 245
IWNT(12) = 1000+910#                   Sim weight                       DI20 246
IWNT(13) = 1000+930#                   |f|**2 single crystal            DI20 247
IWNT(14) = 1000+940#                   Half-width                       DI20 248
IWNT(15) = 1000+950#                   |e| single crystal               DI20 249
IWNT(16) = 1000+980#                   Overlap groups                   DI20 250
IWNT(17) = 1000+983#                   Use ref for fourier or not       DI20 251
IWNT(18) = 1000+941#                   Twotheta from extrac             DI20 252
#                                                                       DI20 253
KEY(1)=3#                              1 to key(1) mandatory items      DI20 254
KEY(2)=18#                             Key(1) + 1 to key(2) optional    DI20 255
KEY(3)=18#                             Key(2) + 1 to key(3) add/del     DI20 256
KEY(4)=0#                              Update mode                      DI20 257
indexpkt:(1,lrrefl:,PSIZ,IP,0,KEY,IWNT,IREL)# Scan directory            DI20 258
#                                                                       DI20 259
IF(IREL(1)==0) iquit:(DI2007)#         No miller indices packed word    DI20 260
IF(IREL(2)==0) iquit:(DI2008)#         No sin(theta)/lambda             DI20 261
IF(IREL(3)==0) iquit:(DI2009)#         No refl multiplicity             DI20 262
IFTRL = yes: ;IF(IREL(4)==0)  IFTRL = no:#                              DI20 263
ISGFT = yes: ;IF(IREL(5)==0)  ISGFT = no:#                              DI20 264
ISCGR = yes: ;IF(IREL(6)==0)  ISCGR = no:#                              DI20 265
IE    = yes: ;IF(IREL(7)==0)  IE    = no:#                              DI20 266
IFTRE = yes: ;IF(IREL(8)==0)  IFTRE = no:#                              DI20 267
IFTFE = yes: ;IF(IREL(9)==0)  IFTFE = no:#                              DI20 268
IFCAL = yes: ;IF(IREL(10)==0) IFCAL = no:#                              DI20 269
IACAL = yes: ;IF(IREL(11)==0) IACAL = no:#                              DI20 270
ISIMW = yes: ;IF(IREL(12)==0) ISIMW = no:#                              DI20 271
IFSCR = yes: ;IF(IREL(13)==0) IFSCR = no:#                              DI20 272
IHW   = yes: ;IF(IREL(14)==0) IHW   = no:#                              DI20 273
IESCR = yes: ;IF(IREL(15)==0) IESCR = no:#                              DI20 274
IOVLG = yes: ;IF(IREL(16)==0) IOVLG = no:#                              DI20 275
IUSE  = yes: ;IF(IREL(17)==0) IUSE  = no:#                              DI20 276
ITWOT = yes: ;IF(IREL(18)==0) ITWOT = no:#                              DI20 277
#                                                                       DI20 278
# START REFLECTION LOOP                                                 DI20 279
# ---------------------                                                 DI20 280
#                                                                       DI20 281
M3=M2#                                 End of refl. items               DI20 282
NR=M2-nrefit:#                         Start-1-stepm0 of refl. items    DI20 283
REPEAT#                                Loop over all reflections        DI20 284
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 DI20 285
readwpkt:(1,lrrefl:,PSIZ,IP,0)#        Read next reflection packet      DI20 286
IF(IP<=0) BREAK#                       Test if last packet              DI20 287
#                                                                       DI20 288
NR=NR+nrefit:#                         Next set of hkl items            DI20 289
incrqx:(M3,M3+nrefit:,DI2001)#         Expand qx                        DI20 290
#                                                                       DI20 291
I=IP+IREL(1); hkl:=QX(I)#                                               DI20 292
I=IP+IREL(2); stl:=QX(I)#                                               DI20 293
I=IP+IREL(3)#                                                           DI20 294
intunpak:(QX(I),J,0,5)#                Unpack refl. multiplicity        DI20 295
rmul:=FLOAT(J)#                        Xtal mult. is only hemisphere    DI20 296
intunpak:(QX(I),J,5,7)#                Unpack epsilon                   DI20 297
eps:=FLOAT(J)#                         Move it                          DI20 298
I=IP+IREL(4);  ftold:=voidflg:; IF(IFTRL==yes:) ftold:=QX(I)#           DI20 299
I=IP+IREL(5);  sgft:=voidflg:; IF(ISGFT==yes:) sgft:=QX(I)#             DI20 300
I=IP+IREL(6);  scgr:=voidflg:; IF(ISCGR==yes:) scgr:=QX(I)#             DI20 301
I=IP+IREL(7);  eold:=voidflg:; IF(IE   ==yes:) eold:=QX(I)#             DI20 302
I=IP+IREL(8);  ftre:=voidflg:; IF(IFTRE==yes:) ftre:=QX(I)#             DI20 303
I=IP+IREL(9);  ftfe:=voidflg:; IF(IFTFE==yes:) ftfe:=QX(I)#             DI20 304
I=IP+IREL(10); fcal:=voidflg:; IF(IFCAL==yes:) fcal:=QX(I)#             DI20 305
I=IP+IREL(11); acal:=voidflg:; IF(IACAL==yes:) acal:=QX(I)#             DI20 306
I=IP+IREL(12); simw:=voidflg:; IF(ISIMW==yes:) simw:=QX(I)#             DI20 307
I=IP+IREL(13); fscr:=voidflg:; IF(IFSCR==yes:) fscr:=QX(I)#             DI20 308
I=IP+IREL(14); hw:  =voidflg:; IF(IHW  ==yes:) hw:  =QX(I)#             DI20 309
I=IP+IREL(15); escr:=voidflg:; IF(IESCR==yes:) escr:=QX(I)#             DI20 310
I=IP+IREL(16); ovlg:=voidflg:; IF(IOVLG==yes:) ovlg:=QX(I)#             DI20 311
I=IP+IREL(17); use: =voidflg:; IF(IUSE ==yes:) use: =QX(I)#             DI20 312
I=IP+IREL(18); twot:=voidflg:; IF(ITWOT==yes:) twot:=QX(I)#             DI20 313
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 DI20 314
readwpkt:(1,endrecord:,PSIZ,IP,0)#     Goto end of file a, close file   DI20 315
NHKL=(M3-M2)/nrefit:#                  Number of reflections            DI20 316
#                                                                       DI20 317
# SIN(THETA/LAMBDA) LIMITS                                              DI20 318
# ------------------------                                              DI20 319
#                                                                       DI20 320
MAXH(1)=0; MAXH(2)=0; MAXH(3)=0; STLL(1)=100.0; STLL(2)=0.0#            DI20 321
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI20 322
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 DI20 323
gethkl:(NR+1,H)#                       Unpack h, k, l                   DI20 324
MAXH(1)=MAX(MAXH(1),ABS(H(1)))#        Max /h/                          DI20 325
MAXH(2)=MAX(MAXH(2),ABS(H(2)))#        Max /k/                          DI20 326
MAXH(3)=MAX(MAXH(3),ABS(H(3)))#        Max /l/                          DI20 327
STLL(1)=MIN(STLL(1),stl:)#             Minimum                          DI20 328
STLL(2)=MAX(STLL(2),stl:)#             Maximum                          DI20 329
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 DI20 330
STCC(1)=MAX(STCC(1),STLL(1))#          Determine actual stl min         DI20 331
STCC(2)=MIN(STCC(2),STLL(2))#          Determine actual stl max         DI20 332
#                                                                       DI20 333
# WRITE PARAMETERS TO LINEOUT                                           DI20 334
# ---------------------------                                           DI20 335
#                                                                       DI20 336
movechar:(UNDL,1,CHROT,1,NDI20A,1)#    Put -'s into chrot               DI20 337
writeline:(1,DI20A,NDI20A,2,3)#        Output header with underline     DI20 338
#                                                                       DI20 339
ncodefld:(LAMBDA,1,FB10A,440962.,1)#   Format lambda                    DI20 340
writeline:(0,FB10A,NFB10A,3,3)#        Print lambda                     DI20 341
ncodefld:(MAXH,1,FB10H,FMTMH,3)#       Format max hkl                   DI20 342
writeline:(0,FB10H,NFB10H,3,3)#        Print max hkl                    DI20 343
ncodefld:(STLL,1,FB10I,FMTSL,2)#       Format stl limits                DI20 344
writeline:(0,FB10I,NFB10I,3,3)#        Print stl limits                 DI20 345
ncodefld:(STCC,1,FB10K,FMTSL,2)#       Format stl limits calc           DI20 346
writeline:(0,FB10K,NFB10K,3,3)#        Print stl limits  calc           DI20 347
BUFOT(1)=2.0*ASIN(STLL(1)*LAMBDA)*(360.0/6.283185)#                     DI20 348
BUFOT(2)=2.0*ASIN(STLL(2)*LAMBDA)*(360.0/6.283185)#                     DI20 349
ncodefld:(BUFOT,1,FB10J,FMTSL,2)#      Format tt limits                 DI20 350
writeline:(0,FB10J,NFB10J,3,3)#        Print tt limits                  DI20 351
BUFOT(1)=2.0*ASIN(STCC(1)*LAMBDA)*(360.0/6.283185)#                     DI20 352
BUFOT(2)=2.0*ASIN(STCC(2)*LAMBDA)*(360.0/6.283185)#                     DI20 353
ncodefld:(BUFOT,1,FB10K,FMTSL,2)#      Format tt limits                 DI20 354
writeline:(0,FB10K,NFB10K,3,3)#        Print tt limits                  DI20 355
#                                                                       DI20 356
IF(IOVLG==no: \ $#                     No group info from bdf           DI20 357
  ILAPFA==yes:)#                       Or new ovlapf from user          DI20 358
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 DI20 359
IF(IHW==no: ) writeline:(0,DI20H,NDI20H,3,3)#                           DI20 360
IF(IHW==yes:) writeline:(0,DI20I,NDI20I,3,3)#                           DI20 361
FMT=610842. ;ncodefld:(LAPFAC,1,DI20G,FMT,1)# Paste lapfac into...      DI20 362
writeline:(0,DI20G,NDI20G,3,3)#                                         DI20 363
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 DI20 364
IF(IOVLG==yes: & ILAPFA==no:)$#        Group info from bdf and no new   DI20 365
writeline:(1,DI20F,NDI20F,3,3)#        Lapfac from user                 DI20 366
#                                                                       DI20 367
IF(ITWOT==no: ) writeline:(0,DI2H,NDI2H,3,3)#                           DI20 368
IF(ITWOT==yes:) writeline:(0,DI2I,NDI2I,3,3)#                           DI20 369
#                                                                       DI20 370
IF(DIVFEQ==yes:) writeline:(1,DI20M,NDI20M,3,3)#                        DI20 371
IF(DIVFMU==yes:) writeline:(1,DI20N,NDI20N,3,3)#                        DI20 372
IF(DIVFEP==yes:) writeline:(1,DI20Z,NDI20Z,3,3)#                        DI20 373
IF(DIVRAN==yes:)#                                                       DI20 374
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 DI20 375
FMT=800813.;ncodefld:(FLOAT(ISEED),1,DI20O,FMT,1)# Paste it into ...    DI20 376
writeline:(1,DI20O,NDI20O,3,3)#        Tell user                        DI20 377
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 DI20 378
IF(DIVPAT==yes:) writeline:(1,DI20P,NDI20P,3,3)#                        DI20 379
IF(DIVVEC==yes:)#                                                       DI20 380
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 DI20 381
writeline:(1,DI20Q,NDI20Q,3,3)#                                         DI20 382
BUFOT(1)=SIG5/(SIG4*SQRT(SIG2))#                                        DI20 383
FMT=601561. ;ncodefld:(BUFOT,1,DI20X,FMT,1)#                            DI20 384
writeline:(0,DI20X,NDI20X,3,3)#                                         DI20 385
BUFOT(1)=SIG#                                                           DI20 386
FMT=601562. ;ncodefld:(BUFOT,1,DI20Y,FMT,1)#                            DI20 387
IF(ATMTYP==yes:) writeline:(0,DI20Y,NDI20Y,3,3)#                        DI20 388
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 DI20 389
IF(DIVFCA==1   ) writeline:(1,DI20R,NDI20R,3,3)#                        DI20 390
IF(DIVFCA==2   ) writeline:(1,DI20S,NDI20S,3,3)#                        DI20 391
IF(DIVEXP==1   ) writeline:(1,DI20T,NDI20T,3,3)#                        DI20 392
IF(DIVEXP==2   ) writeline:(1,DI20U,NDI20U,3,3)#                        DI20 393
IF(BOOSTR!=no:)#                       D                                DI20 394
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 15 DI20 395
FMT=671351.#                                                            DI20 396
IF(BOOSTR==1)#                                                          DI20 397
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16 DI20 398
ncodefld:(BOOFAC,1,DI2V,FMT,1)#        Paste it into ...                DI20 399
writeline:(1,DI2V,NDI2V,3,3)#          Di                               DI20 400
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 16 DI20 401
IF(BOOSTR==2)#                                                          DI20 402
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 17 DI20 403
ncodefld:(BOOFAC,1,DI2W,FMT,1)#        Paste it into ...                DI20 404
writeline:(1,DI2W,NDI2W,3,3)#          Di                               DI20 405
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 17 DI20 406
IF(BOOSTR==3)#                                                          DI20 407
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 18 DI20 408
ncodefld:(BOOFAC,1,DI2X,FMT,1)#        Paste it into ...                DI20 409
writeline:(1,DI2X,NDI2X,3,3)#          Di                               DI20 410
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 18 DI20 411
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 15 DI20 412
#                                                                       DI20 413
# TEST IF NEEDED ITEMS ARE PRESENT                                      DI20 414
# --------------------------------                                      DI20 415
#                                                                       DI20 416
IF(DIVFEQ==yes: &  IFTRL==no:)                    iquit:(DI2011)# Di    DI20 417
IF(DIVFEP==yes: &  IFTRL==no:)                    iquit:(DI2011)# Di    DI20 418
IF(DIVFMU==yes: &  IFTRL==no:)                    iquit:(DI2011)# Di    DI20 419
IF(DIVRAN==yes: &  IFTRL==no:)                    iquit:(DI2011)# Di    DI20 420
IF(DIVPAT==yes: & (IFTRL==no: \ IACAL==no:))      iquit:(DI2012)# Di    DI20 421
IF(DIVVEC==yes: & (IFTRL==no:\IACAL==no:\IE==no:))iquit:(DI2013)# Di    DI20 422
IF(DIVFCA==1    & (IFTRL==no:\IFCAL==no:))        iquit:(DI2014)# Di    DI20 423
IF(DIVFCA==2    & (IFTRL==no:\IFCAL==no:\ISIMW==no:))iquit:(DI2015)#    DI20 424
IF(DIVEXP==1    & (IFTRL==no:\IFTFE==no:))        iquit:(DI2017)# Di    DI20 425
IF(DIVEXP==2    & (IFTRL==no:\IFTFE==no:))        iquit:(DI2017)# Di    DI20 426
IF(DIVVOL==yes: &  IFTRL==no:) iquit:(DI2021)# Di                       DI20 427
#                                                                       DI20 428
RETURN#                                                                 DI20 429
END#                                                                    DI20 430
systemheader:(DI30)#                                                    DI30   1
######################################################################  DI30   2
#                                                                    #  DI30   3
#                               DI30                                 #  DI30   4
#                                                                    #  DI30   5
######################################################################  DI30   6
SUBROUTINE DI30#                                                        DI30   7
include:(AACOMN)#                                                       DI30   8
include:(DICOMN)#                                                       DI30   9
#                                                                       DI30  10
# GROUPS                                                                DI30  11
#                                                                       DI30  12
INTEGER IEQ#              ## Local counter                              DI30  13
INTEGER NHKLO#            ## number of overlapping reflections          DI30  14
INTEGER NHKLNO#           ## number of not overlapping reflections      DI30  15
INTEGER NGROUP#           ## number of groups of overlapping reflecti   DI30  16
INTEGER NGROUPN#          ## number of not modif. groups                DI30  17
INTEGER NHKLOBS#          ## number of "observed" groups                DI30  18
INTEGER GROUP#            ## yes:/no:, group ok                         DI30  19
INTEGER NRKEEP,NR1,NR2#                                                 DI30  20
#                                                                       DI30  21
# SUMS                                                                  DI30  22
#                                                                       DI30  23
REAL    SUMEPS#                                                         DI30  24
REAL    SUMOLD#                                                         DI30  25
REAL    SUMMUL#                                                         DI30  26
REAL    SUMRND#                                                         DI30  27
REAL    SUMNEW#                                                         DI30  28
REAL    SUMACAL#                                                        DI30  29
REAL    SCALFIX#                                                        DI30  30
REAL    SUM2STA#                                                        DI30  31
REAL    SUM2STN#                                                        DI30  32
REAL    SUMVT#                                                          DI30  33
REAL    SUMVB#                                                          DI30  34
REAL    SUMT#                                                           DI30  35
REAL    SUMB#                                                           DI30  36
REAL    D,DKEEP,DMAX,FAVE,NFAVE,A,B#                                    DI30  37
#                                                                       DI30  38
# R-VALUES                                                              DI30  39
#                                                                       DI30  40
REAL    SDF(4)#                                                         DI30  41
REAL    SF(4)#                                                          DI30  42
REAL    SDE(4)#                                                         DI30  43
REAL    SE(4)#                                                          DI30  44
REAL    SDEC(2)#                                                        DI30  45
REAL    SEC(2)#                                                         DI30  46
#                                                                       DI30  47
REAL    SUMVEC#                                                         DI30  48
#                                                                       DI30  49
REAL    SQED(4)#                                                        DI30  50
REAL    SQE(4)#                                                         DI30  51
# (1) SUM | F(I+1) - F(I) | NO OVERL OLD                                DI30  52
# (2) SUM | F(I+1) - F(I) | OVERLAP  OLD                                DI30  53
# (3) SUM | F(I+1) - F(I) | NO OVERL NEW                                DI30  54
# (4) SUM | F(I+1) - F(I) | OVERLAP  NEW                                DI30  55
#                                                                       DI30  56
# R/W BDF                                                               DI30  57
#                                                                       DI30  58
REAL    H(3)#                                                           DI30  59
REAL    H1(3)#                                                          DI30  60
REAL    H2(3)#                                                          DI30  61
REAL    H3(3)#                                                          DI30  62
INTEGER MARKS#                         Begin of empty qx space          DI30  63
INTEGER IWNT(50)#                      Wanted items for indexpkt:       DI30  64
INTEGER IREL(51)#                      Pointers for qx                  DI30  65
INTEGER KEY(4)#                        Flag for indexpkt:               DI30  66
INTEGER IPA#                           Packet pointer for qx            DI30  67
INTEGER IPB#                           Packet pointer for qx            DI30  68
INTEGER PSIZA#                         Packet size filea                DI30  69
INTEGER PSIZB#                         Packet size fileb                DI30  70
#                                                          Di30  47     DI30  71
# E-DISTRIBUTION, STATISTICS                                            DI30  72
#                                                                       DI30  73
REAL    E1#                                                             DI30  74
REAL    MUL#                                                            DI30  75
REAL    PERCOV(9)#                     Percentage of e > z overlap      DI30  76
REAL    POPUOV(9)#                     Population of e > z overlap      DI30  77
REAL    PERCNO(9)#                     Percentage of e > z no overlap   DI30  78
REAL    POPUNO(9)#                     Population of e > z no overlap   DI30  79
REAL    PERCAL(9)#                     Percentage of e > z no all       DI30  80
REAL    POPUAL(9)#                     Population of e > z no all       DI30  81
REAL    ESTAOV(5)#                     E-statistics overlap             DI30  82
##	ESTAOV(1)                      Mean /e/         overlap              DI30  83
##	ESTAOV(2)                      Mean /e**2/      overlap              DI30  84
##	ESTAOV(3)                      Mean /e**2-1/    overlap              DI30  85
##	ESTAOV(4)                      Mean /e**2-1/**2 overlap              DI30  86
##	ESTAOV(5)                      Mean /e**2-1/**3 overlap              DI30  87
REAL    ESTANO(5)#                     E-statistics no overlap          DI30  88
REAL    ESTAAL(5)#                     E-statistics all values          DI30  89
#                                                                       DI30  90
# E-STATISTICS                                                          DI30  91
#                                                                       DI30  92
chardata:(EV1,-)#                                                       DI30  93
chardata:(EV3, OVERLAP      )#                                          DI30  94
chardata:(EV4, NO OVERLAP   )#                                          DI30  95
chardata:(EV5, ALL          )#                                          DI30  96
chardata:(EV7, THEORY RANDOM P1B)#                                      DI30  97
chardata:(EV8, THEORY RANDOM P1)#                                       DI30  98
chardata:(EV9, E-STATISTICS MEAN /E/       /E**2/    /E**2-1/$#         DI30  99
/E**2-1/**2  /E**2-1/**3)#                                              DI30 100
chardata:(EV10, E-DISTRIBUTION PERCENTAGES /E/>)#                       DI30 101
chardata:(EV17, POPULATION)#                                            DI30 102
realdata:(ESTAT,[.798,1.,.968,2.,8.,.886,1.,.736,1.,2.])#               DI30 103
realdata:(EDIST,[.0, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.5, 3.0,#           DI30 104
100.0,31.73,23.01,16.15,10.96, 7.19, 4.55, 1.24, 0.27,#                 DI30 105
100.0,36.79,23.69,14.09, 7.73, 3.92, 1.83, 0.19, 0.01])#                DI30 106
realdata:(FM2,[250632.,370632.,490632.,610632.,730632.])#               DI30 107
realdata:(FM3,[250622.,320622.,390622.,460622.,530622.,600622.,#        DI30 108
670622.,740622.,810622.])#                                              DI30 109
realdata:(FM4,[250613.,320613.,390613.,460613.,530613.,600613.,#        DI30 110
670613.,740613.,810613.])#                                              DI30 111
#                                                                       DI30 112
realdata:(TWOPI,6.28318530718)#        Just that                        DI30 113
#                                                                       DI30 114
# RESOLUTION                                                            DI30 115
#                                                                       DI30 116
realdata:(ARESOL,[100.0,5.0,3.5,2.5,2.0,1.7,1.5,1.4,1.3,1.2,$#          DI30 117
1.1,1.0])#                                                              DI30 118
REAL    TRESOL(12)#                                                     DI30 119
INTEGER NMEA(13)#                                                       DI30 120
INTEGER NPOW(13)#                                                       DI30 121
INTEGER NOV(13)#                                                        DI30 122
INTEGER NNOV(13)#                                                       DI30 123
INTEGER NRESM#                                                          DI30 124
realdata:(FMNO,[250413.,320413.,390413.,460413.,530413.,600413.,#       DI30 125
670413.,740413.,810413.,880413.,950413.,1020413.,1090413.])#            DI30 126
realdata:(FMAR,[290312.,360312.,430312.,500312.,570312.,640312.,#       DI30 127
710312.,780312.,850312.,920312.,990312.,1060312.,1130312.])#            DI30 128
realdata:(FMTR,[300412.,370412.,440412.,510412.,580412.,650412.,#       DI30 129
720412.,790412.,860412.,930412.,1000412.,1070412.,1140412.])#           DI30 130
#                                                                       DI30 131
# LIST DATA                                                             DI30 132
#                                                                       DI30 133
chardata:(DI30A,[$#                                                     DI30 134
REFLECTIONS IN 2THETA ORDER])#                                          DI30 135
chardata:(DI30B,[$#                                                     DI30 136
  H  K  L  M  E  SINTL   2THETA  HW(TT)  GROUP       $#                 DI30 137
                                                              $#        DI30 138
           ])#                                                          DI30 139
#                                                                       DI30 140
chardata:(DI30C,[$#                                                     DI30 141
NUMBER OF reflections:       ALL    NO OVERLAP          OVERLAP $#      DI30 142
    OBSERVED])#                                                         DI30 143
chardata:(DI30D,[$#                                                     DI30 144
NUMBER OF OVERLAP groups:    ALL      MODIFIED     NOT MODIFIED])#      DI30 145
chardata:(RC2AD,[$#                                                     DI30 146
AVE SUM /F(I+1) - F(I)/ : F(OLD)])#                                     DI30 147
chardata:(RC2AG,[$#                                                     DI30 148
AVE SUM /E(I+1) - E(I)/ : E(OLD)])#                                     DI30 149
#                                                                       DI30 150
chardata:(UNDL,-)#                                                      DI30 151
#                                                                       DI30 152
# PSEUDO TRANSLATIONS                                                   DI30 153
#                                                                       DI30 154
INTEGER PSTRA(4,64)#                                                    DI30 155
REAL    PSEOV(4,72)#                                                    DI30 156
REAL    PSENO(4,72)#                                                    DI30 157
REAL    PSEAL(4,72)#                                                    DI30 158
DATA PSTRA/$#                                                           DI30 159
0,0,0,1,  1,0,0,2,  0,1,0,2,  0,0,1,2,  1,1,1,2,  1,1,0,2,  1,0,1,2,#   DI30 160
0,1,1,2,  1,0,0,3,  0,1,0,3,  0,0,1,3,  1,1,0,3,  1,0,1,3,  0,1,1,3,#   DI30 161
1,1,1,3,  1,1,2,3,  1,2,1,3,  2,1,1,3,  1,2,0,3,  1,0,2,3,  0,1,2,3,#   DI30 162
0,0,1,4,  0,1,0,4,  1,0,0,4,  1,1,0,4,  1,0,1,4,  0,1,1,4,  1,1,1,4,#   DI30 163
2,2,1,4,  2,1,2,4,  1,2,2,4,  2,1,1,4,  1,2,1,4,  1,1,2,4,  1,2,0,4,#   DI30 164
1,0,2,4,  0,1,2,4,  2,1,0,4,  2,0,1,4,  0,2,1,4,  3,3,1,4,  3,1,3,4,#   DI30 165
1,3,3,4,  1,2,3,4,  1,3,2,4,  3,1,2,4,  1,3,0,4,  1,0,3,4,  0,1,3,4,#   DI30 166
0,3,2,6,  0,2,3,6,  2,3,0,6,  3,2,0,6,  3,0,2,6,  2,0,3,6,  2,2,3,6,#   DI30 167
3,2,3,6,  3,3,2,6,  0,4,3,12, 4,0,3,12, 4,3,0,12, 0,3,4,12, 3,4,0,12,#  DI30 168
3,0,4,12/#                                                              DI30 169
#                                                                       DI30 170
datastuff:#                                                             DI30 171
#                                                                       DI30 172
# SETUP DEFAULT VALUES                                                  DI30 173
# --------------------                                                  DI30 174
#                                                                       DI30 175
call srand(iseed)
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI30 176
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI30 177
IF(IHW   == no:)  hw:  = 0.5#          No half-width found on bdf       DI30 178
IF(IUSE  == no:)  use: = no:#          Default do not use               DI30 179
IF(stl:<STCC(1) \ $#                   Out of stl limit                 DI30 180
   stl:>STCC(2)) status:=stollimit:#   Outside stol limit               DI30 181
etca:   = voidflg:#                                                     DI30 182
nrf:    = 1.0#                         1 peak per group                 DI30 183
emx:    = 0.0#                                                          DI30 184
ftnew:  = ftold:#                                                       DI30 185
fold:   = voidflg:; IF(ftold:>=0.0) fold: = SQRT(ftold:)#               DI30 186
fnew:   = fold:#                                                        DI30 187
enew:   = eold:#                                                        DI30 188
status: = nogroup:#                    Refl. belongs to no group        DI30 189
rnlist: = RAND()#                      Feed rnlist with random number   DI30 190
IF(ITWOT==yes:) stl:=$#                2theta given                     DI30 191
SIN((TWOPI/360.0)*(twot:/2.0))/LAMBDA# Sin(theta)/lambda from 2theta    DI30 192
IF(ITWOT==no:) twot:=$#                2theta not given                 DI30 193
2.0*ASIN(stl:*LAMBDA)*(360.0/TWOPI)#   2theta from sin(theta)/lambda    DI30 194
add:    = -1.0#                        E**2 -1.0                        DI30 195
IF(SYMTRY==no:) pst:=eps:#                                              DI30 196
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI30 197
#                                                                       DI30 198
# CREATE INDEX TABLE FOR REFL. INCREASING IN SIN(THETA)/LAMBDA          DI30 199
# ------------------------------------------------------------          DI30 200
#                                                                       DI30 201
incrqx:(M4,M3+NHKL,DI3001)#            Expand qx                        DI30 202
#                                                                       DI30 203
FOR(NR=M2;NR<M3;NR=NR+nrefit:)temp:=0.0# Abuse temp: as a sortflag      DI30 204
IND=M3#                                Start-1 of index table           DI30 205
REPEAT#                                Loop over index table            DI30 206
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  DI30 207
IND=IND+1#                             +1 in index table                DI30 208
IF(IND>M4) BREAK#                      End of index table               DI30 209
#                                                                       DI30 210
FOR(NR=M2;NR<M3;NR=NR+nrefit:)$#       Loop over reflection list        DI30 211
IF(temp:==0.0) BREAK#                  Found a not yet sorted refl      DI30 212
QX(IND)=FLOAT(NR); A=stl:#             Keep index for not yet sorted    DI30 213
#                                                                       DI30 214
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over the remaining list     DI30 215
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  DI30 216
IF(temp:==1.0)NEXT#                    Already sorted - do not use      DI30 217
IF(A<stl:)NEXT#                        Search min sintl in unsorted     DI30 218
QX(IND)=FLOAT(NR); A=stl:#             Keep index for lower sintl       DI30 219
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  DI30 220
temp:(iqx:(IND))=1.0#                  Mark lowest sintl as sorted      DI30 221
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  DI30 222
#                                                                       DI30 223
# SET UP TABLE FOR OVERLAP GROUPS (IF NONE FROM BDF OR NEW OVLAPF)      DI30 224
# ----------------------------------------------------------------      DI30 225
#                                                                       DI30 226
IF(IOVLG==no: \ $#                     No group info from bdf           DI30 227
  ILAPFA==yes:)#                       Or new ovlapf from user          DI30 228
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  DI30 229
NGROUP=0#                              Setup counter number of sintl    DI30 230
IND=M3+1#                              Start of index list              DI30 231
REPEAT#                                Loop over refl.                  DI30 232
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  DI30 233
IF(IND>M4) BREAK#                      End of index list                DI30 234
#                                                                       DI30 235
IF(IND==M4)#                           Last in list                     DI30 236
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  DI30 237
NR=iqx:(IND)#                          Pick up index                    DI30 238
ovlg:=0.0#                             Mark as not overlapping          DI30 239
IND=IND+1#                             Next in index list               DI30 240
NEXT#                                  New refl.                        DI30 241
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  DI30 242
#                                                                       DI30 243
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 244
# DIFFERENT SIN(THETA)/LAMBDA -> NO GROUP                               DI30 245
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 246
IF($#                                  Test if                          DI30 247
(twot:(iqx:(IND+1))-twot:(iqx:(IND)))$# 2theta difference               DI30 248
>$#                                    Is greater than                  DI30 249
(hw:(iqx:(IND+1))+hw:(iqx:(IND)))*LAPFAC)# Halfwidth overlap range      DI30 250
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  DI30 251
NR=iqx:(IND)#                          Pick up index                    DI30 252
ovlg:=0.0#                             Mark as not overlapping          DI30 253
IND=IND+1#                             Next in index list               DI30 254
NEXT#                                  New refl.                        DI30 255
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  DI30 256
#                                                                       DI30 257
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 258
# EQUAL     SIN(THETA)/LAMBDA ->    GROUP OF OVERLAPPING PEAKS          DI30 259
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 260
IF($#                                  Test if                          DI30 261
(twot:(iqx:(IND+1))-twot:(iqx:(IND)))$# 2theta difference           d   DI30 262
<=$#                                   Is less or equal than            DI30 263
(hw:(iqx:(IND+1))+hw:(iqx:(IND)))*LAPFAC)# Halfwidth overlap range      DI30 264
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  DI30 265
NGROUP=NGROUP+1#                       Another group of at least 2 re   DI30 266
FOR(IEQ=2;IND+IEQ<=M4;IEQ=IEQ+1)$#     Count overlapping refl.          DI30 267
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  DI30 268
IF($#                                  Test if                          DI30 269
(twot:(iqx:(IND+IEQ))-twot:(iqx:(IND+IEQ-1)))$# 2theta difference   d   DI30 270
>$#                                    Is greater than                  DI30 271
(hw:(iqx:(IND+IEQ))+hw:(iqx:(IND+IEQ-1)))*LAPFAC)$# Halfwidth overlap   DI30 272
BREAK#                                 Stop when new group found        DI30 273
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  DI30 274
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over equal sintl             DI30 275
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 DI30 276
NR=iqx:(IND+J)#                        Pick up index                    DI30 277
ovlg:=FLOAT(NGROUP)#                   Indicate rfl. in same group      DI30 278
nrf: =FLOAT(IEQ)#                      Number of refl in that group     DI30 279
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 DI30 280
IND=IND+IEQ#                           Skip over already processed da   DI30 281
NEXT#                                  New refl.                        DI30 282
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  DI30 283
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  DI30 284
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  DI30 285
#                                                                       DI30 286
# MARK REFLECTIONS FOR THE SUBSEQUENT USE IN FOURIER (ITEM 1983)        DI30 287
# --------------------------------------------------------------        DI30 288
#                                                                       DI30 289
IF(SUBSEQ==yes:)#                                                       DI30 290
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 DI30 291
#                                                                       DI30 292
# DISABLE NOT USED REFS                                                 DI30 293
#                                                                       DI30 294
FOR(NR=M2;NR<M3;NR=NR+nrefit:) IF(use:==no:) acal:=voidflg:#            DI30 295
#                                                                       DI30 296
# EXPAND LIST                                                           DI30 297
#                                                                       DI30 298
IND=M3#                                Start-1 of index list            DI30 299
REPEAT#                                Search for first overlap         DI30 300
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 DI30 301
IND=IND+1#                             Next in index list               DI30 302
IF(IND>M4) BREAK#                      End of index list                DI30 303
NR=iqx:(IND)#                          Pick up index                    DI30 304
IF(use:==yes:) NEXT#                   Already ok                       DI30 305
IF(ovlg:==0.0) use:=yes:#              No overlap, use it               DI30 306
IF(ovlg:!=0.0) BREAK#                  Overlap, stop now                DI30 307
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 DI30 308
REPEAT#                                Jump over overlap refs           DI30 309
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 DI30 310
IF(IND>M4) BREAK#                      End of index list                DI30 311
NR=iqx:(IND)#                          Pick up index                    DI30 312
IF(ovlg:!=0.0) use:=yes:#              Overlap, use it                  DI30 313
IF(ovlg:==0.0) BREAK#                  No overlap, stop now             DI30 314
IND=IND+1#                             Next in index list               DI30 315
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 DI30 316
REPEAT#                                Search for next overlap          DI30 317
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 DI30 318
IF(IND>M4) BREAK#                      End of index list                DI30 319
NR=iqx:(IND)#                          Pick up index                    DI30 320
IF(ovlg:==0.0) use:=yes:#              No overlap, use it               DI30 321
IF(ovlg:!=0.0) BREAK#                  Overlap, stop now                DI30 322
IND=IND+1#                             Next in index list               DI30 323
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 DI30 324
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 DI30 325
#                                                                       DI30 326
# INACCESSIBLE VOLUMES                                                  DI30 327
# --------------------                                                  DI30 328
#                                                                       DI30 329
IF(DIVVOL==yes:) CALL DI67#                                             DI30 330
#                                                                       DI30 331
# SCALE FACTOR E TO F, F**2 = K * EPSILON * E**2                        DI30 332
# ----------------------------------------------                        DI30 333
#                                                                       DI30 334
IF(IE==yes:)#                          Only if e is there               DI30 335
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 15 DI30 336
IND=M3#                                Start-1 of index list            DI30 337
REPEAT#                                Loop over refl.                  DI30 338
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16 DI30 339
IND=IND+1#                             Next in index list               DI30 340
IF(IND>M4) BREAK#                      End of index list                DI30 341
NR=iqx:(IND)#                          Pick up index in table           DI30 342
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 343
IF(eold:!=0.0) scl: = ftold:/(eps:*eold:**2)# Scale                     DI30 344
IF(eold:==0.0)#                        Search for a non zero neighbou   DI30 345
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 17 DI30 346
FOR(J1=IND;J1>=M3+1;J1=J1-1)#                                           DI30 347
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 18 DI30 348
IF(status:(iqx:(J1))==stollimit:)BREAK# Outside stol limit              DI30 349
IF(eold:(iqx:(J1))!=0.0) BREAK#        Backward                         DI30 350
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 18 DI30 351
FOR(J2=IND;J2<=M4;J2=J2+1)#                                             DI30 352
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 19 DI30 353
IF(status:(iqx:(J2))==stollimit:)BREAK# Outside stol limit              DI30 354
IF(eold:(iqx:(J2))!=0.0) BREAK#        Forwards                         DI30 355
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 19 DI30 356
NR1=iqx:(J1); NR2=iqx:(J2)#            Make pointer local variable      DI30 357
IF(eold:(NR1)==0.0) NR1=NR2#           Use upper limit if no lower      DI30 358
IF(eold:(NR2)==0.0) NR2=NR1#           Use lower limit if no upper      DI30 359
scl:(NR) = ( ftold:(NR1)/(eps:(NR1)*eold:(NR1)**2)$# Di                 DI30 360
+ ftold:(NR2)/(eps:(NR2)*eold:(NR2)**2) )/2.0# Take average             DI30 361
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 17 DI30 362
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 16 DI30 363
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 15 DI30 364
#                                                                       DI30 365
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI30 366
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 20 DI30 367
gracc:=ovlg:#                                                           DI30 368
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 20 DI30 369
# SCALE E**2-1                                                          DI30 370
# ------------                                                          DI30 371
#                                                                       DI30 372
SUMVT=0.0; SUMVB=0.0#                                                   DI30 373
IF(DIVVEC==yes:)#                      Overall scale for /e/**2-1=aca   DI30 374
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 21 DI30 375
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI30 376
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 22 DI30 377
ifvo:(acal:) NEXT#                     Acal disabled                    DI30 378
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 379
SUMVT=SUMVT+rmul:*scl:*(pst:*SIG*eold:**2+add:)# Top                    DI30 380
SUMVB=SUMVB+rmul:*scl:*acal:#          Bottom                           DI30 381
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 22 DI30 382
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI30 383
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 23 DI30 384
ifvo:(acal:) NEXT#                     Acal disabled                    DI30 385
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 386
IF(SUMVB==0.0) NEXT#                   Prevent dividsion by zero        DI30 387
etca:=(acal:*(SUMVT/SUMVB)-add:)/(pst:*SIG)# /e/**2  cal                DI30 388
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 23 DI30 389
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 21 DI30 390
#                                                                       DI30 391
# LOOP OVER SORTED REFLECTIONS                                          DI30 392
# ----------------------------                                          DI30 393
#                                                                       DI30 394
NGROUP=0#                              Accu for number of groups        DI30 395
NGROUPN=0#                             Accu for not modified groups     DI30 396
NHKLNO=0#                              Accu for not overlapping refl.   DI30 397
#                                                                       DI30 398
IND=M3+1#                              Start   of index list            DI30 399
REPEAT#                                Loop over refl.                  DI30 400
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 24 DI30 401
IF(IND>M4) BREAK#                      End of index list                DI30 402
#                                                                       DI30 403
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 404
# DIFFERENT SIN(THETA)/LAMBDA -> NO GROUP                               DI30 405
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 406
IF(ovlg:(iqx:(IND))==0.0)#                                              DI30 407
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 25 DI30 408
NR=iqx:(IND)#                          Pick up index in table           DI30 409
IF(status:==stollimit:) GOTO 50#       Outside stol limit               DI30 410
NHKLNO=NHKLNO+1#                       Update number non overlap refl   DI30 411
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 25 DI30 412
#                                                                       DI30 413
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 414
# EQUAL     SIN(THETA)/LAMBDA ->    GROUP OF OVERLAPPING PEAKS          DI30 415
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 416
IF(ovlg:(iqx:(IND))>0.0)#              Overlap                          DI30 417
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 26 DI30 418
FOR(IEQ=2;(IND+IEQ)<=M4;IEQ=IEQ+1)$#   Count overlapping reflection     DI30 419
IF(ovlg:(iqx:(IND+IEQ-1)) != $#        Up to m2 in index table          DI30 420
ovlg:(iqx:(IND+IEQ))) BREAK#           Break if new group               DI30 421
NGROUP=NGROUP+1#                       One more group of overlapping    DI30 422
#                                                                       DI30 423
# ENABLE GROUP                                                          DI30 424
# ------------                                                          DI30 425
#                                                                       DI30 426
FOR(J=0;J<=IEQ-1;J=J+1)status:(iqx:(IND+J))=groupok:# Enable group      DI30 427
#                                                                       DI30 428
# CALCULATE BASIC PARTITIONS                                            DI30 429
# --------------------------                                            DI30 430
#                                                                       DI30 431
SUMOLD=0.0; SUMMUL=0.0; SUMRND=0.0; SUMEPS=0.0#                         DI30 432
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over equal sintl             DI30 433
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 27 DI30 434
NR=iqx:(IND+J)#                        Pick up index in table           DI30 435
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 436
SUMOLD  = SUMOLD  + rmul:*ftold:#      Sum up     frel**2               DI30 437
SUMMUL  = SUMMUL  + rmul:#             Sum up     rmul                  DI30 438
SUMEPS  = SUMEPS  + rmul:*eps:#        Sum up     epsilon               DI30 439
SUMRND  = SUMRND  + rnlist:#           Sum up random numbers            DI30 440
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 27 DI30 441
#                                                                       DI30 442
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over group                   DI30 443
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 28 DI30 444
NR=iqx:(IND+J)#                        Pick up index in table           DI30 445
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 446
#                                                                       DI30 447
#                                                                       DI30 448
feq:=voidflg:; fmu:=voidflg:; fep:=voidflg:; fran:=voidflg:#            DI30 449
fnew:=voidflg:#                                                         DI30 450
#                                                                       DI30 451
IF(SUMOLD>=0.0)#                                                        DI30 452
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 29 DI30 453
feq: = SQRT(SUMOLD/SUMMUL)#            Frel f=...=f       partition     DI30 454
fmu: = SQRT(SUMOLD/(IEQ*rmul:))#       Frel f*mu=...=f*mu partition     DI30 455
fep: = SQRT((SUMOLD/SUMEPS)*eps:)#     Frel random atom expectation     DI30 456
fran:= SQRT((SUMOLD*rnlist:)/(SUMRND*rmul:))# Frel random partition     DI30 457
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 29 DI30 458
IF( DIVFEQ==yes:) fnew:=feq:#          Convert to f=...=f               DI30 459
IF( DIVFEP==yes:) fnew:=fep:#          Convert to random atom expec.    DI30 460
IF( DIVFMU==yes:) fnew:=fmu:#          Convert to f*mu=...=f            DI30 461
IF( DIVRAN==yes:) fnew:=fran:#         Convert to random                DI30 462
ifvo:(fnew:)#                                                           DI30 463
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 30 DI30 464
fnew:  = fold:#                                                         DI30 465
ftnew: = ftold:#                                                        DI30 466
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30 DI30 467
ELSE#                                                                   DI30 468
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 31 DI30 469
ftnew: = fnew:**2.0#                                                    DI30 470
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 31 DI30 471
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 28 DI30 472
#                                                                       DI30 473
IF(SUMOLD==0.0)#                       Disable group                    DI30 474
FOR(J=0;J<=IEQ-1;J=J+1) status:(iqx:(IND+J))=sumoldzero:#               DI30 475
#                                                                       DI30 476
# ACAL = FCAL**2, PATTERSON                                             DI30 477
# -------------------------                                             DI30 478
#                                                                       DI30 479
IF(DIVPAT==yes: \ DIVVOL==yes:)#                                        DI30 480
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 32 DI30 481
FOR(J=0;J<=IEQ-1;J=J+1)#               Loop over group                  DI30 482
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 33 DI30 483
NR=iqx:(IND+J)#                        Pick up index in table           DI30 484
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 485
ifvo:(acal:)#                          Acal disabled                    DI30 486
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=notphased:#           DI30 487
IF(acal:<0.0)#                         Acal disabled                    DI30 488
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=notphased:#           DI30 489
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 33 DI30 490
#                                                                       DI30 491
SUMNEW=0.0#                                                             DI30 492
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 493
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 34 DI30 494
NR=iqx:(IND+J)#                        Pick up index in table           DI30 495
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 496
SUMNEW  = SUMNEW  + rmul:*acal:#       Sum up     acalc * mul           DI30 497
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 34 DI30 498
#                                                                       DI30 499
IF(SUMNEW==0.0)#                       Disable group                    DI30 500
FOR(J=0;J<=IEQ-1;J=J+1) status:(iqx:(IND+J))=sumnewzero:#               DI30 501
#                                                                       DI30 502
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 503
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 35 DI30 504
NR=iqx:(IND+J)#                        Pick up index in table           DI30 505
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 506
IF(status:==groupok:) fnew:=SQRT((SUMOLD/SUMNEW)*acal:)# All ok         DI30 507
IF(status:!=groupok:) fnew:=fold:#                                      DI30 508
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 35 DI30 509
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 32 DI30 510
#                                                                       DI30 511
# DIVIDE ACCORDING TO FCAL FROM =FC=                                    DI30 512
# ----------------------------------                                    DI30 513
#                                                                       DI30 514
IF(DIVFCA==1 \ DIVFCA==2)#             D                                DI30 515
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 36 DI30 516
FOR(J=0;J<=IEQ-1;J=J+1)#               Loop over group                  DI30 517
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 37 DI30 518
NR=iqx:(IND+J)#                        Pick up index in table           DI30 519
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 520
ifvo:(fcal:)#                          Fcal disabled                    DI30 521
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=notphased:#           DI30 522
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 37 DI30 523
#                                                                       DI30 524
SUMNEW=0.0#                                                             DI30 525
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 526
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 38 DI30 527
NR=iqx:(IND+J)#                        Pick up index in table           DI30 528
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 529
IF(DIVFCA==1)temp:=fcal:**2#                                            DI30 530
IF(DIVFCA==2)temp:=(fcal:*simw:)**2#                                    DI30 531
SUMNEW  = SUMNEW  + rmul:*temp:#                                        DI30 532
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 38 DI30 533
#                                                                       DI30 534
IF(SUMNEW==0.0)#                       Disable group                    DI30 535
FOR(J=0;J<=IEQ-1;J=J+1) status:(iqx:(IND+J))=sumnewzero:#               DI30 536
#                                                                       DI30 537
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 538
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 39 DI30 539
NR=iqx:(IND+J)#                        Pick up index in table           DI30 540
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 541
IF(status:==groupok:) fnew:=SQRT((SUMOLD/SUMNEW)*temp:)# All ok         DI30 542
IF(status:!=groupok:) fnew:=fold:#                                      DI30 543
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 39 DI30 544
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 36 DI30 545
#                                                                       DI30 546
# DIVIDE ACCORDING TO <|F(H)|**2> FROM ORIENTED FRAGMENT                DI30 547
# ------------------------------------------------------                DI30 548
#                                                                       DI30 549
IF(DIVEXP==1 \ DIVEXP==2)#                                              DI30 550
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 40 DI30 551
FOR(J=0;J<=IEQ-1;J=J+1)#               Loop over group                  DI30 552
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 41 DI30 553
NR=iqx:(IND+J)#                        Pick up index in table           DI30 554
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 555
ifvo:(ftfe:)#                          Acal disabled                    DI30 556
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=notphased:#           DI30 557
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 41 DI30 558
#                                                                       DI30 559
SUMNEW=0.0#                                                             DI30 560
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 561
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 42 DI30 562
NR=iqx:(IND+J)#                        Pick up index in table           DI30 563
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 564
IF(DIVEXP==1)temp:=ftfe:**2#                                            DI30 565
IF(DIVEXP==2)temp:=ftfe:**2/eps:#                                       DI30 566
SUMNEW  = SUMNEW  + rmul:*temp:#                                        DI30 567
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 42 DI30 568
#                                                                       DI30 569
IF(SUMNEW==0.0)#                       Disable group                    DI30 570
FOR(J=0;J<=IEQ-1;J=J+1) status:(iqx:(IND+J))=sumnewzero:#               DI30 571
#                                                                       DI30 572
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 573
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 43 DI30 574
NR=iqx:(IND+J)#                        Pick up index in table           DI30 575
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 576
IF(status:==groupok:) fnew:=SQRT((SUMOLD/SUMNEW)*temp:)# All ok         DI30 577
IF(status:!=groupok:) fnew:=fold:#                                      DI30 578
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 43 DI30 579
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 40 DI30 580
#                                                                       DI30 581
# ACALC = |E|**2-1, VECTORMAP                                           DI30 582
# ---------------------------                                           DI30 583
#                                                                       DI30 584
IF(DIVVEC==yes:)#                                                       DI30 585
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 44 DI30 586
FOR(J=0;J<=IEQ-1;J=J+1)#               Disable group if necessary       DI30 587
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 45 DI30 588
NR=iqx:(IND+J)#                        Pick up index in table           DI30 589
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 590
ifvo:(acal:)#                          Acal disabled                    DI30 591
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=notphased:#           DI30 592
IF(status:!=groupok:) NEXT#                                             DI30 593
IF(SUMVB==0.0)#                        Prevent division by zero         DI30 594
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=sumvbzero:#           DI30 595
IF(status:!=groupok:) NEXT#                                             DI30 596
IF(etca:<0.0)#                         /e/**2<0                         DI30 597
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=vecltm:#              DI30 598
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 45 DI30 599
#                                                                       DI30 600
SUMT=0.0; SUMB=0.0#                                                     DI30 601
FOR(J=0;J<=IEQ-1;J=J+1)#               Scale for group                  DI30 602
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 46 DI30 603
NR=iqx:(IND+J)#                        Pick up index in table           DI30 604
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 605
IF(status:!=groupok:) NEXT#                                             DI30 606
SUMT=SUMT+rmul:*scl:*(pst:*SIG*eold:**2+add:)# Top                      DI30 607
SUMB=SUMB+rmul:*scl:*(SUMVT/SUMVB)*acal:# Bottom    scaled data         DI30 608
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 46 DI30 609
FOR(J1=0;J1<=IEQ-1;J1=J1+1)#                                            DI30 610
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 47 DI30 611
IF(status:!=groupok:) NEXT#                                             DI30 612
IF(SUMB==0.0) status:(iqx:(IND+J1))=sumvbzero:#                         DI30 613
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 47 DI30 614
#                                                                       DI30 615
FOR(J=0;J<=IEQ-1;J=J+1)#               New e                            DI30 616
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 48 DI30 617
NR=iqx:(IND+J)#                        Pick up index in table           DI30 618
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 619
IF(status:!=groupok:)NEXT#             Do not test                      DI30 620
A=((SUMT/SUMB)*(SUMVT/SUMVB)*acal: - add:)/(pst:*SIG)# New e**2         DI30 621
IF(A<0.0)#                             Disable group                    DI30 622
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 49 DI30 623
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=vecltm:#              DI30 624
WRITE(6,*)'SUMVT SUMVB SUMVT/SUMVB ',SUMVT,SUMVB,SUMVT/SUMVB#           DI30 625
WRITE(6,*)'SUMT  SUMB  SUMT /SUMB  ',SUMT,SUMB,SUMT/SUMB#               DI30 626
WRITE(6,*)'(SUMT/SUMB)*(SUMVT/SUMVB)  ',(SUMT/SUMB)*(SUMVT/SUMVB)#      DI30 627
WRITE(6,*)'dito * acal ',(SUMT/SUMB)*(SUMVT/SUMVB)*acal:#               DI30 628
WRITE(6,*)' acal ',acal:#                                               DI30 629
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 49 DI30 630
IF(A>=0.0) enew:=SQRT(A)#                                               DI30 631
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 48 DI30 632
#                                                                       DI30 633
FOR(J=0;J<=IEQ-1;J=J+1)#               New f                            DI30 634
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 50 DI30 635
NR=iqx:(IND+J)#                        Pick up index in table           DI30 636
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 637
IF(status:!=groupok:)enew: = eold:#    No change                        DI30 638
fnew:=SQRT(scl: * eps: * enew:**2)#                                     DI30 639
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 50 DI30 640
#                                                                       DI30 641
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 44 DI30 642
#                                                                       DI30 643
# SEARCH FOR NEIGHBOURS                                                 DI30 644
# ---------------------                                                 DI30 645
#                                                                       DI30 646
IF(DIVNEI==yes:)#                                                       DI30 647
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 51 DI30 648
#                                                                       DI30 649
# SEARCH FOR DECENT NEIGHBOURHOOD                                       DI30 650
#                                                                       DI30 651
DMAX=G1+G5+G9#                         Define max neighbourhood         DI30 652
FOR(J=0;J<=IEQ-1;J=J+1)#               Loop over group                  DI30 653
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 52 DI30 654
NR1=iqx:(IND+J)#                       Pick up index in table           DI30 655
gethkl:(NR1+1,H1)#                     Unpack h, k, l                   DI30 656
DKEEP=DMAX#                            Only small neighbourhood         DI30 657
#                                                                       DI30 658
FAVE=0.0; NFAVE=0.0#                                                    DI30 659
FOR(NR2=M2;NR2<M3;NR2=NR2+nrefit:)#    Loop over reflections            DI30 660
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 53 DI30 661
IF(gracc:(NR2)!=0.0)NEXT#              Group not accessible             DI30 662
gethkl:(NR2+1,H2)#                     Unpack h, k, l                   DI30 663
FOR(I1=M0;I1<M1;I1=I1+nsymit:)#        Loop over primitive symop        DI30 664
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 54 DI30 665
H3(1)=QX(I1+1)*H2(1) + QX(I1+2)*H2(2) + QX(I1+3)*H2(3)#                 DI30 666
H3(2)=QX(I1+4)*H2(1) + QX(I1+5)*H2(2) + QX(I1+6)*H2(3)#                 DI30 667
H3(3)=QX(I1+7)*H2(1) + QX(I1+8)*H2(2) + QX(I1+9)*H2(3)#                 DI30 668
H(1)=H1(1)-H3(1); H(2)=H1(2)-H3(2); H(3)=H1(3)-H3(3)#                   DI30 669
IF(H(1)==0.0 & H(2)==0.0 & H(3)==0.0) NEXT# Equal (h,k,l)               DI30 670
D =   G1*H(1)**2     + G5*H(2)**2     + G9*H(3)**2$#                    DI30 671
    + 2*G6*H(2)*H(3) + 2*G3*H(1)*H(3) + 2*G2*H(1)*H(2)#                 DI30 672
IF(D>DKEEP) NEXT#                      No decent neighbourhood          DI30 673
FAVE=FAVE+fold:(NR2)**2#                                                DI30 674
NFAVE=NFAVE+1#                                                          DI30 675
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 54 DI30 676
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 53 DI30 677
acal:(NR1)=voidflg:#                   No neighbour found               DI30 678
IF(NFAVE!=0.0)FAVE=FAVE/NFAVE#                                          DI30 679
IF(NFAVE!=0.0)acal:(NR1)=FAVE#         Neighbour found            di3   DI30 680
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 52 DI30 681
#                                                                       DI30 682
# USE NEIGHBOUR TO DIVIDE                                               DI30 683
#                                                                       DI30 684
FOR(J=0;J<=IEQ-1;J=J+1)#               Loop over group                  DI30 685
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 55 DI30 686
NR=iqx:(IND+J)#                        Pick up index in table           DI30 687
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 688
ifvo:(acal:)#                          Acal disabled                    DI30 689
FOR(J1=0;J1<=IEQ-1;J1=J1+1) status:(iqx:(IND+J1))=notphased:#           DI30 690
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 55 DI30 691
#                                                                       DI30 692
SUMNEW=0.0#                                                             DI30 693
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 694
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 56 DI30 695
NR=iqx:(IND+J)#                        Pick up index in table           DI30 696
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 697
SUMNEW  = SUMNEW  + rmul:*acal:#       Sum up     acalc * mul           DI30 698
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 56 DI30 699
#                                                                       DI30 700
IF(SUMNEW==0.0)#                       Disable group                    DI30 701
FOR(J=0;J<=IEQ-1;J=J+1) status:(iqx:(IND+J))=sumnewzero:#               DI30 702
#                                                                       DI30 703
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 704
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 57 DI30 705
NR=iqx:(IND+J)#                        Pick up index in table           DI30 706
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 707
IF(status:==groupok:) fnew:=SQRT((SUMOLD/SUMNEW)*acal:)# All ok         DI30 708
IF(status:==groupok:) gracc:=0.0#                                       DI30 709
IF(status:!=groupok:) fnew:=fold:#                                      DI30 710
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 57 DI30 711
#                                                                       DI30 712
# CALC R-VALUES FOR TEST                                                DI30 713
#                                                                       DI30 714
IF(IFSCR==yes:)#                       F(rel) single crystal present    DI30 715
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 58 DI30 716
SF(1)=0.0; SDF(1)=0.0; SDF(2)=0.0#                                      DI30 717
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI30 718
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 59 DI30 719
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 720
SF(1) =SF(1) +ABS(fscr:)#              Sum f(sc) all                    DI30 721
SDF(1)=SDF(1)+ABS(fscr:-fold:)#        Sum |f(sc) - f(old)|             DI30 722
SDF(2)=SDF(2)+ABS(fscr:-fnew:)#        Sum |f(sc) - f(new)|             DI30 723
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 59 DI30 724
SF(2)=SF(1); SF(4)=SF(3)#                                               DI30 725
BUFOT(1)=SDF(1)/SF(1)#                 R-value with f(old) all          DI30 726
BUFOT(2)=SDF(2)/SF(2)#                 R-value with f(new) all          DI30 727
FMT=521282. ;ncodefld:(BUFOT,1,CHROT,FMT,1)#                            DI30 728
FMT=641282. ;ncodefld:(BUFOT,2,CHROT,FMT,1)#                            DI30 729
CHROT(1^41)='SUM |F(sc)-F(calc)| / SUM F(sc) : OLD/NEW'#                DI30 730
CHROT(67^78)='ALL         '#                                            DI30 731
writeline:(0,0,0,1,3)#                                                  DI30 732
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 58 DI30 733
#                                                                       DI30 734
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 51 DI30 735
#                                                                       DI30 736
# APPLY EXP SHIFT                                                       DI30 737
# ---------------                                                       DI30 738
#                                                                       DI30 739
IF(BOOSTR!=no:)#                       Exp shift                        DI30 740
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 60 DI30 741
SUMNEW=0.0#                            Initialize accumulator           DI30 742
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over group                   DI30 743
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 61 DI30 744
NR=iqx:(IND+J)#                        Pick up index in table           DI30 745
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 746
IF(status:!=groupok:) NEXT#                                             DI30 747
IF(BOOSTR==1) A=EXP((fnew:/feq:-1.0)*BOOFAC)#                           DI30 748
IF(BOOSTR==2) A=EXP((fnew:/fep:-1.0)*BOOFAC)#                           DI30 749
IF(BOOSTR==3) A=EXP((fnew:/fold:-1.0)*BOOFAC)#                          DI30 750
SUMNEW=SUMNEW+rmul:*A#                 Sum up     acalc                 DI30 751
temp:=A#                               Store it                         DI30 752
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 61 DI30 753
#                                                                       DI30 754
FOR(J=0;J<=IEQ-1;J=J+1)#                                                DI30 755
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 62 DI30 756
NR=iqx:(IND+J)#                        Pick up index in table           DI30 757
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 758
IF(status:!=groupok:) NEXT#                                             DI30 759
IF(SUMNEW==0.0) status:(iqx:(IND+J))=sumnewboost:#                      DI30 760
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 62 DI30 761
#                                                                       DI30 762
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over group                   DI30 763
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 63 DI30 764
NR=iqx:(IND+J)#                        Pick up index in table           DI30 765
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 766
IF(status:==groupok:) fnew: = SQRT((SUMOLD/SUMNEW)*temp:)# All phased   DI30 767
IF(status:!=groupok:) fnew: = fold:#   Use the old frel                 DI30 768
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 63 DI30 769
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 60 DI30 770
#                                                                       DI30 771
# CALC NEW E                                                            DI30 772
# ----------                                                            DI30 773
#                                                                       DI30 774
IF(IE==yes:)#                          Calc new e                       DI30 775
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 64 DI30 776
FOR(J=0;J<=IEQ-1;J=J+1)#               Check on sum values              DI30 777
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 65 DI30 778
NR=iqx:(IND+J)#                        Pick up index in table           DI30 779
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 780
IF(status:!=groupok:\scl:==0.) enew: = eold:#                           DI30 782
ELSE enew: = SQRT(fnew:**2/(scl: * eps:))#
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 65 DI30 783
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 64 DI30 784
#                                                                       DI30 785
# CALC MAX POSIIBLE E'S IN GROUP                                        DI30 786
# ------------------------------                                        DI30 787
#                                                                       DI30 788
IF(IE==yes:)#                          Only if e is there               DI30 789
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 66 DI30 790
A=0.0#                                                                  DI30 791
FOR(J=0;J<=IEQ-1;J=J+1)#               Check on sum values              DI30 792
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 67 DI30 793
NR=iqx:(IND+J)#                        Pick up index in table           DI30 794
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 795
A=A+eold:**2#                          Sum up intensities               DI30 796
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 67 DI30 797
FOR(J=0;J<=IEQ-1;J=J+1)#               Check on sum values              DI30 798
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 68 DI30 799
NR=iqx:(IND+J)#                        Pick up index in table           DI30 800
IF(status:==stollimit:) NEXT#          Outside stol limit               DI30 801
emx:=SQRT(A)#                          Max possib. sum                  DI30 802
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 68 DI30 803
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 66 DI30 804
#                                                                       DI30 805
IF(status:!=groupok:) NGROUPN=NGROUPN+1# One more untreated group       DI30 806
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 26 DI30 807
#                                                                       DI30 808
# UPDATE COUNTER / SKIP OVER ALREADY PROCESSED DATA / END LOOP          DI30 809
# ------------------------------------------------------------          DI30 810
#                                                                       DI30 811
50 CONTINUE#                           Branch in from stol limit        DI30 812
IF(ovlg:(iqx:(IND))>0.0) IND=IND+IEQ#  Overlap, index table + ieq       DI30 813
ELSE IND=IND+1#                        No overlap, index list +1        DI30 814
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 24 DI30 815
#                                                                       DI30 816
# LOOP OVER SORTED REFLECTIONS FOR STATISTICS, R-VALUES ...             DI30 817
# ---------------------------------------------------------             DI30 818
#                                                                       DI30 819
DO I=1,9;PERCOV(I)=0.0#                Initialize accumulator           DI30 820
DO I=1,9;PERCNO(I)=0.0#                Initialize accumulator           DI30 821
DO I=1,9;PERCAL(I)=0.0#                Initialize accumulator           DI30 822
DO I=1,9;POPUOV(I)=0.0#                Initialize accumulator           DI30 823
DO I=1,9;POPUNO(I)=0.0#                Initialize accumulator           DI30 824
DO I=1,9;POPUAL(I)=0.0#                Initialize accumulator           DI30 825
DO I=1,5;ESTAOV(I)=0.0#                Initialize accumulator           DI30 826
DO I=1,5;ESTANO(I)=0.0#                Initialize accumulator           DI30 827
DO I=1,5;ESTAAL(I)=0.0#                Initialize accumulator           DI30 828
#                                                                       DI30 829
DO I=1,4;SDF(I)=0.0#                                                    DI30 830
DO I=1,4;SF(I)=0.0#                                                     DI30 831
DO I=1,4;SDE(I)=0.0#                                                    DI30 832
DO I=1,4;SE(I)=0.0#                                                     DI30 833
DO I=1,4;SQED(I)=0.0#                                                   DI30 834
DO I=1,4;SQE(I)=0.0#                                                    DI30 835
#                                                                       DI30 836
SUMVEC=0.0#                                                             DI30 837
#                                                                       DI30 838
IND=M3+1#                              Start   of index list            DI30 839
REPEAT#                                Loop over refl.                  DI30 840
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 69 DI30 841
IF(IND>M4) BREAK#                      End of index list                DI30 842
NR=iqx:(IND)#                          Pick up index in table           DI30 843
IF(status:==stollimit:) GOTO 100#      Outside stol limit               DI30 844
#                                                                       DI30 845
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 846
# DIFFERENT SIN(THETA)/LAMBDA -> NO GROUP                               DI30 847
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 848
IF(ovlg:(iqx:(IND))==0.0)#                                              DI30 849
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 70 DI30 850
NR=iqx:(IND)#                          Pick up index in table           DI30 851
#                                                                       DI30 852
# E-STATISTICS, DISTRIBUTION                                            DI30 853
# --------------------------                                            DI30 854
#                                                                       DI30 855
IF(IE==yes:)#                                                           DI30 856
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 71 DI30 857
E1=eold:#                              No overlap                       DI30 858
ifnv:(E1)#                             Only not void values             DI30 859
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 72 DI30 860
MUL=rmul:#                             Multiplicity                     DI30 861
A=ABS(E1*E1-1.)#                       Precalc ((e1)**2-1)              DI30 862
ESTANO(1)=ESTANO(1)+MUL*E1#            Sum e1                           DI30 863
ESTANO(2)=ESTANO(2)+MUL*E1*E1#         Sum (e1)**2                      DI30 864
ESTANO(3)=ESTANO(3)+MUL*A#             Sum (e1)**2-1                    DI30 865
ESTANO(4)=ESTANO(4)+MUL*A*A#           Sum ((e1)**2-1)**2               DI30 866
ESTANO(5)=ESTANO(5)+MUL*A*A*A#         Sum ((e1)**2-1)**3               DI30 867
DO K=1,9#                              Loop over distibution ranges     DI30 868
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 73 DI30 869
IF(E1>=EDIST(K))#                      If e1 value above limit          DI30 870
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 74 DI30 871
PERCNO(K)=PERCNO(K)+MUL#               Sum percentages                  DI30 872
POPUNO(K)=POPUNO(K)+1.#                Sum population                   DI30 873
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 74 DI30 874
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 73 DI30 875
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 72 DI30 876
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 71 DI30 877
#                                                                       DI30 878
# R-VALUES                                                              DI30 879
# --------                                                              DI30 880
#                                                                       DI30 881
IF(IFSCR==yes:)#                       F(rel) single crystal present    DI30 882
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 75 DI30 883
SF(1) =SF(1) +ABS(fscr:)#              Sum f(sc) all                    DI30 884
SDF(1)=SDF(1)+ABS(fscr:-fold:)#        Sum |f(sc) - f(old)|             DI30 885
SDF(2)=SDF(2)+ABS(fscr:-fnew:)#        Sum |f(sc) - f(new)|             DI30 886
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 75 DI30 887
#                                                                       DI30 888
IF(IE==yes: & IESCR==yes:)#            /e/ and s.cryst /e/ on bdf       DI30 889
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 76 DI30 890
SE(1) =SE(1) +ABS(escr:)#              Sum e(sc) all                    DI30 891
SDE(1)=SDE(1)+ABS(escr:-eold:)#        Sum |e(sc) - e(old)|             DI30 892
SDE(2)=SDE(2)+ABS(escr:-enew:)#        Sum |e(sc) - e(new)|             DI30 893
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 76 DI30 894
#                                                                       DI30 895
IF(DIVVEC==yes: & E1<EMIN)#             Only non-overl and /e/<emin      DI30 896
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 77 DI30 897
SUMVEC=SUMVEC+acal:#                   Di30                             DI30 898
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 77 DI30 899
#                                                                       DI30 900
# F(I+1)-F(I)                                                           DI30 901
# -----------                                                           DI30 902
#                                                                       DI30 903
IF(IE==yes:)#                                                           DI30 904
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 78 DI30 905
IF(IND+1<=M4)#                         Keep i+1 in range                DI30 906
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 79 DI30 907
NR1=iqx:(IND+1)#                       Pick up index in table           DI30 908
A=SQRT(eps:(NR)); B=SQRT(eps:(NR1))#                                    DI30 909
IF(ovlg:(NR1)==0.0)#                   +1 refl is not overlap           DI30 910
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 80 DI30 911
SQED(1)=SQED(1)+(eold:(NR)*A-eold:(NR1)*B)**2#                          DI30 912
SQE(1)=SQE(1)+1.0#                                                      DI30 913
SQED(3)=SQED(3)+(enew:(NR)*A-enew:(NR1)*B)**2#                          DI30 914
SQE(3)=SQE(3)+1.0#                                                      DI30 915
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 80 DI30 916
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 79 DI30 917
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 78 DI30 918
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 70 DI30 919
#                                                                       DI30 920
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 921
# EQUAL     SIN(THETA)/LAMBDA ->    GROUP OF OVERLAPPING PEAKS          DI30 922
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DI30 923
IF(ovlg:(iqx:(IND))>0.0)#              Overlap                          DI30 924
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 81 DI30 925
FOR(IEQ=2;(IND+IEQ)<=M4;IEQ=IEQ+1)$#   Count overlapping reflection     DI30 926
IF(ovlg:(iqx:(IND+IEQ-1)) != $#        Up to m2 in index table          DI30 927
ovlg:(iqx:(IND+IEQ))) BREAK#           Break if new group               DI30 928
#                                                                       DI30 929
# E-STATISTICS, DISTRIBUTION                                            DI30 930
# --------------------------                                            DI30 931
#                                                                       DI30 932
IF(IE==yes:)#                                                           DI30 933
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 82 DI30 934
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over equal sintl             DI30 935
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 83 DI30 936
NR=iqx:(IND+J)#                        Pick up index in table           DI30 937
#                                                                       DI30 938
E1=eold:#                              Overlap                          DI30 939
ifnv:(E1)#                             Only not void values             DI30 940
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 84 DI30 941
MUL=rmul:#                             Multiplicity                     DI30 942
A=ABS(E1*E1-1.)#                       Precalc ((e1)**2-1)              DI30 943
ESTAOV(1)=ESTAOV(1)+MUL*E1#            Sum e1                           DI30 944
ESTAOV(2)=ESTAOV(2)+MUL*E1*E1#         Sum (e1)**2                      DI30 945
ESTAOV(3)=ESTAOV(3)+MUL*A#             Sum (e1)**2-1                    DI30 946
ESTAOV(4)=ESTAOV(4)+MUL*A*A#           Sum ((e1)**2-1)**2               DI30 947
ESTAOV(5)=ESTAOV(5)+MUL*A*A*A#         Sum ((e1)**2-1)**3               DI30 948
DO K=1,9#                              Loop over distibution ranges     DI30 949
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 85 DI30 950
IF(E1>=EDIST(K))#                      If e1 value above limit          DI30 951
$(#                                    6>>>>>>>>>>>>>>>>>>>>>>>>>>>> 86 DI30 952
PERCOV(K)=PERCOV(K)+MUL#               Sum percentages                  DI30 953
POPUOV(K)=POPUOV(K)+1.#                Sum population                   DI30 954
$)#                                    6<<<<<<<<<<<<<<<<<<<<<<<<<<<< 86 DI30 955
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 85 DI30 956
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 84 DI30 957
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 83 DI30 958
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 82 DI30 959
#                                                                       DI30 960
# R-VALUES                                                              DI30 961
# --------                                                              DI30 962
#                                                                       DI30 963
IF(IFSCR==yes:)#                       F(rel) single crystal present    DI30 964
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 87 DI30 965
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over equal sintl             DI30 966
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 88 DI30 967
NR=iqx:(IND+J)#                        Pick up index in table           DI30 968
# ALL                                                                   DI30 969
SF(1) =SF(1) +ABS(fscr:)#              Sum f(sc) all                    DI30 970
SDF(1)=SDF(1)+ABS(fscr:-fold:)#        Sum |f(sc) - f(old)|             DI30 971
SDF(2)=SDF(2)+ABS(fscr:-fnew:)#        Sum |f(sc) - f(new)|             DI30 972
# ONLY OVERLAP                                                          DI30 973
SF(3) =SF(3) +ABS(fscr:)#              Sum f(sc) all                    DI30 974
SDF(3)=SDF(3)+ABS(fscr:-fold:)#        Sum |f(sc) - f(old)|             DI30 975
SDF(4)=SDF(4)+ABS(fscr:-fnew:)#        Sum |f(sc) - f(new)|             DI30 976
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 88 DI30 977
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 87 DI30 978
#                                                                       DI30 979
IF(IE==yes: & IESCR==yes:)#            /e/ and s.cryst /e/ on bdf       DI30 980
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 89 DI30 981
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over equal sintl             DI30 982
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 90 DI30 983
NR=iqx:(IND+J)#                        Pick up index in table           DI30 984
# ALL                                                                   DI30 985
SE(1) =SE(1) +ABS(escr:)#              Sum e(sc) all                    DI30 986
SDE(1)=SDE(1)+ABS(escr:-eold:)#        Sum |e(sc) - e(old)|             DI30 987
SDE(2)=SDE(2)+ABS(escr:-enew:)#        Sum |e(sc) - e(new)|             DI30 988
# ONLY OVERLAP                                                          DI30 989
SE(3) =SE(3) +ABS(escr:)#              Sum e(sc) all                    DI30 990
SDE(3)=SDE(3)+ABS(escr:-eold:)#        Sum |e(sc) - e(old)|             DI30 991
SDE(4)=SDE(4)+ABS(escr:-enew:)#        Sum |e(sc) - e(new)|             DI30 992
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 90 DI30 993
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 89 DI30 994
#                                                                       DI30 995
#                                                                       DI30 996
# F(I+1)-F(I)                                                           DI30 997
# -----------                                                           DI30 998
#                                                                       DI30 999
IF(IE==yes:)#                                                           DI301000
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 91 DI301001
FOR(J=0;J<=IEQ-1;J=J+1)#               Sum over equal sintl             DI301002
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 92 DI301003
NR=iqx:(IND+J)#                        Pick up index in table           DI301004
IF(IND+J+1>M4) BREAK#                  Keep i+1 in range                DI301005
NR1=iqx:(IND+J+1)#                     Pick up index in table           DI301006
A=SQRT(eps:(NR)); B=SQRT(eps:(NR1))#                                    DI301007
IF(ovlg:(NR)==ovlg:(NR1))#             +1 refl is in same group         DI301008
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 93 DI301009
SQED(2)=SQED(2)+(eold:(NR)*A-eold:(NR1)*B)**2#                          DI301010
#WRITE(6,*)'SQED(2)=',SQED(2),' SQE(2)=',SQE(2)                         DI301011
SQE(2)=SQE(2)+1.0#                                                      DI301012
SQED(4)=SQED(4)+(enew:(NR)*A-enew:(NR1)*B)**2#                          DI301013
SQE(4)=SQE(4)+1.0#                                                      DI301014
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 93 DI301015
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 92 DI301016
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 91 DI301017
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 81 DI301018
#                                                                       DI301019
# UPDATE COUNTER / SKIP OVER ALREADY PROCESSED DATA / END LOOP          DI301020
# ------------------------------------------------------------          DI301021
#                                                                       DI301022
100 CONTINUE#                          Branch in from stol limit        DI301023
IF(ovlg:(iqx:(IND))>0.0) IND=IND+IEQ#  Overlap, index table + ieq       DI301024
ELSE IND=IND+1#                        No overlap, index list +1        DI301025
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 69 DI301026
#                                                                       DI301027
# SELF CONSISTENCY                                                      DI301028
# ----------------                                                      DI301029
#                                                                       DI301030
IF(DIVVEC==yes:)#                                                       DI301031
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 94 DI301032
SDEC(1)=0.0; SEC(1)=0.0; SDEC(2)=0.0; SEC(2)=0.0#                       DI301033
FOR(NR=M2; NR<M3; NR=NR+nrefit:)#      Loop over all reflections        DI301034
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 95 DI301035
ifvo:(acal:) NEXT#                     Acal disabled                    DI301036
IF(SUMVB==0.0) NEXT#                   Prevent dividsion by zero        DI301037
SDEC(1)=SDEC(1)+$#                                                      DI301038
ABS((eps:*eold:**2-1.0) - acal:*(SUMVT/SUMVB))#                         DI301039
SEC(1) =SEC(1)+eps:*eold:**2-1.0#                                       DI301040
IF(etca:<0)NEXT#                       Only positive ones               DI301041
SDEC(2)=SDEC(2)+$#                                                      DI301042
ABS((eps:*eold:**2-1.0) - acal:*(SUMVT/SUMVB))#                         DI301043
SEC(2) =SEC(2)+eps:*eold:**2-1.0#                                       DI301044
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 95 DI301045
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 94 DI301046
#                                                                       DI301047
# RESOLUTION                                                            DI301048
# ----------                                                            DI301049
#                                                                       DI301050
DO I=1,13; NMEA(I)=0#                                                   DI301051
DO I=1,13; NPOW(I)=0#                                                   DI301052
DO I=1,13; NOV(I)=0#                                                    DI301053
DO I=1,13; NNOV(I)=0#                                                   DI301054
DO I=2,12; IF( (LAMBDA/2.0*ARESOL(I)) < 1.0 ) NRESM=I# Fix limit        DI301055
DO I=2,NRESM; TRESOL(I)=2.0*(360.0/TWOPI)*ASIN(LAMBDA/(2.0*ARESOL(I)))# DI301056
NRESM=NRESM-1#                                                          DI301057
#                                                                       DI301058
DO I=1,NRESM#                                                           DI301059
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 96 DI301060
FOR(NR=M2; NR<M3; NR=NR+nrefit:)#                                       DI301061
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 97 DI301062
IF(ARESOL(I)>=1.0/(2.0*stl:) & 1.0/(2.0*stl:)>=ARESOL(I+1))#            DI301063
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 98 DI301064
NMEA(I)=NMEA(I)+rmul:*2#               All symmetrically equivalent     DI301065
NPOW(I)=NPOW(I)+1#                     Only powder refl                 DI301066
IF(ovlg: > 0.0) NOV(I) = NOV(I)+1#     Only overlap                     DI301067
IF(ovlg: ==0.0)NNOV(I) = NNOV(I)+1#    Only no overlap                  DI301068
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 98 DI301069
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 97 DI301070
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 96 DI301071
#                                                                       DI301072
LINRM=7#                               Force lines                      DI301073
CHROT(1^22)='RESOLUTION(A)         '#                                   DI301074
ncodefld:(ARESOL,2,CHROT,FMAR,NRESM+1); writeline:(1,0,0,1,3)#          DI301075
CHROT(1^16)='N( THEORET.    )'#                                         DI301076
DO I=1,NRESM; BUFOT(I)=FLOAT(NMEA(I))#                                  DI301077
ncodefld:(BUFOT,1,CHROT,FMNO,NRESM); writeline:(0,0,0,1,3)#             DI301078
CHROT(1^16)='N( POWDER      )'#                                         DI301079
DO I=1,NRESM; BUFOT(I)=FLOAT(NPOW(I))#                                  DI301080
ncodefld:(BUFOT,1,CHROT,FMNO,NRESM); writeline:(0,0,0,1,3)#             DI301081
CHROT(1^16)='N( OVERLAP     )'#                                         DI301082
DO I=1,NRESM; BUFOT(I)=FLOAT(NOV(I))#                                   DI301083
ncodefld:(BUFOT,1,CHROT,FMNO,NRESM); writeline:(0,0,0,1,3)#             DI301084
CHROT(1^16)='N( NO OVERLAP  )'#                                         DI301085
DO I=1,NRESM; BUFOT(I)=FLOAT(NNOV(I))#                                  DI301086
ncodefld:(BUFOT,1,CHROT,FMNO,NRESM); writeline:(0,0,0,1,3)#             DI301087
CHROT(1^18)='RESOLUTION(2THETA)'#                                       DI301088
ncodefld:(TRESOL,2,CHROT,FMTR,NRESM); writeline:(0,0,0,1,3)#            DI301089
#                                                                       DI301090
# LIST OVERLAP                                                          DI301091
# ------------                                                          DI301092
#                                                                       DI301093
NHKLO   = NHKL-NHKLNO#                 Number of overlapping refl.      DI301094
NHKLOBS = NGROUP+NHKLNO#               Number of "observed" refl.       DI301095
NGROUPC = NGROUP-NGROUPN#              Number of modified groups        DI301096
FMT=320713. ;ncodefld:(FLOAT(NHKL)   ,1,CHROT,FMT,1)#                   DI301097
FMT=460713. ;ncodefld:(FLOAT(NHKLNO) ,1,CHROT,FMT,1)#                   DI301098
FMT=630713. ;ncodefld:(FLOAT(NHKLO)  ,1,CHROT,FMT,1)#                   DI301099
FMT=760713. ;ncodefld:(FLOAT(NHKLOBS),1,CHROT,FMT,1)#                   DI301100
writeline:(1,DI30C,NDI30C,2,3)#                                         DI301101
FMT=320713. ;ncodefld:(FLOAT(NGROUP) ,1,CHROT,FMT,1)#                   DI301102
FMT=460713. ;ncodefld:(FLOAT(NGROUPC),1,CHROT,FMT,1)#                   DI301103
FMT=630713. ;ncodefld:(FLOAT(NGROUPN),1,CHROT,FMT,1)#                   DI301104
writeline:(0,DI30D,NDI30D,2,3)#                                         DI301105
#                                                                       DI301106
# LIST R-VALUES                                                         DI301107
# -------------                                                         DI301108
#                                                                       DI301109
IF(IFSCR==yes:)#                       /f(sc)/ on bdf                   DI301110
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 99 DI301111
SF(2)=SF(1); SF(4)=SF(3)#                                               DI301112
BUFOT(1)=SDF(1)/SF(1)#                 R-value with f(old) all          DI301113
BUFOT(2)=SDF(2)/SF(2)#                 R-value with f(new) all          DI301114
BUFOT(3)=SDF(3)/SF(3)#                 R-value with f(old) overlap      DI301115
BUFOT(4)=SDF(4)/SF(4)#                 R-value with f(new) overlap      DI301116
FMT=521282. ;ncodefld:(BUFOT,1,CHROT,FMT,1)#                            DI301117
FMT=641282. ;ncodefld:(BUFOT,2,CHROT,FMT,1)#                            DI301118
CHROT(1^41)='SUM |F(sc)-F(calc)| / SUM F(sc) : OLD/NEW'#                DI301119
CHROT(67^78)='ALL         '#                                            DI301120
writeline:(1,0,0,1,3)#                                                  DI301121
FMT=521282. ;ncodefld:(BUFOT,3,CHROT,FMT,1)#                            DI301122
FMT=641282. ;ncodefld:(BUFOT,4,CHROT,FMT,1)#                            DI301123
CHROT(1^41)='SUM |F(sc)-F(calc)| / SUM F(sc) : OLD/NEW'#                DI301124
CHROT(67^78)='OVERLAP ONLY'#                                            DI301125
writeline:(0,0,0,1,3)#                                                  DI301126
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 99 DI301127
#                                                                       DI301128
IF(IE==yes: & IESCR==yes:)#            /e(sc)/ and /e/ on bdf           DI301129
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 100DI301130
SE(2)=SE(1); SE(4)=SE(3)#                                               DI301131
BUFOT(1)=SDE(1)/SE(1)#                 R-value with f(old) all          DI301132
BUFOT(2)=SDE(2)/SE(2)#                 R-value with f(new) all          DI301133
BUFOT(3)=SDE(3)/SE(3)#                 R-value with f(old) overlap      DI301134
BUFOT(4)=SDE(4)/SE(4)#                 R-value with f(new) overlap      DI301135
FMT=521282. ;ncodefld:(BUFOT,1,CHROT,FMT,1)#                            DI301136
FMT=641282. ;ncodefld:(BUFOT,2,CHROT,FMT,1)#                            DI301137
CHROT(1^41)='SUM |E(sc)-E(calc)| / SUM E(sc) : OLD/NEW'#                DI301138
CHROT(67^78)='ALL         '#                                            DI301139
writeline:(1,0,0,1,3)#                                                  DI301140
FMT=521282. ;ncodefld:(BUFOT,3,CHROT,FMT,1)#                            DI301141
FMT=641282. ;ncodefld:(BUFOT,4,CHROT,FMT,1)#                            DI301142
CHROT(1^41)='SUM |E(sc)-E(calc)| / SUM E(sc) : OLD/NEW'#                DI301143
CHROT(67^78)='OVERLAP ONLY'#                                            DI301144
writeline:(0,0,0,1,3)#                                                  DI301145
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 100DI301146
#                                                                       DI301147
# LIST SELF CONSISTENCY                                                 DI301148
# ---------------------                                                 DI301149
#                                                                       DI301150
IF(DIVVEC==yes:)#                                                       DI301151
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 101DI301152
IF(SEC(1)!=0.0)#                                                        DI301153
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 102DI301154
BUFOT(1)=SDEC(1)/SEC(1)#               R-value with all                 DI301155
FMT=691282. ;ncodefld:(BUFOT,1,CHROT,FMT,1)#                            DI301156
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 102DI301157
ELSE CHROT(66^69)='****'#                                               DI301158
IF(SEC(2)!=0.0)#                                                        DI301159
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 103DI301160
BUFOT(2)=SDEC(2)/SEC(2)#               R-value with only pos e**2       DI301161
FMT=821282. ;ncodefld:(BUFOT,2,CHROT,FMT,1)#                            DI301162
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 103DI301163
ELSE CHROT(79^82)='****'#                                               DI301164
CHROT(1^57)=$#                                                          DI301165
'SUM |(..)(..)k - e*E**2-1.0| / SUM e*E**2-1.0 ALL/ONLY POS'#           DI301166
writeline:(1,0,0,1,3)#                                                  DI301167
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 101DI301168
#                                                                       DI301169
# LIST F(I)-F(I+1)                                                      DI301170
# ----------------                                                      DI301171
#                                                                       DI301172
IF(IE==yes:)#                                                           DI301173
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 104DI301174
BUFOT(1)=SQED(1)#                      Sum of (e(i+1)-e(i))**2          DI301175
BUFOT(2)=SQE(1)#                       Number of differrences nov       DI301176
IF(BUFOT(2)!=0.0)BUFOT(3)=BUFOT(1)/BUFOT(2)# Ave nov old                DI301177
BUFOT(4)=SQED(3)#                      Sum of (e(i+1)-e(i))**2          DI301178
BUFOT(5)=SQE(3)#                       Number of differrences nov       DI301179
IF(BUFOT(5)!=0.0)BUFOT(6)=BUFOT(4)/BUFOT(5)# Ave nov new                DI301180
BUFOT(7)=SQED(2)#                      Sum of (e(i+1)-e(i))**2          DI301181
BUFOT(8)=SQE(2)#                       Number of differrences  ov       DI301182
IF(BUFOT(8)!=0.0)BUFOT(9)=BUFOT(7)/BUFOT(8)# Ave ov old                 DI301183
BUFOT(10)=SQED(4)#                     Sum of (e(i+1)-e(i))**2          DI301184
BUFOT(11)=SQE(4)#                      Number of differrences  ov       DI301185
IF(BUFOT(11)!=0.0)BUFOT(12)=BUFOT(10)/BUFOT(11)# Ave ov new             DI301186
#                                                                       DI301187
IF(BUFOT(3)!=0.0) BUFOT(13)=( (BUFOT(3)-BUFOT(9))/BUFOT(3) )**2# Old    DI301188
IF(BUFOT(6)!=0.0) BUFOT(14)=( (BUFOT(6)-BUFOT(12))/BUFOT(6) )**2# New   DI301189
#                                                                       DI301190
CHROT(1^65)=$#                                                          DI301191
'SUM(no overlap) |E(i)-E(i+1)|       Number                AVE NOV'#    DI301192
writeline:(1,0,0,1,3)#                                                  DI301193
FMT=291282. ;ncodefld:(BUFOT,1,CHROT,FMT,1)#                            DI301194
FMT=410613. ;ncodefld:(BUFOT,2,CHROT,FMT,1)#                            DI301195
FMT=611282. ;IF(BUFOT(2)!=0.0) ncodefld:(BUFOT,3,CHROT,FMT,1)#          DI301196
IF(BUFOT(2)==0.0) CHROT(58^61)='****'#                                  DI301197
CHROT(1^3)='OLD'#                                                       DI301198
writeline:(0,0,0,1,3)#                                                  DI301199
FMT=291282. ;ncodefld:(BUFOT,4,CHROT,FMT,1)#                            DI301200
FMT=410613. ;ncodefld:(BUFOT,5,CHROT,FMT,1)#                            DI301201
FMT=611282. ;IF(BUFOT(5)!=0.0) ncodefld:(BUFOT,6,CHROT,FMT,1)#          DI301202
IF(BUFOT(2)==0.0) CHROT(58^61)='****'#                                  DI301203
CHROT(1^3)='NEW'#                                                       DI301204
writeline:(0,0,0,1,3)#                                                  DI301205
#                                                                       DI301206
CHROT(1^65)=$#                                                          DI301207
'SUM(   overlap) |E(i)-E(i+1)|      Number                 AVE OV '#    DI301208
writeline:(0,0,0,1,3)#                                                  DI301209
FMT=291282. ;ncodefld:(BUFOT,7,CHROT,FMT,1)#                            DI301210
FMT=410613. ;ncodefld:(BUFOT,8,CHROT,FMT,1)#                            DI301211
FMT=611282. ;IF(BUFOT(8)!=0.0) ncodefld:(BUFOT,9,CHROT,FMT,1)#          DI301212
IF(BUFOT(8)==0.0) CHROT(58^61)='****'#                                  DI301213
CHROT(1^3)='OLD'#                                                       DI301214
writeline:(0,0,0,1,3)#                                                  DI301215
FMT=291282. ;ncodefld:(BUFOT,10,CHROT,FMT,1)#                           DI301216
FMT=410613. ;ncodefld:(BUFOT,11,CHROT,FMT,1)#                           DI301217
FMT=611282. ;IF(BUFOT(11)!=0.0) ncodefld:(BUFOT,12,CHROT,FMT,1)#        DI301218
IF(BUFOT(11)==0.0) CHROT(58^61)='****'#                                 DI301219
CHROT(1^3)='NEW'#                                                       DI301220
writeline:(0,0,0,1,3)#                                                  DI301221
#                                                                       DI301222
CHROT(1^38)='( (AVE OV - AVE NOV)/(AVE NOV) )**2 = '#                   DI301223
FMT=521282. ; IF(BUFOT(3)!=0.0) ncodefld:(BUFOT,13,CHROT,FMT,1)#        DI301224
IF(BUFOT(3)==0.0) CHROT(39^42)='****'#                                  DI301225
CHROT(54^56)='OLD'#                                                     DI301226
writeline:(0,0,0,1,3)#                                                  DI301227
FMT=521282. ; IF(BUFOT(6)!=0.0) ncodefld:(BUFOT,14,CHROT,FMT,1)#        DI301228
IF(BUFOT(6)==0.0) CHROT(39^42)='****'#                                  DI301229
CHROT(54^56)='NEW'#                                                     DI301230
writeline:(0,0,0,1,3)#                                                  DI301231
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 104DI301232
#                                                                       DI301233
# LIST E-STATISTICS, DISTRIBUTION ( LIKE IN GENEV )                     DI301234
# -------------------------------------------------                     DI301235
#                                                                       DI301236
IF(IE==yes:)#                                                           DI301237
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 105DI301238
DO I=1,5;ESTAAL(I)=ESTAOV(I)+ESTANO(I)# Calc statistics for all e's     DI301239
DO I=1,9;PERCAL(I)=PERCOV(I)+PERCNO(I)# Calc distribution for all e's   DI301240
DO I=1,9;POPUAL(I)=POPUOV(I)+POPUNO(I)# Calc population for all e's     DI301241
#                                                                       DI301242
IF(PERCOV(1)!=0)#                      Must be different from zero      DI301243
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 106DI301244
A=PERCOV(1)#                           Total number of overlap e's      DI301245
DO I=1,5;ESTAOV(I)=ESTAOV(I)/A#        Calc mean                        DI301246
DO I=1,9;PERCOV(I)=100.0*PERCOV(I)/A#  Calc % values                    DI301247
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 106DI301248
IF(PERCNO(1)!=0)#                      Must be different from zero      DI301249
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 107DI301250
A=PERCNO(1)#                           Total number of non overlap e'   DI301251
DO I=1,5;ESTANO(I)=ESTANO(I)/A#        Calc mean                        DI301252
DO I=1,9;PERCNO(I)=100.0*PERCNO(I)/A#  Calc % values                    DI301253
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 107DI301254
A=PERCAL(1)#                           Total number of all e's          DI301255
DO I=1,5;ESTAAL(I)=ESTAAL(I)/A#        Calc mean                        DI301256
DO I=1,9;PERCAL(I)=100.0*PERCAL(I)/A#  Calc % values                    DI301257
#                                                                       DI301258
movechar:(EV1,1,CHROT,2,12,1)#         Put underline in buffer          DI301259
writeline:(1,EV9,13,2,3)#              Print e-stats heading            DI301260
movechar:(EV9,14,CHROT,17,NEV9-13,0)#  Put subheading in buffer         DI301261
writeline:(0,0,0,1,3)#                 Print stats subheading           DI301262
movechar:(EV7,1,CHROT,1,NEV7,0)#       Put sideline in buffer           DI301263
ncodefld:(ESTAT,1,CHROT,FM2,5)#        Format theoretical stats         DI301264
writeline:(0,0,0,1,3)#                 Print with heading               DI301265
movechar:(EV8,1,CHROT,1,NEV8,0)#       Put sideline in buffer           DI301266
ncodefld:(ESTAT,6,CHROT,FM2,5)#        Format theoretical stats         DI301267
writeline:(0,0,0,1,3)#                 Print noncentric values          DI301268
IF(PERCOV(1)!=0)#                      Must be different from zero      DI301269
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 108DI301270
movechar:(EV3,1,CHROT,1,NEV3,0)#       Put sideline in buffer           DI301271
ncodefld:(ESTAOV,1,CHROT,FM2,5)#       Format experimental values       DI301272
writeline:(0,0,0,1,3)#                 Print e1 overlap statistics      DI301273
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 108DI301274
IF(PERCNO(1)!=0)#                      Must be different from zero      DI301275
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 109DI301276
movechar:(EV4,1,CHROT,1,NEV4,0)#       Put sideline in buffer           DI301277
ncodefld:(ESTANO,1,CHROT,FM2,5)#       Format experimental values       DI301278
writeline:(0,0,0,1,3)#                 Print e1 no overlap statistics   DI301279
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 109DI301280
movechar:(EV5,1,CHROT,1,NEV5,0)#       Put sideline in buffer           DI301281
ncodefld:(ESTAAL,1,CHROT,FM2,5)#       Format experimental values       DI301282
writeline:(0,0,0,1,3)#                 Print e1 all statistics          DI301283
#                                                                       DI301284
movechar:(EV1,1,CHROT,2,14,1)#         Put underline in buffer          DI301285
writeline:(1,EV10,15,2,3)#             Print e-distr. heading           DI301286
movechar:(EV10,16,CHROT,2,NEV10-15,0)# Put subheading in buffer         DI301287
ncodefld:(EDIST,1,CHROT,FM3,9)#        Put % limits in subheading       DI301288
writeline:(0,0,0,1,3)#                 Print stats subheading           DI301289
movechar:(EV7,1,CHROT,1,NEV7,0)#       Put sideline in buffer           DI301290
ncodefld:(EDIST,10,CHROT,FM3,9)#       Format theoretical distr.        DI301291
writeline:(0,0,0,1,3)#                 Print values with heading        DI301292
movechar:(EV8,1,CHROT,1,NEV8,0)#       Put sideline in buffer           DI301293
ncodefld:(EDIST,19,CHROT,FM3,9)#       Format theoretical distr.        DI301294
writeline:(0,0,0,1,3)#                 Print non-centric values         DI301295
IF(PERCOV(1)!=0)#                      Must be different from zero      DI301296
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 110DI301297
movechar:(EV3,1,CHROT,1,NEV3,0)#       Put sideline in buffer           DI301298
ncodefld:(PERCOV,1,CHROT,FM3,9)#       Format experimental values       DI301299
writeline:(0,0,0,1,3)#                 Print e1 overlap percentages     DI301300
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 110DI301301
IF(PERCNO(1)!=0)#                      Must be different from zero      DI301302
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 111DI301303
movechar:(EV4,1,CHROT,1,NEV4,0)#       Put sideline in buffer           DI301304
ncodefld:(PERCNO,1,CHROT,FM3,9)#       Format experimental values       DI301305
writeline:(0,0,0,1,3)#                 Print e1 no overlap percentage   DI301306
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 111DI301307
movechar:(EV5,1,CHROT,1,NEV5,0)#       Put sideline in buffer           DI301308
ncodefld:(PERCAL,1,CHROT,FM3,9)#       Format experimental values       DI301309
writeline:(0,0,0,1,3)#                 Print e1 all percentage          DI301310
writeline:(0,EV17,NEV17,3,3)#          Print population heading         DI301311
movechar:(EV3,1,CHROT,1,NEV3,0)#       Put sideline in buffer           DI301312
ncodefld:(POPUOV,1,CHROT,FM4,9)#       Format experimental values       DI301313
writeline:(0,0,0,1,3)#                 Print e1 overlap populations     DI301314
movechar:(EV4,1,CHROT,1,NEV4,0)#       Put sideline in buffer           DI301315
ncodefld:(POPUNO,1,CHROT,FM4,9)#       Format experimental values       DI301316
writeline:(0,0,0,1,3)#                 Print e1 no overlap population   DI301317
movechar:(EV5,1,CHROT,1,NEV5,0)#       Put sideline in buffer           DI301318
ncodefld:(POPUAL,1,CHROT,FM4,9)#       Format experimental values       DI301319
writeline:(0,0,0,1,3)#                 Print e1 all population          DI301320
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 105DI301321
#                                                                       DI301322
# PSEUDO TRANSLATIONAL SYMMETRY                                         DI301323
# -----------------------------                                         DI301324
#                                                                       DI301325
IF(IE==yes: & IPSTRA==yes:)#                                            DI301326
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 112DI301327
incrqx:(M5,M4+3*192,DI3001)#           Expand qx                        DI301328
DO I=1,72; DO J=1,4; PSEAL(J,I)=0.0#                                    DI301329
DO I=1,72; DO J=1,4; PSEOV(J,I)=0.0#                                    DI301330
DO I=1,72; DO J=1,4; PSENO(J,I)=0.0#                                    DI301331
#                                                                       DI301332
FOR(NR=M2; NR<M3; NR=NR+nrefit:)#      Loop over reflections            DI301333
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 113DI301334
gethkl:(NR+1,H)#                       Unpack h, k, l                   DI301335
#                                                                       DI301336
# GENERATE ALL SYMMETRICALLY EQUIVALENT HKL'S                           DI301337
#                                                                       DI301338
M5=M4#                                 Start of expanded hkl list       DI301339
FOR(IQ=M0;IQ<M2;IQ=IQ+nsymit:)#        Loop over all symops             DI301340
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 114DI301341
QX(M5+1)  =  QX(IQ+1)*H(1)  + QX(IQ+2)*H(2)  + QX(IQ+3)*H(3)#           DI301342
QX(M5+2)  =  QX(IQ+4)*H(1)  + QX(IQ+5)*H(2)  + QX(IQ+6)*H(3)#           DI301343
QX(M5+3)  =  QX(IQ+7)*H(1)  + QX(IQ+8)*H(2)  + QX(IQ+9)*H(3)#           DI301344
FOR(II=M4;II<M5;II=II+3)#              Loop over hkl list               DI301345
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 115DI301346
IF(QX(II+1)==QX(M5+1) & QX(II+2)==QX(M5+2) & QX(II+3)==QX(M5+3))#       DI301347
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 116DI301348
M5=M5-3; BREAK#                        Already present, reject          DI301349
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 116DI301350
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 115DI301351
M5=M5+3#                                                                DI301352
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 114DI301353
#                                                                       DI301354
FOR(III=M4;III<M5;III=III+3)#          Loop over hkl list               DI301355
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 117DI301356
IH=NINT(QX(III+1)); IK=NINT(QX(III+2)); IL=NINT(QX(III+3))#             DI301357
#                                                                       DI301358
DO IT=1,64#                            Loop over pseudo translations    DI301359
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 118DI301360
II=PSTRA(1,IT)*IH+PSTRA(2,IT)*IK+PSTRA(3,IT)*IL#                        DI301361
IN=PSTRA(4,IT)#                                                         DI301362
IF(MOD(II,IN)==0.0)IPS=yes:#                                            DI301363
ELSE               IPS=no:#                                             DI301364
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301365
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301366
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301367
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301368
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 118DI301369
#                                                                       DI301370
IT=65#                                                                  DI301371
IF(MOD(IH,2)==0 & MOD(IK,2)==0) IPS=yes:#                               DI301372
ELSE                            IPS=no:#                                DI301373
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301374
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301375
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301376
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301377
#                                                                       DI301378
IT=66#                                                                  DI301379
IF(MOD(IH,2)==0 & MOD(IL,2)==0) IPS=yes:#                               DI301380
ELSE                            IPS=no:#                                DI301381
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301382
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301383
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301384
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301385
#                                                                       DI301386
IT=67#                                                                  DI301387
IF(MOD(IK,2)==0 & MOD(IL,2)==0) IPS=yes:#                               DI301388
ELSE                            IPS=no:#                                DI301389
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301390
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301391
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301392
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301393
#                                                                       DI301394
IT=68#                                                                  DI301395
IF(MOD(IH,2)==0 & MOD(IK+IL,2)==0) IPS=yes:#                            DI301396
ELSE                               IPS=no:#                             DI301397
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301398
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301399
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301400
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301401
#                                                                       DI301402
IT=69#                                                                  DI301403
IF(MOD(IK,2)==0 & MOD(IH+IL,2)==0) IPS=yes:#                            DI301404
ELSE                               IPS=no:#                             DI301405
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301406
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301407
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301408
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301409
#                                                                       DI301410
IT=70#                                                                  DI301411
IF(MOD(IL,2)==0 & MOD(IH+IK,2)==0) IPS=yes:#                            DI301412
ELSE                               IPS=no:#                             DI301413
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301414
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301415
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301416
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301417
#                                                                       DI301418
IT=71#                                                                  DI301419
IF(MOD(IH+IK,2)==0 & MOD(IH+IL,2)==0) IPS=yes:#                         DI301420
ELSE                                  IPS=no:#                          DI301421
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301422
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301423
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301424
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301425
#                                                                       DI301426
IT=72#                                                                  DI301427
IF(MOD(IH,2)==0 & MOD(IK,2)==0 & MOD(IL,2)==0) IPS=yes:#                DI301428
ELSE                                           IPS=no:#                 DI301429
IF(IPS==yes:) PSEAL(1,IT)=PSEAL(1,IT)+1.0# Count reflections            DI301430
ELSE          PSEAL(3,IT)=PSEAL(3,IT)+1.0# Complement                   DI301431
IF(IPS==yes:) PSEAL(2,IT)=PSEAL(2,IT)+eold:**2# Sum up                  DI301432
ELSE          PSEAL(4,IT)=PSEAL(4,IT)+eold:**2# Complement              DI301433
#                                                                       DI301434
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 117DI301435
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 113DI301436
#                                                                       DI301437
CHROT(1^46)=' AVERAGE OF /E/**2 FOR PSEUDO-TRANSLATION SETS'#           DI301438
writeline:(1,0,0,1,3)#                                                  DI301439
CHROT(1^46)=' ---------------------------------------------'#           DI301440
writeline:(0,0,0,1,3)#                                                  DI301441
CHROT(1^60)=$#                                                          DI301442
'                          num         ave|E|          ratio'#          DI301443
writeline:(0,0,0,1,3)#                                                  DI301444
DO IT=1,64#                                                             DI301445
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 119DI301446
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301447
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301448
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301449
#                                                                       DI301450
WRITE(CHROT,FMT='(I2,A,3(I1,A),I2,A,I7,F15.4,F15.4)')$#                 DI301451
IT,') ',PSTRA(1,IT),'h +',PSTRA(2,IT),'k +',PSTRA(3,IT),'l = ',#        DI301452
PSTRA(4,IT),'n  ',#                                                     DI301453
NINT(PSEAL(1,IT)),H(1),H(3)#                                            DI301454
#                                                                       DI301455
IS=INDEX(CHROT,'0.0000');IF(IS!=0)CHROT(IS^IS+5)=' ---- '#              DI301456
IS=INDEX(CHROT,'0.0000');IF(IS!=0)CHROT(IS^IS+5)=' ---- '#              DI301457
IS=INDEX(CHROT,'0.0000');IF(IS!=0)CHROT(IS^IS+5)=' ---- '#              DI301458
IS=INDEX(CHROT,'0h');IF(IS!=0)CHROT(IS^IS+1)='  '#                      DI301459
IS=INDEX(CHROT,'1h');IF(IS!=0)CHROT(IS^IS+1)=' h'#                      DI301460
IS=INDEX(CHROT,'+0k');IF(IS!=0)CHROT(IS^IS+2)='   '#                    DI301461
IS=INDEX(CHROT,'+1k');IF(IS!=0)CHROT(IS^IS+2)='  k'#                    DI301462
IS=INDEX(CHROT,'+0l');IF(IS!=0)CHROT(IS^IS+2)='   '#                    DI301463
IS=INDEX(CHROT,'+1l');IF(IS!=0)CHROT(IS^IS+2)='  l'#                    DI301464
writeline:(0,0,0,1,3)#                                                  DI301465
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 119DI301466
IT=65#                                                                  DI301467
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301468
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301469
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301470
WRITE(CHROT,FMT='(I2,A,I7,F15.4,F15.4)')$#                              DI301471
IT,')  h=2n  &    k=2n  ',NINT(PSEAL(1,IT)),H(1),H(3)#                  DI301472
writeline:(0,0,0,1,3)#                                                  DI301473
IT=66#                                                                  DI301474
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301475
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301476
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301477
WRITE(CHROT,FMT='(I2,A,I7,F15.4,F15.4)')$#                              DI301478
IT,')  h=2n  &    l=2n  ',NINT(PSEAL(1,IT)),H(1),H(3)#                  DI301479
writeline:(0,0,0,1,3)#                                                  DI301480
IT=67#                                                                  DI301481
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301482
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301483
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301484
WRITE(CHROT,FMT='(I2,A,I7,F15.4,F15.4)')$#                              DI301485
IT,')  k=2n  &    l=2n  ',NINT(PSEAL(1,IT)),H(1),H(3)#                  DI301486
writeline:(0,0,0,1,3)#                                                  DI301487
IT=68#                                                                  DI301488
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301489
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301490
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301491
WRITE(CHROT,FMT='(I2,A,I7,F15.4,F15.4)')$#                              DI301492
IT,')  h=2n  &  k+l=2n  ',NINT(PSEAL(1,IT)),H(1),H(3)#                  DI301493
writeline:(0,0,0,1,3)#                                                  DI301494
IT=69#                                                                  DI301495
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301496
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301497
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301498
WRITE(CHROT,FMT='(I2,A,I7,F15.4,F15.4)')$#                              DI301499
IT,')  k=2n  &  h+l=2n  ',NINT(PSEAL(1,IT)),H(1),H(3)#                  DI301500
writeline:(0,0,0,1,3)#                                                  DI301501
IT=70#                                                                  DI301502
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301503
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301504
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301505
WRITE(CHROT,FMT='(I2,A,I7,F15.4,F15.4)')$#                              DI301506
IT,')  l=2n  &  h+k=2n  ',NINT(PSEAL(1,IT)),H(1),H(3)#                  DI301507
writeline:(0,0,0,1,3)#                                                  DI301508
IT=71#                                                                  DI301509
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301510
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301511
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301512
WRITE(CHROT,FMT='(I2,A,I7,F15.4,F15.4)')$#                              DI301513
IT,')h+k=2n  &  h+l=2n  ',NINT(PSEAL(1,IT)),H(1),H(3)#                  DI301514
writeline:(0,0,0,1,3)#                                                  DI301515
IT=72#                                                                  DI301516
H(1)=0.0; IF(PSEAL(1,IT)!=0.0)H(1)=PSEAL(2,IT)/PSEAL(1,IT)#             DI301517
H(2)=0.0; IF(PSEAL(3,IT)!=0.0)H(2)=PSEAL(3,IT)/PSEAL(4,IT)#             DI301518
H(3)=0.0; IF(H(2)!=0.0)       H(3)=H(1)/H(2)#                           DI301519
WRITE(CHROT,FMT='(I2,A,I7,F15.4,F15.4)')$#                              DI301520
IT,')h=2n & k=2n & l=2n ',NINT(PSEAL(1,IT)),H(1),H(3)#                  DI301521
writeline:(0,0,0,1,3)#                                                  DI301522
#                                                                       DI301523
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 112DI301524
#                                                                       DI301525
LINRM=6#                               Need 2 lines to start            DI301526
movechar:(UNDL,1,CHROT,1,NDI30A,1)#    Put -'s into chrot               DI301527
writeline:(1,DI30A,NDI30A,2,3)#        Output header with underline     DI301528
#                                                                       DI301529
IF(PRINTL<0) PRINTL=M3+NHKL#           Print all, pr option chosen      DI301530
ELSE         PRINTL=M3+PRINTL#                                          DI301531
FOR(IND=M3+1;IND<=PRINTL;IND=IND+1)#   Print out reflections            DI301532
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 120DI301533
NR=iqx:(IND)#                          Pick up index in sintl array     DI301534
#                                                                       DI301535
# FIXED HEADER                                                          DI301536
#                                                                       DI301537
gethkl:(NR+1,H)#                       Unpack h, k, l                   DI301538
FMT=030313. ;    ncodefld:(H(1)             ,1,CHROT,FMT,1)#            DI301539
FMT=060313. ;    ncodefld:(H(2)             ,1,CHROT,FMT,1)#            DI301540
FMT=090313. ;    ncodefld:(H(3)             ,1,CHROT,FMT,1)#            DI301541
FMT=120313. ;    ncodefld:(rmul:            ,1,CHROT,FMT,1)#            DI301542
FMT=150313. ;    ncodefld:(eps:             ,1,CHROT,FMT,1)#            DI301543
FMT=220642. ;    ncodefld:(stl:             ,1,CHROT,FMT,1)#            DI301544
FMT=310842. ;    ncodefld:(twot:          ,1,CHROT,FMT,1)# Di           DI301545
FMT=390742.#                                                            DI301546
IF(hw:!=0.0)     ncodefld:(hw:              ,1,CHROT,FMT,1)#            DI301547
FMT=440413.#                                                            DI301548
IF(ovlg:!=0.0)    ncodefld:(ovlg:           ,1,CHROT,FMT,1)#            DI301549
IF(status:!=nogroup: & $#                                               DI301550
   status:!=groupok:)#                                                  DI301551
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 121DI301552
IF(status:==notphased:)   CHROT(45^46)='NP'#                            DI301553
IF(status:==sumnewzero:)  CHROT(45^46)='SN'#                            DI301554
IF(status:==sumoldzero:)  CHROT(45^46)='SO'#                            DI301555
IF(status:==sumnewboost:) CHROT(45^46)='SB'#                            DI301556
IF(status:==vecltm:)      CHROT(45^46)='NV'#                            DI301557
IF(status:==sumvbzero:)   CHROT(45^46)='SV'#                            DI301558
IF(status:==stollimit:)   CHROT(45^46)='ST'# Outside limit              DI301559
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 121DI301560
#                                                                       DI301561
# VARIABLE HEADER                                                       DI301562
#                                                                       DI301563
DO J=47,NDI30B; DI30B(J^J)=' '#        Blank out the rest               DI301564
IPOSE=46#                              Set start positions num field    DI301565
ILEN=10#                               Length of num field              DI301566
FMTM=22.#                              Format without position&length   DI301567
FMTM=ILEN*100+FMTM#                    Format without position          DI301568
#                                                                       DI301569
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301570
DI30B(IPOSB^IPOSE)=' |F|**2OLD'#                                        DI301571
ncodefld:(fold:**2,1,CHROT,FMT,1)#                                        DI301572
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301573
DI30B(IPOSB^IPOSE)=' |F|**2NEW'#                                        DI301574
ncodefld:(fnew:**2,1,CHROT,FMT,1)#                                        DI301575
#                                                                       DI301576
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301577
DI30B(IPOSB^IPOSE)='    |F|OLD'#                                        DI301578
ncodefld:(fold:,1,CHROT,FMT,1)#                                         DI301579
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301580
DI30B(IPOSB^IPOSE)='    |F|NEW'#                                        DI301581
ncodefld:(fnew:,1,CHROT,FMT,1)#                                         DI301582
#                                                                       DI301583
IF(IFSCR==yes:)#                                                        DI301584
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 122DI301585
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301586
DI30B(IPOSB^IPOSE)='    |F|SCR'#                                        DI301587
ncodefld:(fscr:,1,CHROT,FMT,1)#                                         DI301588
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 122DI301589
#                                                                       DI301590
ILEN=12#                               Length of num field              DI301591
FMTM=51.#                              Format without position&length   DI301592
FMTM=ILEN*100+FMTM#                    Format without position          DI301593
IF(DIVPAT==yes: \ DIVVEC==yes: \ DIVVOL==yes:)#                         DI301594
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 123DI301595
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301596
DI30B(IPOSB^IPOSE)='      ACAL'#                                        DI301597
ifnv:(acal:)  ncodefld:(acal:,1,CHROT,FMT,1)#                           DI301598
ifvo:(acal:)  CHROT(IPOSE+1^IPOSE+1)='N'#                               DI301599
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 123DI301600
#                                                                       DI301601
ILEN=10#                               Length of num field              DI301602
FMTM=22.#                              Format without position&length   DI301603
FMTM=ILEN*100+FMTM#                    Format without position          DI301604
IF(DIVFCA==1 \ DIVFCA==2)#                                              DI301605
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 124DI301606
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301607
IF(DIVFCA==1) DI30B(IPOSB^IPOSE)='    |F|CAL'#                          DI301608
IF(DIVFCA==2) DI30B(IPOSB^IPOSE)=' SIM|F|CAL'#                          DI301609
ncodefld:(fcal:,1,CHROT,FMT,1)#                                         DI301610
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 124DI301611
#                                                                       DI301612
IF(DIVEXP==1 \ DIVEXP==2)#                                              DI301613
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 125DI301614
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301615
IF(DIVEXP==1) DI30B(IPOSB^IPOSE)='    <F**2>'#                          DI301616
IF(DIVEXP==1) BUFOT(1)=ftfe:**2#                                        DI301617
IF(DIVEXP==2) DI30B(IPOSB^IPOSE)='<F**2/eps>'#                          DI301618
IF(DIVEXP==2) BUFOT(1)=ftfe:**2/eps:#                                   DI301619
ncodefld:(BUFOT,1,CHROT,FMT,1)#                                         DI301620
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 125DI301621
#                                                                       DI301622
#                                                                       DI301623
ILEN=7#                                Length of num field              DI301624
FMTM=32.#                              Format without position&length   DI301625
FMTM=ILEN*100+FMTM#                    Format without position          DI301626
#                                                                       DI301627
IF(IE==yes:)#                                                           DI301628
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 126DI301629
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301630
DI30B(IPOSB^IPOSE)=' |E|OLD'#                                           DI301631
ncodefld:(eold:,1,CHROT,FMT,1)#                                         DI301632
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301633
DI30B(IPOSB^IPOSE)=' |E|NEW'#                                           DI301634
ncodefld:(enew:,1,CHROT,FMT,1)#                                         DI301635
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 126DI301636
#                                                                       DI301637
IF(IESCR==yes:)#                                                        DI301638
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 127DI301639
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301640
DI30B(IPOSB^IPOSE)=' |E|SCR'#                                           DI301641
ncodefld:(escr:,1,CHROT,FMT,1)#                                         DI301642
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 127DI301643
#                                                                       DI301644
IF(IE==yes: & DIVVEC==yes:)#                                            DI301645
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 128DI301646
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301647
DI30B(IPOSB^IPOSE)=' |E|CAL'#                                           DI301648
IF(etca:<0.0) CHROT(IPOSB^IPOSE)='  *****'#                             DI301649
ELSE          ncodefld:(SQRT(etca:),1,CHROT,FMT,1)#                     DI301650
IPOSB=IPOSE+1; IPOSE=IPOSB+(ILEN-1); FMT=FMTM+IPOSE*10000.0#            DI301651
DI30B(IPOSB^IPOSE)=' E**2CA'#                                           DI301652
ncodefld:(etca:,1,CHROT,FMT,1)#                                         DI301653
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 128DI301654
#                                                                       DI301655
writeline:(0,DI30B,NDI30B,1,3)#                                         DI301656
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 120DI301657
#                                                                       DI301658
# WRITE BDF                                                             DI301659
# ---------                                                             DI301660
#                                                                       DI301661
copyfile:(1,2,1,decr:(lrrefl:))#       Copy the front part              DI301662
#                                                                       DI301663
IWNT(1)=1#                             Miller indices packed word       DI301664
IWNT(2)=1000+302#                      F2rl                             DI301665
IWNT(3)=1000+304#                      Frel                             DI301666
IWNT(4)=1000+980#                      Mark overlapping reflections     DI301667
IWNT(5)=1000+981#                      Number of refl. in group         DI301668
IWNT(6)=1000+983#                      Use for fourier coeff            DI301669
IWNT(7)=1000+600#                      E                                DI301670
IWNT(8)=1000+960#                      E**2-1                           DI301671
IWNT(9)=1000+970#                      Eps*e**2-1                       DI301672
IWNT(10)=1000+982#                     Max possible /e/ in group        DI301673
#                                                                       DI301674
KEY(1)=1#                              1 to key(1) mandatory items      DI301675
KEY(2)=1#                              Key(1) + 1 to key(2) optional    DI301676
IF(IE==no: )KEY(3)=6#                  Key(2) + 1 to key(3) add/del     DI301677
IF(IE==yes:)KEY(3)=10#                 Key(2) + 1 to key(3) add/del     DI301678
KEY(4)=0#                              Update mode                      DI301679
#                                                                       DI301680
indexpkt:(1,lrrefl:,PSIZA,IPA,2,KEY,$# Scan directory of file a         DI301681
IWNT,IREL)#                            Write directory to file b        DI301682
PSIZB=KEY(4)#                          Set packet size file b           DI301683
#                                                                       DI301684
# START LOOP OVER LRREFL: READ FILE A, WRITE FILE B                     DI301685
# -------------------------------------------------                     DI301686
#                                                                       DI301687
REPEAT#                                Loop over all reflections        DI301688
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 129DI301689
readwpkt:(1,lrrefl:,PSIZA,IPA,0)#      Read next reflection packet      DI301690
IF(IPA<=0) BREAK#                      Test if last packet              DI301691
writepkt:(2,lrrefl:,PSIZB,IPB)#        Output packet                    DI301692
movereal:(QX,IPA+1,QX,IPB+1,PSIZA,1)#  Copy old stuff across            DI301693
#                                                                       DI301694
I=IPA+IREL(1); movepakwd:(QX(I),A)#    Put packed hkl in temporary a    DI301695
FOR(NR=M2;NR<M3;NR=NR+nrefit:)compakwd:(A,EQ,hkl:,BREAK)# Exit when h   DI301696
IF(NR>M3) NEXT#                        Not on list forget it            DI301697
#                                                                       DI301698
I=IPB+IREL(2); QX(I)=fnew:**2#           Move fnew**2 to qx               DI301699
I=IPB+IREL(3); QX(I)=fnew:#            Move fnew to qx                  DI301700
I=IPB+IREL(4); QX(I)=ovlg:#                                             DI301701
I=IPB+IREL(5); QX(I)=nrf:#                                              DI301702
I=IPB+IREL(6); QX(I)=use:#                                              DI301703
#                                                                       DI301704
IF(IE==yes:)#                                                           DI301705
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 130DI301706
I=IPB+IREL(7); QX(I)=enew:#            Move e to qx                     DI301707
I=IPB+IREL(8); QX(I)=enew:**2-1.0#     Move e to qx                     DI301708
I=IPB+IREL(9); QX(I)=eps:*enew:**2-1.0# Move e to qx                    DI301709
I=IPB+IREL(10);QX(I)=emx:#                                              DI301710
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 130DI301711
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 129DI301712
#                                                                       DI301713
copyfile:(1,2,incr:(lrrefl:),endrecord:)# Copy all the rest, close fi   DI301714
#                                                                       DI301715
RETURN#                                                                 DI301716
END#                                                                    DI301717
systemheader:(DI40)#                   Write hkl files                  DI40   1
######################################################################  DI40   2
#                                                                    #  DI40   3
#                               DI40                                 #  DI40   4
#                                                                    #  DI40   5
######################################################################  DI40   6
SUBROUTINE DI40#                                                        DI40   7
include:(AACOMN)#                                                       DI40   8
include:(DICOMN)#                                                       DI40   9
#                                                                       DI40  10
REAL    H(3)#                          Hkl                              DI40  11
REAL    A,B#                                                            DI40  12
INTEGER IF1,IF2,IA,IB#                                                  DI40  13
INTEGER IH,IK,IL#                      Hkl                              DI40  14
INTEGER I#                             Local counter                    DI40  15
INTEGER J#                             Local counter                    DI40  16
INTEGER MARKS#                         Begin of empty qx space          DI40  17
INTEGER IWNT(50)#                      Wanted items for indexpkt:       DI40  18
INTEGER IREL(51)#                      Pointers for qx                  DI40  19
INTEGER KEY(4)#                        Flag for indexpkt:               DI40  20
INTEGER IP#                            Packet pointer for qx            DI40  21
INTEGER PSIZ#                          Packet size filea                DI40  22
REAL    MAXF2,MAXF1,FACF2,FACF1#                                        DI40  23
INTEGER SA(4,4)#                                                        DI40  24
REAL    HKLD(4),HKLDN(4)#              Hkl and phase shift              DI40  25
#                                                                       DI40  26
chardata:(DI40A,[$#                                                     DI40  27
WRITE FILE  /F.HKL/  AND/OR  /F2.HKL/  IN SHELX FORMAT])#               DI40  28
#                                                                       DI40  29
datastuff:#                                                             DI40  30
#                                                                       DI40  31
writeline:(1,DI40A,NDI40A,3,3)#        Write shelx hkl file             DI40  32
#                                                                       DI40  33
# SET UP I/O BUFFER FOR FILE A AND FILE B                               DI40  34
# ---------------------------------------                               DI40  35
#                                                                       DI40  36
IOMARK(1)=QXSTR#                       I/o buffer for file a            DI40  37
IOMARK(2)=IOMARK(1)+bdfbuf:#           I/o buffer for file b            DI40  38
MARKS=IOMARK(2)+bdfbuf:#               Mark start of symop table        DI40  39
incrqx:(I,MARKS,DI2001)#               Expand qx                        DI40  40
#                                                                       DI40  41
# H, K, L, F, SIGMA F OR F**2, SIGMA(F**2)                              DI40  42
# ----------------------------------------                              DI40  43
#                                                                       DI40  44
IWNT(1)=1#                             Miller indices packed word       DI40  45
IWNT(2)=2#                             Sin(theta)/lambda                DI40  46
IWNT(3)=3#                             Reflection multiplicity          DI40  47
IWNT(4)=1000+302#                      F(rel)**2                        DI40  48
IWNT(5)=1000+303#                      Sigma f(rel)**2                  DI40  49
IWNT(6)=1000+304#                      F(rel)                           DI40  50
IWNT(7)=1000+305#                      Sigma f(rel)                     DI40  51
IWNT(8)=1000+801#                      A (cal)                          DI40  52
IWNT(9)=1000+802#                      B (cal)                          DI40  53
#                                                                       DI40  54
KEY(1)=3#                              1 to key(1) mandatory items      DI40  55
KEY(2)=9#                              Key(1) + 1 to key(2) optional    DI40  56
KEY(3)=9#                              Key(2) + 1 to key(3) add/del     DI40  57
KEY(4)=0#                              Update mode                      DI40  58
indexpkt:(1,lrrefl:,PSIZ,IP,0,KEY,IWNT,IREL)# Scan directory            DI40  59
#                                                                       DI40  60
# CHECK ON ITEMS REQUESTED                                              DI40  61
# ------------------------                                              DI40  62
#                                                                       DI40  63
IF(IREL(1)==0) iquit:(DI2004)#         No miller indices packed word    DI40  64
IF(IREL(2)==0) iquit:(DI2005)#         No sin(theta)/lambda             DI40  65
IF(IREL(3)==0) iquit:(DI2006)#         No refl multiplicity             DI40  66
#                                                                       DI40  67
IF2   = yes: ;IF(IREL(4)==0) IF2=no:#                                   DI40  68
ISGFT = yes: ;IF(IREL(5)==0) ISGFT=no:#                                 DI40  69
IF1   = yes: ;IF(IREL(6)==0) IF1=no:#                                   DI40  70
ISGF  = yes: ;IF(IREL(7)==0) ISGF=no:#                                  DI40  71
IA    = yes: ;IF(IREL(8)==0) IA=no:#                                    DI40  72
IB    = yes: ;IF(IREL(9)==0) IB=no:#                                    DI40  73
#                                                                       DI40  74
# START REFLECTION LOOP                                                 DI40  75
# ---------------------                                                 DI40  76
#                                                                       DI40  77
IF(WRTABC==yes:)$#                                                      DI40  78
OPEN(UNIT=79,FILE='ABCAL.HKL',STATUS='NEW',FORM='FORMATTED')#           DI40  79
#                                                                       DI40  80
IF(WRTHKL==yes:)#                                                       DI40  81
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI40  82
IF(IF2==yes:)#                                                          DI40  83
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  DI40  84
OPEN(UNIT=80,FILE='F2.HKL',FORM='FORMATTED',STATUS='NEW')# R            DI40  85
WRITE(80,*)'   H   K   L  F**2   SIGMA F**2'#                           DI40  86
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  DI40  87
IF(IF1==yes:)#                                                          DI40  88
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  DI40  89
OPEN(UNIT=90,FILE='F.HKL',FORM='FORMATTED',STATUS='NEW')# Rc            DI40  90
WRITE(90,*)'   H   K   L     F      SIGMA F'#                           DI40  91
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  DI40  92
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI40  93
#                                                                       DI40  94
# SEARCH MAX F**2 / MAX F                                               DI40  95
#                                                                       DI40  96
IF(WRTHKL==yes:)#                                                       DI40  97
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  DI40  98
MAXF1=0.0; MAXF2=0.0#                                                   DI40  99
REPEAT#                                Loop over all reflections        DI40 100
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  DI40 101
readwpkt:(1,lrrefl:,PSIZ,IP,0)#        Read next reflection packet      DI40 102
IF(IP<=0) BREAK#                       Test if last packet              DI40 103
IF(IF2==yes:) MAXF2=MAX(MAXF2,QX(IP+IREL(4)))#                          DI40 104
IF(IF1==yes:) MAXF1=MAX(MAXF1,QX(IP+IREL(6)))#                          DI40 105
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  DI40 106
readwpkt:(1,endrecord:,PSIZ,IP,0)#     Goto end of file a, close file   DI40 107
IF(IF2==yes:)FACF2=9999./MAXF2#                                         DI40 108
IF(IF1==yes:)FACF1=9999./MAXF1#                                         DI40 109
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  DI40 110
#                                                                       DI40 111
#                                                                       DI40 112
REPEAT#                                Loop over all reflections        DI40 113
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  DI40 114
readwpkt:(1,lrrefl:,PSIZ,IP,0)#        Read next reflection packet      DI40 115
IF(IP<=0) BREAK#                       Test if last packet              DI40 116
#                                                                       DI40 117
I=IP+IREL(1); gethkl:(I,H)#            Unpack h, k, l                   DI40 118
IH=NINT(H(1))#                                                          DI40 119
IK=NINT(H(2))#                                                          DI40 120
IL=NINT(H(3))#                                                          DI40 121
#                                                                       DI40 122
# A,B (CALC)                                                            DI40 123
# ----------                                                            DI40 124
#                                                                       DI40 125
IF(WRTABC==yes:)#                                                       DI40 126
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  DI40 127
A=QX(IP+IREL(8)); B=QX(IP+IREL(9))#                                     DI40 128
IF(A!=voidflg: & B!=voidflg:) WRITE(79,FMT=*)IH,IK,IL,A,B#              DI40 129
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  DI40 130
#                                                                       DI40 131
# DUMP FULL RECIPROCAL LATTICE TO FILE                                  DI40 132
# ------------------------------------                                  DI40 133
#                                                                       DI40 134
IF(WRTHKL==yes:)#                                                       DI40 135
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  DI40 136
IF(RECLAT==yes:)#                                                       DI40 137
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  DI40 138
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI40 139
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 DI40 140
DO I=1,3; HKLD(I)=H(I)#                Load hkl                         DI40 141
HKLD(4)=0.0#                           Phase shift zero                 DI40 142
FOR(I=M0;I<M1;I=I+nsymit:)#            Loop over primitive symop        DI40 143
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 DI40 144
CALL DI61(SA,I)#                       C(i), ith symop                  DI40 145
CALL DI62(HKLD,SA,HKLDN)#              (h,k,l,d)*c(i)                   DI40 146
IH=NINT(HKLDN(1)); IK=NINT(HKLDN(2)); IL=NINT(HKLDN(3))#                DI40 147
IF(IF2==yes: & ISGFT==yes:)$#                                           DI40 148
WRITE(80,3456)IH,IK,IL,QX(IP+IREL(4))*FACF2,QX(IP+IREL(5))*FACF2#       DI40 149
IF(IF2==yes: & ISGFT==no:)$#                                            DI40 150
WRITE(80,3456)IH,IK,IL,QX(IP+IREL(4))*FACF2#                            DI40 151
IF(IF1==yes: & ISGF==yes:)$#                                            DI40 152
WRITE(90,3456)IH,IK,IL,QX(IP+IREL(6))*FACF1,QX(IP+IREL(7))*FACF1#       DI40 153
IF(IF1==yes: & ISGF==no:)$#                                             DI40 154
WRITE(90,3456)IH,IK,IL,QX(IP+IREL(6))*FACF1#                            DI40 155
3456  FORMAT(3I4,2F8.2)#                                                DI40 156
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 DI40 157
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 DI40 158
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  DI40 159
ELSE#                                  Assymetric unit                  DI40 160
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 DI40 161
IF(IF2==yes: & ISGFT==yes:)$#                                           DI40 162
WRITE(80,3456)IH,IK,IL,QX(IP+IREL(4))*FACF2,QX(IP+IREL(5))*FACF2#       DI40 163
IF(IF2==yes: & ISGFT==no:)$#                                            DI40 164
WRITE(80,3456)IH,IK,IL,QX(IP+IREL(4))*FACF2#                            DI40 165
IF(IF1==yes: & ISGF==yes:)$#                                            DI40 166
WRITE(90,3456)IH,IK,IL,QX(IP+IREL(6))*FACF1,QX(IP+IREL(7))*FACF1#       DI40 167
IF(IF1==yes: & ISGF==no:)$#                                             DI40 168
WRITE(90,3456)IH,IK,IL,QX(IP+IREL(6))*FACF1#                            DI40 169
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 DI40 170
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  DI40 171
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  DI40 172
readwpkt:(1,endrecord:,PSIZ,IP,0)#     Goto end of file a, close file   DI40 173
IF(WRTABC==yes:)CLOSE(UNIT=79)#        Close fortran fil                DI40 174
IF(WRTHKL==yes:)CLOSE(UNIT=80)#        Close fortran fil                DI40 175
IF(WRTHKL==yes:)CLOSE(UNIT=90)#        Close fortran fil                DI40 176
#                                                                       DI40 177
RETURN#                                                                 DI40 178
END#                                                                    DI40 179
systemheader:(DI50)#                   Move refl items                  DI50   1
######################################################################  DI50   2
#                                                                    #  DI50   3
#                               DI50                                 #  DI50   4
#                                                                    #  DI50   5
######################################################################  DI50   6
SUBROUTINE DI50#                                                        DI50   7
include:(AACOMN)#                                                       DI50   8
include:(DICOMN)#                                                       DI50   9
#                                                                       DI50  10
INTEGER I#                             Local counter                    DI50  11
INTEGER J#                             Local counter                    DI50  12
INTEGER IPT1#                          Local counter                    DI50  13
INTEGER IPT2#                          Local counter                    DI50  14
INTEGER MARKS#                         Begin of empty qx space          DI50  15
INTEGER IWNT(50)#                      Wanted items for indexpkt:       DI50  16
INTEGER IREL(51)#                      Pointers for qx                  DI50  17
INTEGER KEY(4)#                        Flag for indexpkt:               DI50  18
INTEGER IP#                            Packet pointer for qx            DI50  19
INTEGER IPA#                           Packet pointer for qx            DI50  20
INTEGER IPB#                           Packet pointer for qx            DI50  21
INTEGER PSIZ#                          Packet size filea                DI50  22
INTEGER PSIZA#                         Packet size filea                DI50  23
INTEGER PSIZB#                         Packet size fileb                DI50  24
#                                                                       DI50  25
chardata:(DI50A,[$#                                                     DI50  26
REFLECTION RECORD : COPY CONTENT OF ITEM1 TO ITEM2])#                   DI50  27
#                                                                       DI50  28
datastuff:#                                                             DI50  29
#                                                                       DI50  30
BUFOT(1)=ITEM1;BUFOT(2)=ITEM2#                                          DI50  31
FMT=400513. ;ncodefld:(BUFOT,1,CHROT,FMT,1)# Item1                      DI50  32
FMT=490513. ;ncodefld:(BUFOT,2,CHROT,FMT,1)# Item2                      DI50  33
writeline:(1,DI50A,NDI50A,2,3)#        Report it                        DI50  34
#                                                                       DI50  35
#                                                                       DI50  36
# SET UP I/O BUFFER FOR FILE A AND FILE B                               DI50  37
# ---------------------------------------                               DI50  38
#                                                                       DI50  39
IOMARK(1)=QXSTR#                       I/o buffer for file a            DI50  40
IOMARK(2)=IOMARK(1)+bdfbuf:#           I/o buffer for file b            DI50  41
MARKS=IOMARK(2)+bdfbuf:#               Mark start of symop table        DI50  42
incrqx:(I,MARKS,DI5001)#               Expand qx                        DI50  43
#                                                                       DI50  44
# WRITE FILE B                                                          DI50  45
# ------------                                                          DI50  46
#                                                                       DI50  47
copyfile:(1,2,1,decr:(lrrefl:))#       Copy the front part              DI50  48
#                                                                       DI50  49
IWNT(1)=ITEM1#                         Item to copy from                DI50  50
IWNT(2)=ITEM2#                         Item to copy to                  DI50  51
#                                                                       DI50  52
KEY(1)=1#                              1 to key(1) mandatory items      DI50  53
KEY(2)=1#                              Key(1) + 1 to key(2) optional    DI50  54
KEY(3)=2#                              Key(2) + 1 to key(3) add/del     DI50  55
KEY(4)=0#                              Update mode                      DI50  56
#                                                                       DI50  57
indexpkt:(1,lrrefl:,PSIZA,IPA,2,KEY,$# Scan directory of file a         DI50  58
IWNT,IREL)#                            Write directory to file b        DI50  59
PSIZB=KEY(4)#                          Set packet size file b           DI50  60
#                                                                       DI50  61
IF(IREL(1)==0) iquit:(DI5002)#         Wanted item not on bdf           DI50  62
#                                                                       DI50  63
IPT1=IREL(1)#                          Item1                            DI50  64
IPT2=IREL(2)#                          Item2                            DI50  65
#                                                                       DI50  66
# START LOOP OVER LRREFL: IN FILE A, WRITE FILE B                       DI50  67
# -----------------------------------------------                       DI50  68
#                                                                       DI50  69
REPEAT#                                Loop over all reflections        DI50  70
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI50  71
readwpkt:(1,lrrefl:,PSIZA,IPA,0)#      Read next reflection packet      DI50  72
IF(IPA<=0) BREAK#                      Test if last packet              DI50  73
writepkt:(2,lrrefl:,PSIZB,IPB)#        Output packet                    DI50  74
movereal:(QX,IPA+1,QX,IPB+1,PSIZA,1)#  Copy old stuff across            DI50  75
#                                                                       DI50  76
QX(IPB+IPT2)=QX(IPA+IPT1)#             Move content of item1 to item2   DI50  77
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI50  78
#                                                                       DI50  79
copyfile:(1,2,incr:(lrrefl:),endrecord:)# Copy all the rest, close fi   DI50  80
#                                                                       DI50  81
RETURN#                                                                 DI50  82
END#                                                                    DI50  83
systemheader:(DI55)#                   Write refl items                 DI55   1
######################################################################  DI55   2
#                                                                    #  DI55   3
#                               DI55                                 #  DI55   4
#                                                                    #  DI55   5
######################################################################  DI55   6
SUBROUTINE DI55#                                                        DI55   7
include:(AACOMN)#                                                       DI55   8
include:(DICOMN)#                                                       DI55   9
#                                                                       DI55  10
INTEGER I#                             Local counter                    DI55  11
INTEGER J#                             Local counter                    DI55  12
INTEGER MARKS#                         Begin of empty qx space          DI55  13
INTEGER IWNT(50)#                      Wanted items for indexpkt:       DI55  14
INTEGER IREL(51)#                      Pointers for qx                  DI55  15
INTEGER KEY(4)#                        Flag for indexpkt:               DI55  16
INTEGER IP#                            Packet pointer for qx            DI55  17
INTEGER IPA#                           Packet pointer for qx            DI55  18
INTEGER IPB#                           Packet pointer for qx            DI55  19
INTEGER PSIZ#                          Packet size filea                DI55  20
INTEGER PSIZA#                         Packet size filea                DI55  21
INTEGER PSIZB#                         Packet size fileb                DI55  22
REAL    H(3)#                          Hkl                              DI55  23
CHARACTER TAB#                                                          DI55  24
#                                                                       DI55  25
chardata:(DI55A,[$#                                                     DI55  26
REFLECTION RECORD : WRITE CONTENT OF  ITEMS])#                          DI55  27
#                                                                       DI55  28
datastuff:#                                                             DI55  29
#                                                                       DI55  30
DO I=1,NITEM#                                                           DI55  31
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI55  32
WRITE(CHROT(1+I*6 ^ 6+I*6),FMT='(X,I5)') ITEM(I)#                       DI55  33
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI55  34
writeline:(1,DI55A,NDI55A,2,3)#                                         DI55  35
#                                                                       DI55  36
#                                                                       DI55  37
# SET UP I/O BUFFER FOR FILE A AND FILE B                               DI55  38
# ---------------------------------------                               DI55  39
#                                                                       DI55  40
IOMARK(1) = QXSTR#                     I/o buffer for file a            DI55  41
IOMARK(2) = IOMARK(1)+bdfbuf:#         I/o buffer for file b            DI55  42
MARKS     = IOMARK(2)+bdfbuf:#         Mark start of symop table        DI55  43
incrqx:(I,MARKS,DI2001)#               Expand qx                        DI55  44
#                                                                       DI55  45
# READ FILE A                                                           DI55  46
# -----------                                                           DI55  47
#                                                                       DI55  48
IWNT(1)=1#                                                              DI55  49
DO I=1,NITEM;IWNT(I+1)=ITEM(I)#        Item to copy from                DI55  50
#                                                                       DI55  51
KEY(1)=NITEM+1#                        1 to key(1) mandatory items      DI55  52
KEY(2)=NITEM+1#                        Key(1) + 1 to key(2) optional    DI55  53
KEY(3)=NITEM+1#                        Key(2) + 1 to key(3) add/del     DI55  54
KEY(4)=0#                              Update mode                      DI55  55
#                                                                       DI55  56
indexpkt:(1,lrrefl:,PSIZA,IPA,0,KEY,$# Scan directory of file a         DI55  57
IWNT,IREL)#                            Write directory to file b        DI55  58
PSIZB=KEY(4)#                          Set packet size file b           DI55  59
#                                                                       DI55  60
DO I=1,NITEM+1;IF(IREL(I)==0)iquit:(DI5501)# Wanted item not on bdf     DI55  61
#                                                                       DI55  62
# START LOOP OVER LRREFL: IN FILE A                                     DI55  63
# ---------------------------------                                     DI55  64
#                                                                       DI55  65
TAB=CHAR(9)#                           Ascii into character             DI55  66
ifsel:(VAX)#                                                            DI55  67
OPEN(UNIT=99,FILE='ITEMS.DAT',STATUS='NEW',FORM='FORMATTED',$#          DI55  68
CARRIAGECONTROL='LIST')#                                                DI55  69
ifsel:#                                                                 DI55  70
OPEN(UNIT=99,FILE='ITEMS.DAT',STATUS='NEW',FORM='FORMATTED')#           DI55  71
endsel:#                                                                DI55  72
WRITE(99,998)'    H',TAB,'    K',TAB,'    L',TAB,$#                     DI55  73
(ITEM(I),TAB,  I=1,NITEM)#                                              DI55  74
998 FORMAT(3(A5,A),20(I20,A))#                                          DI55  75
REPEAT#                                Loop over all reflections        DI55  76
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  DI55  77
readwpkt:(1,lrrefl:,PSIZA,IPA,0)#      Read next reflection packet      DI55  78
IF(IPA<=0) BREAK#                      Test if last packet              DI55  79
gethkl:(IPA+IREL(1),H)#                Unpack h, k, l                   DI55  80
WRITE(99,FMT=999) $#                                                    DI55  81
(NINT(H(I)),TAB, I=1,3),(QX(IPA+IREL(I+1)),TAB, I=1,NITEM)#             DI55  82
999 FORMAT(3(I5,A),20(F20.8,A))#                                        DI55  83
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  DI55  84
readwpkt:(1,endrecord:,PSIZA,IPA,0)#   Goto end of file a, close file   DI55  85
CLOSE(99)#                                                              DI55  86
#                                                                       DI55  87
#                                                                       DI55  88
RETURN#                                                                 DI55  89
END#                                                                    DI55  90
systemheader:(DI60)#                   Calc symmetry related factors    DI60   1
# ################################################################## #  DI60   2
#                                                                    #  DI60   3
#                               DI60                                 #  DI60   4
#                                                                    #  DI60   5
# ################################################################## #  DI60   6
SUBROUTINE DI60#                                                        DI60   7
include:(AACOMN)#                                                       DI60   8
include:(DICOMN)#                                                       DI60   9
#                                                                       DI60  10
INTEGER SA(4,4)#                                                        DI60  11
INTEGER SB(4,4)#                                                        DI60  12
INTEGER SC(4,4)#                                                        DI60  13
INTEGER SD(4,4)#                                                        DI60  14
INTEGER ZERO(4,4)#                     Null matrix                      DI60  15
INTEGER ANS#                                                            DI60  16
INTEGER I,J,K,L,M#                                                      DI60  17
INTEGER EPS,GAMMA#                                                      DI60  18
REAL    H(3)#                          Hkl                              DI60  19
REAL    HKLD(4),HKLDN(4)#              Hkl and phase shift              DI60  20
REAL    A,B,FMT#                                                        DI60  21
realdata:(TINY,0.000001)#                                               DI60  22
realdata:(TWOPI,6.28318530718)#        Just that                        DI60  23
realdata:(FMV,[30203.,100313.,140313.,180313.,300313.])# Vector forma   DI60  24
#                                                                       DI60  25
datastuff:#                                                             DI60  26
#                                                                       DI60  27
# TEST IF ALL PRODUCTS ARE GROUP ELEMENTS                               DI60  28
# ---------------------------------------                               DI60  29
#                                                                       DI60  30
FOR(I=M0;I<M2;I=I+nsymit:)#            Loop over all symops             DI60  31
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI60  32
CALL DI61(SA,I)#                       Load 4*4 matrix, ith s           DI60  33
FOR(J=M0;J<M2;J=J+nsymit:)#            Loop over all symops             DI60  34
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  DI60  35
CALL DI61(SB,J)#                       Load 4*4 matrix, jth symop       DI60  36
CALL DI63(SA,SB,SC)#                   C=b*a                            DI60  37
FOR(K=M0;K<M2;K=K+nsymit:)#            Loop over all symops             DI60  38
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  DI60  39
CALL DI61(SD,K)#                       Load 4*4 matrix, kth symop       DI60  40
CALL DI64(SC,SD,ANS)#                  Test if equal                    DI60  41
IF(ANS==yes:) BREAK#                   Found one                        DI60  42
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  DI60  43
IF(ANS==no:) iquit:(DI6001)#           Product not in group             DI60  44
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  DI60  45
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI60  46
#                                                                       DI60  47
# STAT. WEIGHT FOR SYMOP (I-C(S)                                        DI60  48
# ------------------------------                                        DI60  49
#                                                                       DI60  50
FOR(I=M0;I<M1;I=I+nsymit:)#            Loop over primitive symops       DI60  51
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  DI60  52
CALL DI65(SA,I)#                       I-c(i), ith symop                DI60  53
DO K=1,3; SA(K,4)=0#                   No translations                  DI60  54
EPS=0#                                 Statistical weight epsilon       DI60  55
FOR(J=M0;J<M1;J=J+nsymit:)#            Loop over primitive symops       DI60  56
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  DI60  57
CALL DI61(SB,J)#                       C(j), jth symop                  DI60  58
DO K=1,3; SB(K,4)=0#                   No translations                  DI60  59
CALL DI63(SB,SA,SC)#                   C=b*a                            DI60  60
CALL DI64(SC,SA,ANS); IF(ANS==yes:)EPS=EPS+1# Count equal ones          DI60  61
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  DI60  62
ps:(I)=EPS#                            Statistical weight for i-c(i)    DI60  63
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  DI60  64
#                                                                       DI60  65
# STAT. WEIGHT WITH PRIMITIVE SYMOPS FOR REFLCTIONS (H,K,L)             DI60  66
# ---------------------------------------------------------             DI60  67
#                                                                       DI60  68
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI60  69
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  DI60  70
EPS=0#                                                                  DI60  71
gethkl:(NR+1,H)#                       Unpack h, k, l                   DI60  72
DO I=1,3; HKLD(I)=H(I)#                Load hkl                         DI60  73
HKLD(4)=0.0#                           Phase shift zero                 DI60  74
FOR(I=M0;I<M1;I=I+nsymit:)#            Loop over primitive symop        DI60  75
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  DI60  76
CALL DI61(SA,I)#                       C(i), ith symop                  DI60  77
CALL DI62(HKLD,SA,HKLDN)#              (h,k,l,d)*c(i)                   DI60  78
M=MOD(NINT(12.*HKLDN(4))+120,12)#      Ensure d in 12ths of 2pi         DI60  79
IF((ABS(HKLD(1)-HKLDN(1))<TINY)$#      H=h'                             DI60  80
&  (ABS(HKLD(2)-HKLDN(2))<TINY)$#      K=k'                             DI60  81
&  (ABS(HKLD(3)-HKLDN(3))<TINY)$#      L=l'                             DI60  82
&  M==0) EPS=EPS+1#                    Count reinforcement factor       DI60  83
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  DI60  84
pst:(NR)=EPS#                                                           DI60  85
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  DI60  86
#                                                                       DI60  87
# ABSOLUT COEFFICIENT GAMMA  FOR (I-C(I)) * C(J) = I-C(K)               DI60  88
# -------------------------------------------------------               DI60  89
#                                                                       DI60  90
FOR(I=M0;I<M1;I=I+nsymit:)#            Loop over primitive symop        DI60  91
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  DI60  92
GAMMA=1#                               Trivial partner                  DI60  93
pa:(I)=I#                              Address for partner (i-c(k))     DI60  94
CALL DI65(SA,I)#                       I-c(i), ith symop                DI60  95
FOR(K=M0;K<M1;K=K+nsymit:)#            Loop over primitive symop        DI60  96
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  DI60  97
CALL DI65(SD,K)#                       I-c(k), kth symop                DI60  98
#                                                                       DI60  99
FOR(J=M0;J<M1;J=J+nsymit:)#            Loop over primitive symop        DI60 100
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 DI60 101
CALL DI61(SB,J)#                       C(j), jth symop                  DI60 102
CALL DI63(SA,SB,SC)#                   Sc = (i-c(i)) * c(j)             DI60 103
CALL DI64(SC,SD,ANS)#                  (i-c(i)) * c(j) =? i-c(k)        DI60 104
IF(ANS==yes:) BREAK#                   Symop link found                 DI60 105
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 DI60 106
IF(ANS==yes: & I!=K)#                  Equivalent but not identical     DI60 107
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 DI60 108
GAMMA=GAMMA+1#                         Partner found                    DI60 109
pa:(I)=K#                              Address for partner (i-c(k))     DI60 110
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 DI60 111
#                                                                       DI60 112
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  DI60 113
gs:(I)=GAMMA#                                                           DI60 114
IF(ICNT==0) fs:(I)=gs:(I)*(gs:(I)*ps:(I)-1)# Acentric                   DI60 115
IF(ICNT==1) fs:(I)=gs:(I)*(gs:(I)*ps:(I)-2)# Centric                    DI60 116
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  DI60 117
#                                                                       DI60 118
# WRITE I-C                                                             DI60 119
# ---------                                                             DI60 120
#                                                                       DI60 121
IF(SYMPRY>0)#                                                           DI60 122
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 DI60 123
IF(ICNT==0) CHROT(1^46)=$#                                              DI60 124
'SYMOP(s) p(s) g(s) g*(p*g-1)                    (hkl)*(I-C(s)'#        DI60 125
IF(ICNT==1) CHROT(1^46)=$#                                              DI60 126
'SYMOP(s) p(s) g(s) g*(p*g-2)                    (hkl)*(I-C(s)'#        DI60 127
writeline:(1,0,0,1,3)#                                                  DI60 128
FOR(I=M0+nsymit:;I<M1;I=I+nsymit:)#    Loop over primitive symop,s=2.   DI60 129
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 DI60 130
#                                                                       DI60 131
IF(pa:(I) >= I)#                                                        DI60 132
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 DI60 133
BUFOT(1)=(I-M0)/nsymit:+1#             Th symop                         DI60 134
IPOS=3; FMT=IPOS*10000.0 + 0303.#                                       DI60 135
ncodefld:(BUFOT,1,CHROT,FMT,1)#                                         DI60 136
IF(pa:(I)!=I)#                         Partner                          DI60 137
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 15 DI60 138
BUFOT(1)=(pa:(I)-M0)/nsymit:+1#        Th symop                         DI60 139
CHROT(4^4)=','#                                                         DI60 140
IPOS=7; FMT=IPOS*10000.0 + 0303.#                                       DI60 141
ncodefld:(BUFOT,1,CHROT,FMT,1)#                                         DI60 142
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 15 DI60 143
BUFOT(1)=ps:(I)#                                                        DI60 144
IPOS=13; FMT=IPOS*10000.0 + 0303.#                                      DI60 145
ncodefld:(BUFOT,1,CHROT,FMT,1)#                                         DI60 146
BUFOT(1)=gs:(I)#                                                        DI60 147
IPOS=18; FMT=IPOS*10000.0 + 0303.#                                      DI60 148
ncodefld:(BUFOT,1,CHROT,FMT,1)#                                         DI60 149
BUFOT(1)=fs:(I)#                                                        DI60 150
IPOS=28; FMT=IPOS*10000.0 + 0313.#                                      DI60 151
ncodefld:(BUFOT,1,CHROT,FMT,1)#                                         DI60 152
IPOS=IPOS+3#                                                            DI60 153
#                                                                       DI60 154
CALL DI65(SA,I)#                       I-c(i), ith symop                DI60 155
DO L=1,3#                                                               DI60 156
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16 DI60 157
DO K=1,3#                                                               DI60 158
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 17 DI60 159
IF(K==1) CHROT(IPOS+2^IPOS+2)='h'#                                      DI60 160
IF(K==2) CHROT(IPOS+2^IPOS+2)='k'#                                      DI60 161
IF(K==3) CHROT(IPOS+2^IPOS+2)='l'#                                      DI60 162
M=SA(K,L)#                                                              DI60 163
IF(M==+12)CHROT(IPOS^IPOS+1)=' +'#                                      DI60 164
IF(M==-12)CHROT(IPOS^IPOS+1)=' -'#                                      DI60 165
IF((M<-12)\(M>+12))#                                                    DI60 166
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 18 DI60 167
BUFOT(1)=FLOAT(M/12)#                                                   DI60 168
FMT=(IPOS+1)*10000.0 + 0203.#                                           DI60 169
ncodefld:(BUFOT,1,CHROT,FMT,1)#                                         DI60 170
IF(M>+12)CHROT(IPOS^IPOS)='+'#                                          DI60 171
IF(M<-12)CHROT(IPOS^IPOS)='-'#                                          DI60 172
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 18 DI60 173
IF(M==0) CHROT(IPOS^IPOS+2)='   '#                                      DI60 174
IPOS=IPOS+3#                                                            DI60 175
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 17 DI60 176
IF(SA(1,L)==0 & SA(2,L)==0 & SA(3,L)==0)CHROT(IPOS-2^IPOS-2)='0'#       DI60 177
IF(L!=3)CHROT(IPOS^IPOS)=','#                                           DI60 178
IPOS=IPOS+3#                                                            DI60 179
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 16 DI60 180
IF(pa:(I)!=I)#                         Partner                          DI60 181
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 19 DI60 182
CALL DI65(SA,NINT(pa:(I)))#            I-c(i), ith symop                DI60 183
CHROT(IPOS^IPOS+1)='//'; IPOS=IPOS+2#                                   DI60 184
DO L=1,3#                                                               DI60 185
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 20 DI60 186
DO K=1,3#                                                               DI60 187
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 21 DI60 188
IF(K==1) CHROT(IPOS+2^IPOS+2)='h'#                                      DI60 189
IF(K==2) CHROT(IPOS+2^IPOS+2)='k'#                                      DI60 190
IF(K==3) CHROT(IPOS+2^IPOS+2)='l'#                                      DI60 191
M=SA(K,L)#                                                              DI60 192
IF(M==+12)CHROT(IPOS^IPOS+1)=' +'#                                      DI60 193
IF(M==-12)CHROT(IPOS^IPOS+1)=' -'#                                      DI60 194
IF((M<-12)\(M>+12))#                                                    DI60 195
$(#                                    6>>>>>>>>>>>>>>>>>>>>>>>>>>>> 22 DI60 196
BUFOT(1)=FLOAT(M/12)#                                                   DI60 197
FMT=(IPOS+1)*10000.0 + 0203.#                                           DI60 198
ncodefld:(BUFOT,1,CHROT,FMT,1)#                                         DI60 199
IF(M>+12)CHROT(IPOS^IPOS)='+'#                                          DI60 200
IF(M<-12)CHROT(IPOS^IPOS)='-'#                                          DI60 201
$)#                                    6<<<<<<<<<<<<<<<<<<<<<<<<<<<< 22 DI60 202
IF(M==0) CHROT(IPOS^IPOS+2)='   '#                                      DI60 203
IPOS=IPOS+3#                                                            DI60 204
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 21 DI60 205
IF(SA(1,L)==0 & SA(2,L)==0 & SA(3,L)==0)CHROT(IPOS-2^IPOS-2)='0'#       DI60 206
IF(L!=3)CHROT(IPOS^IPOS)=','#                                           DI60 207
IPOS=IPOS+3#                                                            DI60 208
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 20 DI60 209
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 19 DI60 210
writeline:(0,0,0,1,3)#                                                  DI60 211
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 DI60 212
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 DI60 213
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 DI60 214
#                                                                       DI60 215
# SEARCH FOR (H,K,L)*(I-C(S)) = (0,0,0)                                 DI60 216
# -------------------------------------                                 DI60 217
#                                                                       DI60 218
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI60 219
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 23 DI60 220
add:(NR)=-1.0#                         Default                          DI60 221
gethkl:(NR+1,H)#                       Unpack h, k, l                   DI60 222
DO I=1,3; HKLD(I)=H(I)#                Load hkl                         DI60 223
HKLD(4)=0.0#                           Phase shift zero                 DI60 224
FOR(I=M0+nsymit:;I<M1;I=I+nsymit:)#    Loop over primitive symop,s=2.   DI60 225
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 24 DI60 226
IF(pa:(I) < I)  NEXT#                  Do not use equivalent partner    DI60 227
IF(fs:(I)==0.0) NEXT#                  Gamma is zero                    DI60 228
CALL DI65(SA,I)#                       I-c(i), ith symop                DI60 229
CALL DI62(HKLD,SA,HKLDN)#              (h,k,l,d)*(i-c(s))               DI60 230
IF(HKLDN(1)!=0.0 \ HKLDN(2)!=0.0 \ HKLDN(3)!=0.0) NEXT# Not (0,0,0)     DI60 231
A=COS(TWOPI*HKLDN(4)); B=SQRT(1-A**2)# Phase shift,a(s)(-h)             DI60 232
IF(ABS(B)>0.001)#                      Warn user                        DI60 233
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 25 DI60 234
WRITE(6,*)'IMAGINARY PHASE SHIFT'#                                      DI60 235
WRITE(6,*)'A=',A,' B=',B#                                               DI60 236
WRITE(6,*)'D=',HKLDN(4)#                                                DI60 237
WRITE(6,*)'MATRIX'#                                                     DI60 238
CALL DI66(SA)#                                                          DI60 239
WRITE(6,*)'INPUT  (H,K,L,D) ',HKLD(1),HKLD(2),HKLD(3),HKLD(4)#          DI60 240
WRITE(6,*)'OUTPUT (H,K,L,D) ',HKLDN(1),HKLDN(2),HKLDN(3),HKLDN(4)#      DI60 241
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 25 DI60 242
IF(ICNT==1) add:(NR)=add:(NR)+0.5*fs:(I)*A# Centric                     DI60 243
IF(ICNT==0) add:(NR)=add:(NR)+fs:(I)*A# Acentric                        DI60 244
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 24 DI60 245
IF(SYMPRY>1)#                                                           DI60 246
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 26 DI60 247
BUFOT(1)=pst:(NR);BUFOT(2)=HKLD(1);BUFOT(3)=HKLD(2)#                    DI60 248
BUFOT(4)=HKLD(3);BUFOT(5)=add:(NR)#                                     DI60 249
CHROT(4^31)='*/E(   ,   ,   )/**2 + (   )'#                             DI60 250
ncodefld:(BUFOT,1,CHROT,FMV,5)#                                         DI60 251
writeline:(0,0,0,1,3)#                                                  DI60 252
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 26 DI60 253
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 23 DI60 254
#                                                                       DI60 255
RETURN#                                                                 DI60 256
END#                                                                    DI60 257
systemheader:(DI61)#                   Loads symdata into 4*4 matrix    DI61   1
# ################################################################## #  DI61   2
#                                                                    #  DI61   3
#                               DI61                                 #  DI61   4
#                                                                    #  DI61   5
# ################################################################## #  DI61   6
SUBROUTINE DI61(A,IP)#                                                  DI61   7
include:(AACOMN)#                                                       DI61   8
#                                                                       DI61   9
INTEGER A(4,4)#                        4*4 matrix                       DI61  10
INTEGER IP#                            Pointer to qx array              DI61  11
REAL    S(4,4)#                                                         DI61  12
INTEGER I,J#                                                            DI61  13
#                                                                       DI61  14
datastuff:#                                                             DI61  15
#                                                                       DI61  16
# R11 R12 R13 T1                                                        DI61  17
# R21 R22 R23 T2                                                        DI61  18
# R31 R32 R33 T3                                                        DI61  19
#   0   0   0  1                                                        DI61  20
#                                                                       DI61  21
# R11 R21 R31 R12 R22 R32 R13 R23 R33 T1 T2 T3                          DI61  22
#   1   2   3   4   5   6   7   8   9 10 11 12     QX(IP+...)           DI61  23
#                                                                       DI61  24
S(1,1)=QX(IP+ 1);S(1,2)=QX(IP+ 4);S(1,3)=QX(IP+ 7);S(1,4)=QX(IP+10)#    DI61  25
S(2,1)=QX(IP+ 2);S(2,2)=QX(IP+ 5);S(2,3)=QX(IP+ 8);S(2,4)=QX(IP+11)#    DI61  26
S(3,1)=QX(IP+ 3);S(3,2)=QX(IP+ 6);S(3,3)=QX(IP+ 9);S(3,4)=QX(IP+12)#    DI61  27
S(4,1)=0.0      ;S(4,2)=0.0      ;S(4,3)=0.0      ;S(4,4)=1.0#          DI61  28
#                                                                       DI61  29
DO I=1,4; DO J=1,4; A(I,J)=NINT(S(I,J)*12.0)# Convert into twelfths     DI61  30
#                                                                       DI61  31
RETURN#                                                                 DI61  32
END#                                                                    DI61  33
systemheader:(DI62)#                   Multiply (h,k,l,d)*matrice       DI62   1
# ################################################################## #  DI62   2
#                                                                    #  DI62   3
#                               DI62                                 #  DI62   4
#                                                                    #  DI62   5
# ################################################################## #  DI62   6
SUBROUTINE DI62(H,S,R)#                                                 DI62   7
#                                                                       DI62   8
INTEGER S(4,4)#                        Symmetry matrix in twelfths      DI62   9
REAL    H(4)#                          (h,k,l,d)                        DI62  10
REAL    R(4)#                          Result vector                    DI62  11
INTEGER I,J#                           Indices                          DI62  12
#                                                                       DI62  13
DO I=1,4#                                                               DI62  14
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI62  15
R(I)=0.0#                              D                                DI62  16
DO J=1,4; R(I)=R(I)+H(J)*FLOAT(S(J,I))#                                 DI62  17
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI62  18
DO I=1,4; R(I)=R(I)/12.0#              From twelfths                    DI62  19
#                                                                       DI62  20
RETURN#                                                                 DI62  21
END#                                                                    DI62  22
systemheader:(DI63)#                   Multiply 4*4 matrices            DI63   1
# ################################################################## #  DI63   2
#                                                                    #  DI63   3
#                               DI63                                 #  DI63   4
#                                                                    #  DI63   5
# ################################################################## #  DI63   6
SUBROUTINE DI63(A,B,C)#                                                 DI63   7
#                                                                       DI63   8
INTEGER A(4,4)#                        4*4 matrix                       DI63   9
INTEGER B(4,4)#                        4*4 matrix                       DI63  10
INTEGER C(4,4)#                        4*4 matrix                       DI63  11
INTEGER I,J,L#                         Indices                          DI63  12
#                                                                       DI63  13
DO J=1,4#                                                               DI63  14
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI63  15
DO I=1,4#                                                               DI63  16
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  DI63  17
C(I,J)=0#                                                               DI63  18
DO L=1,4; C(I,J)=C(I,J)+B(I,L)*A(L,J)#                                  DI63  19
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  DI63  20
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI63  21
DO I=1,4; DO J=1,4; C(I,J)=C(I,J)/12#  Twelfths                         DI63  22
DO I=1,3; IF(C(I,4)<0) C(I,4)=C(I,4)+12# Make positive                  DI63  23
#                                                                       DI63  24
RETURN#                                                                 DI63  25
END#                                                                    DI63  26
systemheader:(DI64)#                   Test if equal matrices           DI64   1
# ################################################################## #  DI64   2
#                                                                    #  DI64   3
#                               DI64                                 #  DI64   4
#                                                                    #  DI64   5
# ################################################################## #  DI64   6
SUBROUTINE DI64(A,B,ANS)#                                               DI64   7
include:(AACOMN)#                                                       DI64   8
include:(DICOMN)#                                                       DI64   9
#                                                                       DI64  10
INTEGER A(4,4)#                        4*4 matrix                       DI64  11
INTEGER B(4,4)#                        4*4 matrix                       DI64  12
INTEGER ANS#                           0:no match/1: match              DI64  13
INTEGER I,J,L#                         Indices                          DI64  14
INTEGER IMATCH#                                                         DI64  15
INTEGER LATS,LATE#                                                      DI64  16
intdata:(LATES,[3,6,15,24,18,30,27])#                                   DI64  17
intdata:(LATSS,[1,1,7,13,13,25,22])#                                    DI64  18
intdata:(TLAT,[0,0,0,6,6,6,4,8,8,8,4,4,0,0,0,0,6,6,6,0,6,6,6,#          DI64  19
0,0,0,0,6,0,6])#                                                        DI64  20
datastuff:#                                                             DI64  21
#                                                                       DI64  22
LATS=LATSS(LTYP)#                                                       DI64  23
LATE=LATES(LTYP)#                                                       DI64  24
#                                                                       DI64  25
IMATCH=0#                                                               DI64  26
DO I=1,4; DO J=1,3; IF(A(I,J)==B(I,J)) IMATCH=IMATCH+1#                 DI64  27
#                                                                       DI64  28
IF(A(4,4)==B(4,4)) IMATCH=IMATCH+1#                                     DI64  29
#                                                                       DI64  30
#DO I=1,3; IF( MOD((A(I,4)-B(I,4)),12) == 0 ) IMATCH=IMATCH+1           DI64  31
FOR(L=LATS;L<=LATE;L=L+3)#             Translation part                 DI64  32
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI64  33
IF(( MOD(A(1,4)-B(1,4)-TLAT(L),12)   == 0 ) & $#                        DI64  34
   ( MOD(A(2,4)-B(2,4)-TLAT(L+1),12) == 0 ) & $#                        DI64  35
   ( MOD(A(3,4)-B(3,4)-TLAT(L+2),12) == 0 ))#                           DI64  36
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  DI64  37
IMATCH=IMATCH+3#                       Flag match                       DI64  38
BREAK#                                 Break out                        DI64  39
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  DI64  40
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI64  41
#                                                                       DI64  42
IF(IMATCH==16) ANS=yes:#               Match                            DI64  43
ELSE           ANS=no:#                No match                         DI64  44
#                                                                       DI64  45
RETURN#                                                                 DI64  46
END#                                                                    DI64  47
systemheader:(DI65)#                   Loads symdata i-c into 4*4       DI65   1
# ################################################################## #  DI65   2
#                                                                    #  DI65   3
#                               DI65                                 #  DI65   4
#                                                                    #  DI65   5
# ################################################################## #  DI65   6
SUBROUTINE DI65(A,IP)#                                                  DI65   7
include:(AACOMN)#                                                       DI65   8
#                                                                       DI65   9
INTEGER A(4,4)#                        4*4 matrix                       DI65  10
INTEGER IP#                            Pointer to qx array              DI65  11
REAL    S(4,4)#                        4*4 matrix                       DI65  12
INTEGER I,J#                                                            DI65  13
#                                                                       DI65  14
datastuff:#                                                             DI65  15
#                                                                       DI65  16
S(1,1)=QX(IP+1);S(1,2)=QX(IP+4);S(1,3)=QX(IP+7);S(1,4)=QX(IP+10)#       DI65  17
S(2,1)=QX(IP+2);S(2,2)=QX(IP+5);S(2,3)=QX(IP+8);S(2,4)=QX(IP+11)#       DI65  18
S(3,1)=QX(IP+3);S(3,2)=QX(IP+6);S(3,3)=QX(IP+9);S(3,4)=QX(IP+12)#       DI65  19
S(4,1)=0.0     ;S(4,2)=0.0     ;S(4,3)=0.0     ;S(4,4)=1.0# Load c      DI65  20
#                                                                       DI65  21
DO I=1,4; DO J=1,4; S(I,J)=-S(I,J)#    -c                               DI65  22
S(1,1)=1.0+S(1,1); S(2,2)=1.0+S(2,2)#                                   DI65  23
S(3,3)=1.0+S(3,3); S(4,4)=1.0+S(4,4)#  I-c                              DI65  24
DO I=1,4; DO J=1,4; A(I,J)=NINT(S(I,J)*12.0)# Convert into twelfths     DI65  25
#                                                                       DI65  26
RETURN#                                                                 DI65  27
END#                                                                    DI65  28
systemheader:(DI66)#                   Print matrix                     DI66   1
# ################################################################## #  DI66   2
#                                                                    #  DI66   3
#                               DI66                                 #  DI66   4
#                                                                    #  DI66   5
# ################################################################## #  DI66   6
SUBROUTINE DI66(A)#                                                     DI66   7
#                                                                       DI66   8
INTEGER A(4,4)#                        4*4 matrix                       DI66   9
INTEGER I#                                                              DI66  10
#                                                                       DI66  11
DO I=1,4; WRITE(6,1001) A(I,1),A(I,2),A(I,3),A(I,4)#                    DI66  12
1001      FORMAT(4(2X,I4))#                                             DI66  13
#                                                                       DI66  14
RETURN#                                                                 DI66  15
END#                                                                    DI66  16
systemheader:(DI67)#                   Inaccessible volumes             DI67   1
# ################################################################## #  DI67   2
#                                                                    #  DI67   3
#                               DI67                                 #  DI67   4
#                                                                    #  DI67   5
# ################################################################## #  DI67   6
SUBROUTINE DI67#                                                        DI67   7
include:(AACOMN)#                                                       DI67   8
include:(DICOMN)#                                                       DI67   9
#                                                                       DI67  10
INTEGER IQ,NL,IR,IS,NS,NB#                                              DI67  11
REAL    H(3),HQ(3),SHIFT,ARG,A,B,HRS(3)#                                DI67  12
realdata:(TWOPI,6.28318530718)#                                         DI67  13
#                                                                       DI67  14
chardata:(DI67A,[$#                                                     DI67  15
 DIVIDE WITH EXPECTATION VALUES /F/**2 CALCULATED FROM $#               DI67  16
INACCESSIBLE VOLUMES])#                                                 DI67  17
chardata:(DI67B,[$#                                                     DI67  18
 INACESSIBLE VOLUMES FROM PROGRAM =SHAPE=, FOURIER COEFFS $#            DI67  19
FROM =RFOURR=, FILE =ABCAL.HKL= FROM =DIVIDE(WRTABC)=])#                DI67  20
#                                                                       DI67  21
datastuff:#                                                             DI67  22
#                                                                       DI67  23
# READ EXTERNAL FOURIER COEFS                                           DI67  24
# ---------------------------                                           DI67  25
#                                                                       DI67  26
writeline:(1,DI67A,NDI67A,3,3)#                                         DI67  27
writeline:(0,DI67B,NDI67B,3,3)#                                         DI67  28
#                                                                       DI67  29
OPEN(UNIT=88,FILE='ABCAL.HKL',FORM='FORMATTED',STATUS='OLD')#           DI67  30
#                                                                       DI67  31
M5=M4; STEPM4=5#                       Set memory                       DI67  32
10 READ(88,FMT=*,END=99)H(1),H(2),H(3),A,B# Read in only non-zero       DI67  33
IF(A==0.0 & B==0.0) GOTO 10#           Reflections, read next           DI67  34
NB=M5#                                 1. position of current ref       DI67  35
FOR(IQ=M0;IQ<M2;IQ=IQ+nsymit:)#        Loop over all symops             DI67  36
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  DI67  37
HQ(1)  =  QX(IQ+1)*H(1)  + QX(IQ+2)*H(2)  + QX(IQ+3)*H(3)#              DI67  38
HQ(2)  =  QX(IQ+4)*H(1)  + QX(IQ+5)*H(2)  + QX(IQ+6)*H(3)#              DI67  39
HQ(3)  =  QX(IQ+7)*H(1)  + QX(IQ+8)*H(2)  + QX(IQ+9)*H(3)#              DI67  40
SHIFT  =  QX(IQ+10)*H(1) + QX(IQ+11)*H(2) + QX(IQ+12)*H(3)#             DI67  41
ARG    = -1.0*SHIFT*TWOPI#             Phase shift in 2pi               DI67  42
FOR(NS=NB;NS<M5;NS=NS+STEPM4)#         Check if ref already in list     DI67  43
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  DI67  44
IF(HQ(1)==h:(NS) & HQ(2)==k:(NS) & HQ(3)==l:(NS)) GOTO 15# Is there     DI67  45
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  DI67  46
incrqx:(M5,M5+STEPM4,DI6702)#          Expand qx                        DI67  47
NL=M5-STEPM4#                          Pointer                          DI67  48
h:(NL) =  HQ(1)#                                                        DI67  49
k:(NL) =  HQ(2)#                                                        DI67  50
l:(NL) =  HQ(3)#                                                        DI67  51
a:(NL)=(A*COS(ARG)-B*SIN(ARG))#                                         DI67  52
b:(NL)=(A*SIN(ARG)+B*COS(ARG))#                                         DI67  53
#                                                                       DI67  54
IF(ICNT==0)#                           Add friedel for acentric         DI67  55
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  DI67  56
FOR(NS=NB;NS<M5;NS=NS+STEPM4)#         Check if friedel already in li   DI67  57
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  DI67  58
IF(-HQ(1)==h:(NS) & -HQ(2)==k:(NS) & -HQ(3)==l:(NS)) GOTO 15#           DI67  59
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  DI67  60
incrqx:(M5,M5+STEPM4,DI6702)#          Expand qx                        DI67  61
NL=M5-STEPM4#                          Pointer                          DI67  62
h:(NL) =  -h:(NL-STEPM4)#                                               DI67  63
k:(NL) =  -k:(NL-STEPM4)#                                               DI67  64
l:(NL) =  -l:(NL-STEPM4)#                                               DI67  65
a:(NL)=    a:(NL-STEPM4)#                                               DI67  66
b:(NL)=   -b:(NL-STEPM4)#                                               DI67  67
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  DI67  68
15 CONTINUE#                           Branch in, ref already there     DI67  69
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  DI67  70
GOTO 10#                               Read next                        DI67  71
99 CONTINUE#                           Finished reading                 DI67  72
CLOSE(88)#                                                              DI67  73
#                                                                       DI67  74
# LOOP OVER DATA SET                                                    DI67  75
# ------------------                                                    DI67  76
#                                                                       DI67  77
FOR(NR=M2;NR<M3;NR=NR+nrefit:)#        Loop over reflections            DI67  78
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  DI67  79
IF(ovlg:==0) NEXT#                     Only overlapping ones            DI67  80
gethkl:(NR+1,H)#                       Unpack h, k, l                   DI67  81
#                                                                       DI67  82
# DOUBLE SUM OVER SYMOPS                                                DI67  83
#                                                                       DI67  84
A=0.0; B=0.0#                                                           DI67  85
FOR(IR=M0;IR<M2;IR=IR+nsymit:)#        Loop over all symops             DI67  86
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  DI67  87
FOR(IS=M0;IS<M2;IS=IS+nsymit:)#        Loop over all symops             DI67  88
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  DI67  89
HRS(1)=(QX(IR+1)-QX(IS+1))*H(1)$#      (h,k,l)*(rot(r)-rot(s))          DI67  90
     + (QX(IR+2)-QX(IS+2))*H(2)$#                                       DI67  91
     + (QX(IR+3)-QX(IS+3))*H(3)#                                        DI67  92
HRS(2)=(QX(IR+4)-QX(IS+4))*H(1)$#                                       DI67  93
     + (QX(IR+5)-QX(IS+5))*H(2)$#                                       DI67  94
     + (QX(IR+6)-QX(IS+6))*H(3)#                                        DI67  95
HRS(3)=(QX(IR+7)-QX(IS+7))*H(1)$#                                       DI67  96
     + (QX(IR+8)-QX(IS+8))*H(2)$#                                       DI67  97
     + (QX(IR+9)-QX(IS+9))*H(3)#                                        DI67  98
SHIFT =(QX(IR+10)-QX(IS+10))*H(1)$#                                     DI67  99
     + (QX(IR+11)-QX(IS+11))*H(2)$#                                     DI67 100
     + (QX(IR+12)-QX(IS+12))*H(3)#                                      DI67 101
ARG=SHIFT*TWOPI#                                                        DI67 102
#                                                                       DI67 103
# 	SUM UP                                                          DI67 104
#                                                                       DI67 105
IF(HRS(1)==0.0 & HRS(2)==0.0 & HRS(3)==0.0)# (0,0,0) index              DI67 106
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  DI67 107
A=A+1.0*COS(ARG)#                      Assume normalization of          DI67 108
B=B+1.0*SIN(ARG)#                      Elec. density is properly done   DI67 109
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  DI67 110
ELSE#                                  Search index hrs in external     DI67 111
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  DI67 112
FOR(NL=M4;NL<M5;NL=NL+STEPM4)#         Loop external fourier coeef      DI67 113
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 DI67 114
IF(HRS(1)==h:(NL) & HRS(2)==k:(NL) & HRS(3)==l:(NL))#                   DI67 115
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 DI67 116
A=A+(a:(NL)*COS(ARG)-b:(NL)*SIN(ARG))#                                  DI67 117
B=B+(a:(NL)*SIN(ARG)+b:(NL)*COS(ARG))#                                  DI67 118
GOTO 100#                                                               DI67 119
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 DI67 120
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 DI67 121
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  DI67 122
100 CONTINUE#                          Reflection found                 DI67 123
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  DI67 124
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  DI67 125
IF(B!=0.0)WRITE(6,*)'WARNING INACCESSIBLE VOLUMES (HKL)=',$#            DI67 126
NINT(H(1)),NINT(H(2)),NINT(H(3))#                                       DI67 127
IF(B!=0.0)WRITE(6,*)'WARNING INACCESSIBLE VOLUMES A=',A#                DI67 128
IF(B!=0.0)WRITE(6,*)'WARNING INACCESSIBLE VOLUMES B=',B#                DI67 129
temp:(NR)=A#                           Store expectation value          DI67 130
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  DI67 131
#                                                                       DI67 132
FOR(NR=M2;NR<M3;NR=NR+nrefit:) acal:(NR)=temp:(NR)#                     DI67 133
#                                                                       DI67 134
RETURN#                                                                 DI67 135
END#                                                                    DI67 136
systemheader:(ERRM)#                                                    ERRM   1
##                                                                      ERRM   2
## ERROR MESSAGES FOR FILE ERRMES                                       ERRM   3
## ------------------------------                                       ERRM   4
##                                                                      ERRM   5
##         DIVIDE    *****DI*****                                       ERRM   6
## DI2001 Insufficient memory is available for the I/O BUFFER and       ERRM   7
## DI2001 all the reflection items in QX array.                         ERRM   8
## DI2002 Data set           is missing from lrexpl: IDN=1.             ERRM   9
## DI2003 Wavelength         is missing from lrexpl: IDN=2.             ERRM  10
## DI2004 Sort order         is missing from lrexpl: IDN=12.            ERRM  11
## DI2005 Scale group numbers are missing from lrexpl: IDN=100.         ERRM  12
## DI2006 Some of the following items are missing from lrdsetl:         ERRM  13
## DI2006 max h, max k, max l, min/max sin(theta)/lambda.               ERRM  14
## DI2007 Miller indices    are missing from lrrefl: IDN=1.             ERRM  15
## DI2008 Sin(theat)/lambda  is missing from lrrefl: IDN=2.             ERRM  16
## DI2009 Refl. multiplicity is missing from lrrefl: IDN=3.             ERRM  17
## DI2011 LRREFL: IDN=1302         is missing.                          ERRM  18
## DI2012 LRREFL: IDN=1302 or 1801 is missing.                          ERRM  19
## DI2013 LRREFL: IDN=1302 or 1801 or 1600 is missing.                  ERRM  20
## DI2014 LRREFL: IDN=1302 or 1800 is missing.                          ERRM  21
## DI2015 LRREFL: IDN=1302 or 1800 or 1910 is missing.                  ERRM  22
## DI2016 LRREFL: IDN=1302 or 1604 is missing.                          ERRM  23
## DI2017 LRREFL: IDN=1302 or 1605 is missing.                          ERRM  24
## DI2018 LRSYMM: PKT 1            is missing.                          ERRM  25
## DI2019 Insufficient memory is available for all the symops           ERRM  26
## DI2020 No cell content                                               ERRM  27
## DI2021 LRREFL: IDN=1302, 1801 or 1802 is missing.                    ERRM  28
## DI3001 Insufficient memory is available for the INDEX table in QX.   ERRM  29
## DI3002 Sum of intensities of overlapping reflections in a cluster    ERRM  30
## DI3002 is NEGATIVE.                                                  ERRM  31
## DI5001 Insufficient memory is available for I/O buffer.              ERRM  32
## DI5002 Requested item is not present on bdf.                         ERRM  33
## DI5501 Requested items are not present on bdf.                       ERRM  34
## DI6001 Symmetry elements do not build a group.                       ERRM  35
## DI6701 Index for double summation is not present in data set.        ERRM  36
## DI6702 Not enough memory available for external Fourier coefs.       ERRM  37
##                                                                      ERRM  38
pmacro:([no:])#                        Purge xtal system macros         ERRM  39
#                                                                       ERRM  40
