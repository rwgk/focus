systemheader:(AA    )#                                                  AA     1
##*****************************************************************##   AA     2
##                    The XTAL System.                             ##   AA     3
## Software for Crystallographic Structure Solution and Refinement.##   AA     4
## Copyright (C) 2000  The University of Western Australia.        ##   AA     5
##     email  xtal@crystal.uwa.edu.au                              ##   AA     6
##     web    http://xtal.crystal.uwa.edu.au/                      ##   AA     7
##                                                                 ##   AA     8
## Distributed under the GNU General Public Licence as published by##   AA     9
## the Free Software Foundation, in the hope that it will be useful##   AA    10
## but WITHOUT ANY WARRANTY. See the GNU General Public License    ##   AA    11
## for more details.                                               ##   AA    12
##                                                                 ##   AA    13
##                    XTAL NUCLEUS ROUTINES                        ##   AA    14
##                                                                 ##   AA    15
##*****************************************************************##   AA    16
#                                                                       AA    17
include:(XMACRO)#                                                       AA    18
#                                                                       AA    19
macro:(call:,[IF(PROGID=='      ')$(PRGLST(PNTPRG^PNTPRG+6)="$2";$#     AA    20
                PNTPRG=PNTPRG+7$);ELSE IF(PROGID=="$2")CALL $100])#     AA    21
macro:(xxxx:,)#                                                         AA    22
#                                                                       AA    23
systemheader:(AA00)#                   Program scheduler                AA00   1
######################################################################  AA00   2
##                                                                   #  AA00   3
##                              AA00                                 #  AA00   4
##                                                                   #  AA00   5
######################################################################  AA00   6
PROGRAM XTAL#                          S.r.hall oct 89                  AA00   7
ifsel:(MSNT)#                          Win nt f90 includes              AA00   8
USE DFPORT ; USE DFLIB#                Include extras                   AA00   9
ifsel:#                                                                 AA00  10
INTEGER LNBLNK#                        External function                AA00  11
endsel:#                               End of f90 includes              AA00  12
include:(AACOMN)#                                                       AA00  13
#                                                                       AA00  14
localstart:#                           Call local o/s if needed         AA00  15
initcom:#                              System common initialization     AA00  16
##                                                                      AA00  17
##    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++      AA00  18
##    +                                                          +      AA00  19
##    +  These are the programs that are running in the current  +      AA00  20
##    +  version of the XTAL system. Programs not required at    +      AA00  21
##    +  your installation should be disabled by replacing the   +      AA00  22
##    +  "call:" with a "xxxx:" macro. Please note that some of  +      AA00  23
##    +  programs listed here may not be supplied. These will    +      AA00  24
##    +  be flagged as follows on the right hand side.           +      AA00  25
##    +                                                          +      AA00  26
##    +        <<<  new development -- should be supplied        +      AA00  27
##    +        ***  new development -- may not be supplied       +      AA00  28
##    +        ftp  available from 130.95.232.12 dir /xtalmm     +      AA00  29
##    +                                                          +      AA00  30
##    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++      AA00  31
##                                                                      AA00  32
REPEAT#                                Loop until finished & stop       AA00  33
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA00  34
ifsel:(SLPC)#                                                           AA00  35
PRINT*,TIME@(),' Starting ',PROGID#                                     AA00  36
endsel:#                                                                AA00  37
#                                                                       AA00  38
select:(version:)#                     Select on version                AA00  39
ifsel:(3.7)#                                                            AA00  40
call:(AB,ABSORB)## Gaussian/Anal/Spher absorpt correction/              AA00  41
call:(AD,ADDATM)## atom parameter loader                 /              AA00  42
call:(AP,ADDPAT)## add powder pattern to binary file     / ***          AA00  43
call:(AR,ADDREF)## input of reflection data into bdf     /              AA00  44
call:(AT,ATABLE)## table of atom params for publication  /              AA00  45
call:(AX,LSLS  )## Lausanne least squares refinement     /              AA00  46
call:(AY,LSRES )## Lausanne ls restraint editor          /              AA00  47
call:(AZ,LSABS )## Lausanne absorption                   /              AA00  48
call:(BN,BONDLA)## bond lengths and angles               /              AA00  49
call:(BT,BONDAT)## gen of bonded atoms from geometry     /              AA00  50
call:(BU,BUNYIP)## search for additional symmetry        /              AA00  51
call:(BY,BAYEST)## posterior Bayesian statistics         /              AA00  52
call:(CB,CBAZA )## Crystal based azimuthal psi angle NEW /              AA00  53
call:(CF,CIFIO )## generate and read CIF archive & publ. /              AA00  54
call:(CG,CHARGE)## calculate atomic charges              /              AA00  55
call:(CI,CIFENT)## special version of CIFIO for difrac   /              AA00  56
call:(CN,CONTRS)## contour Fourier maps                  /              AA00  57
call:(CL,CRILSQ)## crystallographic least-squares NEW    /              AA00  58
call:(CP,CRISP )## iterated phase solution package NEW   /              AA00  59
call:(CR,CRYLSQ)## crystallographic least-squares        /              AA00  60
call:(CU,CREDUC)## cell reduction and twin laws          /              AA00  61
call:(DI,DIVIDE)## Michael Estermann's program           / ***          AA00  62
call:(DD,DIFDAT)## translate diffractometer tapes        /              AA00  63
call:(FB,RFOURR)## reverse fourier transform             /              AA00  64
call:(FC,FC    )## structure factor calculation          /              AA00  65
call:(FE,REGFE )## crystallographic functions & errors   /              AA00  66
call:(FR,RMAP  )## map R-factors for translated fragment /              AA00  67
call:(FS,FOURR )## fourier transf b-l and fft            /              AA00  68
call:(GE,GENEV )## evaluation of normalized s.f.         /              AA00  69
call:(GS,GENSIN)## generate structure invariants         /              AA00  70
call:(GT,GENTAN)## tangent formula generation            /              AA00  71
xxxx:(RV,GIP   )## Graphical refln property viewing NEW  /              AA00  72
call:(LC,LATCON)## cell parameters from 2-theta values   /              AA00  73
call:(LF,LISTFC)## list structure factors for publication/              AA00  74
call:(LS,LSQPL )## least-squares planes and lines        /              AA00  75
call:(MH,MODHKL)## modify reflection data on bdf         /              AA00  76
call:(ML,MODEL )## search peak sites for connections     /              AA00  77
call:(MP,MAPLST)## dump Fourier map as ascii numbers     /              AA00  78
call:(NC,NEWCEL)## transforms bdf data to a new cell     /              AA00  79
call:(NM,NEWMAN)## Newman projection of molecular frags  /              AA00  80
call:(OR,ORTEP )## Oak Ridge thermal ellipsoid plot      /              AA00  81
xxxx:(PA,PREABS)## Pre absorb graphical crystal modelling/              AA00  82
call:(PB,PREPUB)## DVN check cifs prior to publication   /              AA00  83
call:(PE,PATSEE)## Patterson rot and tran search for     /              AA00  84
xxxx:(PG,PIG   )## portable interactive graphics         /              AA00  85
call:(PN,PARTN )## pseudo atom fragment map              /              AA00  86
xxxx:(PO,POWGEN)## Graphically examine powder patterns   / ***          AA00  87
call:(PP,PEKPIK)## search fourier map for max/minima     /              AA00  88
xxxx:(PV,PREVUE)## check & manipulate atom labels in plot/              AA00  89
xxxx:(PW,PLTPAT)## create plot graphic from powder       / ***          AA00  90
xxxx:(PX,PLOTX )## plotter interface using local software/              AA00  91
call:(RB,RIGBOD)## rigid group transform                 /              AA00  92
call:(RE,REFM90)## read and write SCFS-90 file           /              AA00  93
call:(RF,REFCAL)## process diffractometer data           /              AA00  94
call:(RS,RSCAN )## scan various reflection r-factors     /              AA00  95
xxxx:(RT,RIETVD)## Rietveld refinement powder            / ***          AA00  96
call:(RW,REGWT )## Regina least squares weights          /              AA00  97
call:(SH,SHELIN)## read and execute Shelx input line     /              AA00  98
call:(SI,SIMPEL)## symbolic addition phasing procedure   /              AA00  99
call:(SL,SLANT )## produce general section Fourier maps  /              AA00 100
call:(SP,SHAPE )## Michael Estermann's Patterson analysis/              AA00 101
call:(SR,SORTRF)## sort reflections in bdf on f,f2,int   /              AA00 102
call:(SX,STARTX)## ab-initio binary data file builder    /              AA00 103
call:(VU,VUBDF )## view contents of the bdf              /              AA00 104
call:(XT,XTINCT)## extinction coeff from measured data   /              AA00 105
##                                                                      AA00 106
##    Below are Xtal3.2 routines which are no longer supported          AA00 107
##    in Xtal3.4. However, the latest sources may be obtained by        AA00 108
##    anonymous ftp 130.95.232.12 directory /xtalmm. Documentation      AA00 109
##    for these calculations may be obtained by sending US$50           AA00 110
##    to "Xtal Coordinator, Crystallography, UWA, Nedlands 6907         AA00 111
##    Australia".                                                       AA00 112
##                                                                      AA00 113
xxxx:(AL,ADDMUL)## add XENGEN area detector data to bdf  /              AA00 114
xxxx:(AM,APMASK)## apply density solvent flattening mask /              AA00 115
xxxx:(AS,ABSCAL)## phi spin absorp, scale, int correction/              AA00 116
xxxx:(BF,BFOURR)## Fourier coefficients for proteins     /              AA00 117
xxxx:(CD,CEDAR )## energy & dynamics cryst. refinement   /              AA00 118
xxxx:(CQ,CRITIQ)## cull mul reflection inten data        /              AA00 119
xxxx:(CV,CONVOL)## adjust Fourier coeffs for convolution /              AA00 120
xxxx:(EB,EDTBDF)## edit the bdf contents                 /              AA00 121
xxxx:(FD,FODIFF)## difference between two Fourier maps   /              AA00 122
xxxx:(FG,FOGNU )## generate density maps from a cell     /              AA00 123
xxxx:(FL,FOLOAD)## load Fourier map from external source /              AA00 124
xxxx:(FM,FOMERG)## merge Fourier maps of part structure  /              AA00 125
xxxx:(FO,FOGEN )## generate any vol from an asym unit map/              AA00 126
xxxx:(FT,FOSTAT)## statistics on fo map densities        /              AA00 127
xxxx:(KB,FINDKB)## protein least squares scale and t.f.  /              AA00 128
xxxx:(MA,MEPHAS)## max entropy phasing based on E.Prince /              AA00 129
xxxx:(MB,MAKBRK)## make file to connect FOURR to FRODO   /              AA00 130
xxxx:(MD,MERGDS)## add or replace a protein data set     /              AA00 131
xxxx:(ME,MEDENS)## maximum entropy phase refinement      /              AA00 132
xxxx:(MF,MEFFIT)## restore f values after MEDENS run     /              AA00 133
xxxx:(MI,MIR   )## mult isomorph replacement phase       /              AA00 134
xxxx:(MM,MKMASK)## make solvent density flattening mask  /              AA00 135
xxxx:(MN,MOGIN )## generate MOGLI iput file from bdf     /              AA00 136
xxxx:(MO,MERGOB)## merge two multiple observ. bdf        /              AA00 137
xxxx:(MR,MERUN )## set up control lines for MEDENS/MEFFIT/              AA00 138
xxxx:(MS,MESTAR)## Initialise phases. E.g. for MEPHAS run/              AA00 139
xxxx:(MT,MIND  )## output atom sites for MindTool        /              AA00 140
xxxx:(MU,MULIST)## listings of mult observation data     /              AA00 141
xxxx:(MV,MOLVU )## prepare input for MolView (Cense)     /              AA00 142
xxxx:(NI,NICNAK)## Nicolet raw data tape processor       /              AA00 143
xxxx:(PC,PRECED)## preliminary data loading for CEDAR    /              AA00 144
xxxx:(PD,PROATM)## load protein databank atomic param.s  /              AA00 145
xxxx:(PF,PERFAC)## estimate monochromator perf factor    /              AA00 146
xxxx:(PH,PHONYD)## generate idealised fc error distrib.  /              AA00 147
xxxx:(PI,PEAKIN)## sets idealised sites for use in MODEL /              AA00 148
xxxx:(PS,PHACMP)## compare phases of two phase sets      /              AA00 149
xxxx:(PT,PLOT  )## plotter interface using local hardware/              AA00 150
xxxx:(QD,PRODIR)## (Stewart)                             /              AA00 151
xxxx:(QE,PROELD)## density map from atom data (Stewart)  /              AA00 152
xxxx:(QF,PROLSQ)## Konnert-Hendrickson restrained sfls   /              AA00 153
xxxx:(QN,PROTIN)## Konnert-Hendrickson restraint builder /              AA00 154
xxxx:(RC,RCALC )## calculate R-factors between bdf items /              AA00 155
xxxx:(RM,REMSET)## remove a complete data set from bdf   /              AA00 156
xxxx:(RV,REVIEW)## review of structure invariants        /              AA00 157
xxxx:(SC,SCALE1)## scale non-intersecting data sets      /              AA00 158
xxxx:(SM,SIMWGT)## combine Sim wts with Hend-Latt coeffs /              AA00 159
xxxx:(SK,SKLOUT)## generate Schakal input line file      /              AA00 160
xxxx:(VF,VUFILE)## view contents of any line file        /              AA00 161
xxxx:(WI,WEAKIN)## select weak-int reflns  (Stewart)     /              AA00 162
#                                                                       AA00 163
#                                                                       AA00 164
ifsel:(_GX)#                           If xtal_gx selected              AA00 165
call:(AD,ADDATM)## atom parameter loader                 /              AA00 166
call:(BN,BONDLA)## bond lengths and angles               /              AA00 167
call:(BU,BUNYIP)## search for additional symmetry        /              AA00 168
call:(CF,CIFIO )## generate and read CIF archive & publ. /              AA00 169
call:(CU,CREDUC)## cell reduction and twin laws          /              AA00 170
call:(LS,LSQPL )## least-squares planes and lines        /              AA00 171
call:(NM,NEWMAN)## Newman projection of molecular frags  /              AA00 172
call:(OR,ORTEP )## Oak Ridge thermal ellipsoid plot      /              AA00 173
call:(PG,PIG   )## portable interactive graphics         /              AA00 174
call:(PV,PREVUE)## check & manipulate atom labels in plot/              AA00 175
call:(PX,PLOTX )## plotter interface using local software/              AA00 176
call:(SH,SHELIN)## read and execute Shelx input line     /              AA00 177
call:(SX,STARTX)## ab-initio binary data file builder    /              AA00 178
endsel:#                               End of version selection         AA00 179
select:(compiler:)#                    Reselect on compiler             AA00 180
initprg:#                                                               AA00 181
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA00 182
END#                                                                    AA00 183
systemheader:(AA01)#                   Process input lines              AA01   1
######################################################################  AA01   2
##                                                                   #  AA01   3
##                              AA01 (used in readline:)             #  AA01   4
##                                                                   #  AA01   5
######################################################################  AA01   6
SUBROUTINE AA01(LIST,NLIST)#                                            AA01   7
include:(AACOMN)#                      Hall,holden,stewart 1978         AA01   8
#                                      Hall oct 1989                    AA01   9
#acro:(owncolmap:,CALL XCOLMP(1))#     Use a private colormap           AA01  10
#acro:(comcolmap:,CALL XCOLMP(0))#     Use a shared colormap            AA01  11
macro:(owncolmap:,              )#     Use a private colormap           AA01  10
macro:(comcolmap:,              )#     Use a shared colormap            AA01  11
INTEGER I,J,K,L,M,N,NLIST,NC#                                           AA01  12
string:(TEMP(2),3);   string:(EXT,3)#                                   AA01  13
string:(LIST,*);      string:(NAME,6)#                                  AA01  14
chardata:(A011, SETID ORDER COPYBD FIELD RESET MASTER COMPID $#         AA01  15
TITLE REMARK FINISH )#                                                  AA01  16
chardata:(A012,' Unrecognised input line......')#                       AA01  17
chardata:(A013, *****AB)#                                               AA01  18
chardata:(A014,PRI COM ALL PST CMA LMA CPI LPI INP PRT PCH$#            AA01  19
 LIN DAC ERR )#                                                         AA01  20
chardata:(A015,' Echo input...')#                                       AA01  21
chardata:(A016,' >>> copy bdf  xxxxxx.xxx -->  xxxxxx.xxx')#            AA01  22
chardata:(A017," *reset*  DEVICES inp prt pch lin dac err  $#           AA01  23
PRINTER stat ch/ln ln/pg ch/in ln/in")#                                 AA01  24
chardata:(A018,NO YE RE WR )#                                           AA01  25
realdata:(FMT,[550213.,610313.,670313.,730313.,790313.])#               AA01  26
realdata:(FM2,[210213.,250313.,290313.,330313.,370313.,410313.])#       AA01  27
datastuff:#                                                             AA01  28
#                                                                       AA01  29
REPEAT#                                General read loop                AA01  30
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA01  31
IF(LINFLG>0)#                          Test if this is a new read       AA01  32
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA01  33
REPEAT#                                Read input image loop            AA01  34
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA01  35
linein:(ioinp:,CHRIP,CHRMAX,CHREOF)#   Input line image from stdin      AA01  36
NIMAG=NIMAG+1#                         Count images entered             AA01  37
IF(PPRIOR>=5)#                         Test for diagnostic dump         AA01  38
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA01  39
movechar:(A015,1,CHROT,1,NA015,0)#     Put echo mess into buffer        AA01  40
movechar:(CHRIP,1,CHROT,15,mxcout:-15,0)# Put image into buffer         AA01  41
L=LINRM#                               Save line room counter           AA01  42
writeline:(0,0,0,1,5) ; LINRM=L#       Output encoded image             AA01  43
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA01  44
IF((CHRMAX<=1\CHRIP(1^1)==':'\CHRIP(1^1)=='#')&CHREOF==0)NEXT# Blank    AA01  45
IF(CHREOF==0)  BREAK#                  Exit if eof not detected         AA01  46
IF(ioinp:==IOIN2) GOTO 100#            If normal read signal error      AA01  47
closefmt:(ioinp:)#                     Close current line ip device     AA01  48
ioinp:=IOIN2#                          Otherwise reset line in device   AA01  49
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA01  50
CHRIN=' '#                             Blank out the input buffer       AA01  51
upcase:(CHRIP,CHRIN,CHRMAX)#           Convert to upper case            AA01  52
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA01  53
DO CHRCOL=1,CHRMAX; IF(CHRIN(CHRCOL^CHRCOL)==' ')BREAK# First blank     AA01  54
NC=MIN(6,CHRCOL-1)#                    Set length of line code found    AA01  55
LINID=0#                               Reset line id number             AA01  56
#                                                                       AA01  57
#   IS THIS A SYSTEM LINE?                                              AA01  58
#   ---------------------                                               AA01  59
#                                                                       AA01  60
FOR(I=1;I<=NA011&NC>4;I=I+1)#          Loop over 'system' list          AA01  61
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA01  62
IF(A011(I^I)==' ') NEXT#               Skip leading blanks              AA01  63
FOR(J=I+1;J<=NA011;J=J+1)#             Loop over name string            AA01  64
IF(A011(J^J)==' ') BREAK#              Find trailing blank              AA01  65
LINID=LINID+1#                         Count each name on list          AA01  66
IF(J-I==NC&A011(I^J-1)==CHRIN(1^NC)) BREAK# Exit if names same          AA01  67
I=J#                                   Reset list pointer               AA01  68
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA01  69
IF(I>NA011) LINID=0#                   Reset if name not found          AA01  70
100 CONTINUE#                          Eof branchpoint                  AA01  71
IF(CHREOF!=0)     LINID=10#            Eof is equivalent to a finish    AA01  72
#                                                                       AA01  73
IF(LINID!=0)#                          Has system name been found       AA01  74
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA01  75
IF(LINID<8)#                           Decode system lines              AA01  76
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA01  77
J=FIELDF;   FIELDF=0#                  Protect field flags              AA01  78
dcodefld:#                             Actually interpret line          AA01  79
FIELDF=J#                              Restore the field flag           AA01  80
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA01  81
#                                                                       AA01  82
IF(LINID==1)#                          *********** setid **********     AA01  83
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA01  84
IF(BUFIN(1)<voidflg:)#                 Chars in field one?              AA01  85
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA01  86
stringlim:(1,K,J)#                     Get string limits                AA01  87
NC=MIN(J-K,6); SETIDF=0; L=ABS(NLIST)# Reset line id number             AA01  88
FOR(I=1;I<=L;I=I+1)#                   Loop over 'system' list          AA01  89
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA01  90
IF(LIST(I^I)==' ') NEXT#               Skip leading blanks              AA01  91
FOR(J=I+1;J<=L;J=J+1)#                 Loop over name string            AA01  92
IF(LIST(J^J)==' ') BREAK#              Find trailing blank              AA01  93
SETIDF=SETIDF+1#                       Count each name on list          AA01  94
IF(J-I==NC&LIST(I^J-1)==CHRIN(K^K+NC-1)) BREAK# Exit if names same      AA01  95
I=J#                                   Reset list pointer               AA01  96
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA01  97
IF(I>L)  iquit:(AA0105)#               Unknown setid name               AA01  98
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA01  99
ELSE SETIDF=0#                         Reset flag for blank setid       AA01 100
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA01 101
#                                                                       AA01 102
ELSE IF(LINID==2)#                     *********** order ***********    AA01 103
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA01 104
DO K=1,mxfdim:#                        Loop over possible fields        AA01 105
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 AA01 106
IF(BUFIN(K)>0.0)#                      Test if order entered and        AA01 107
BUFORD(K)= NINT(BUFIN(K))#             Deposit in buford array          AA01 108
ELSE  BUFORD(K)=K#                     Default order instead            AA01 109
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 AA01 110
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA01 111
#                                                                       AA01 112
ELSE IF(LINID==3)#                     *********** copybdf *********    AA01 113
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 AA01 114
DO M=1,2#                              Loop over two input fields       AA01 115
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 AA01 116
N=K;   K=IOUNIT(M+6)#                  Set copy device number           AA01 117
TEMP(M)=FILEXT(K)#                     Save current file extension      AA01 118
ifvo:(BUFIN(M)) iquit:(AA0104)#        Missing extension code           AA01 119
IF(BUFIN(M)>=0.)ncodefld:(BUFIN,M,FILEXT(K),30333.,1)# Format ext       AA01 120
ELSE#                                  Ext as char string               AA01 121
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 15 AA01 122
stringlim:(M,I,J);   L=0#              Get limits of filename ext       AA01 123
IF(CHRIN(I^J)=='A ') L=1#              Test for archive bdf a           AA01 124
IF(CHRIN(I^J)=='B ') L=2#              Test for archive bdf b           AA01 125
IF(L>0) FILEXT(K)=FILEXT(IOUNIT(L))#   Set arc bdf                      AA01 126
ELSE    FILEXT(K)=CHRIN(I^J-1)#        Store filename ext               AA01 127
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 15 AA01 128
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 AA01 129
copybdf:(N,K)#                         Copy file1 to file2              AA01 130
movechar:(FILENM(N),1,A016,16,10,0)#   Put filename in message          AA01 131
movechar:(FILENM(K),1,A016,32,10,0)#   Put filename in message          AA01 132
writeline:(1,A016,NA016,2,3)#          Print the copy message           AA01 133
FILEXT(N)=TEMP(1);  FILEXT(K)=TEMP(2)# Reset bdf extensions             AA01 134
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 AA01 135
#                                                                       AA01 136
ELSE IF(LINID==4)#                     *********** field ***********    AA01 137
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16 AA01 138
IF(BUFIN(1)<=0.0) FIELDF=0#            Blank turn off field flag        AA01 139
ELSE#                                  Otherwise                        AA01 140
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 17 AA01 141
FIELDF=1#                              Turn on the field flag           AA01 142
DO K=1,mxfdim:#                        Loop over nonblank fields        AA01 143
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 18 AA01 144
BUFPNT(K)=mxchim:#                     Reset field limits to max        AA01 145
IF(BUFIN(K)>0.)#                       Is value entered for field       AA01 146
BUFPNT(K)= NINT(BUFIN(K))#             Insert column position           AA01 147
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 18 AA01 148
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 17 AA01 149
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 16 AA01 150
#                                                                       AA01 151
ELSE IF(LINID==5)#                     ************* reset *********    AA01 152
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 19 AA01 153
FOR(I=1;I>0;I=I+1)#                    Loop over input fields           AA01 154
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 20 AA01 155
ifvo:(BUFIN(I)) BREAK#                 Exit on blank field              AA01 156
IF(BUFIN(I)>voidflg:) iquit:(AA0106)#  Character field expected         AA01 157
stringlim:(I,J,K)#                     Get string limits                AA01 158
compchar:(CHRIN,J,A014,1,3,4,NA014,K)# Search out the instruction       AA01 159
IF(K==0) iquit:(AA0107)#               Code not recognised              AA01 160
IF(K==1) owncolmap:#                   Use a private colormap           AA01 161
IF(K==2) comcolmap:#                   Use a common shared colormap     AA01 162
IF(K<=2) NEXT#                         Do extra options                 AA01 163
IF(K==3)#                              Reset all io parameters          AA01 164
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 21 AA01 165
ioinp:=unitinp:;  IOIN2=unitinp:#      Store line input device number   AA01 166
ioprt:=unitprt:#                       Store printer device number      AA01 167
iopch:=unitpch:#                       Store punch device number        AA01 168
ioerr:=uniterr:#                       Store error file device number   AA01 169
iofm0:=unitfm0:#                       Store line device number 0       AA01 170
iofm1:=unitfm1:#                       Store line device number 1       AA01 171
iofm2:=unitfm2:#                       Store line device number 2       AA01 172
ioda1:=unitda1:#                       Store dir acc device number 1    AA01 173
ioda2:=unitda2:#                       Store dir acc device number 2    AA01 174
ioda3:=unitda3:#                       Store dir acc device number 3    AA01 175
#                                                                       AA01 176
prtstat:=3;       PPRIOR=3#            Set default print priority       AA01 177
prtcpin:=nchin:#                       Set default chars/inch           AA01 178
prtlpin:=nliin:#                       Set default lines/inch           AA01 179
prtcmax:=mxchln:#                      Set default max chars/line       AA01 180
prtlmax:=mxlnpg:#                      Set default max lines/page       AA01 181
NEXT#                                  Get next field                   AA01 182
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 21 AA01 183
I=I+1;  IF(BUFIN(I)<0.) iquit:(AA0108)# Number field expected           AA01 184
J=ioinp:#                              Store current line input dev     AA01 185
IF(K>3&K<9) IOSPEC(K-3)=NINT(BUFIN(I))# Reset printer specifications    AA01 186
ELSE#                                  Reset io device numbers          AA01 187
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 22 AA01 188
IF(BUFIN(I)<.5\BUFIN(I)>99.) iquit:(AA0130)# Illegal unit               AA01 189
IOUNIT(K)=NINT(BUFIN(I))#              Reset io device numbers          AA01 190
IF(K==9) IOIN2=J#                      Reset alternate line input dev   AA01 191
IF(K==11) iopch:=-iopch:#              Set punch as not opened          AA01 192
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 22 AA01 193
PPRIOR=prtstat:#                       Reset print priority             AA01 194
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 20 AA01 195
DO I=1,6#                              Loop over io device numbers      AA01 196
ncodefld:(FLOAT(IOUNIT(I+8)),1,CHROT,FM2(I),1)# Format dev number       AA01 197
DO I=1,5#                              Loop over printer specs          AA01 198
ncodefld:(FLOAT(IOSPEC(I)),1,CHROT,FMT(I),1)# Format printer specs      AA01 199
writeline:(1,A017,NA017,2,3)#          Print reset io values            AA01 200
writeline:(0,0,0,1,3)#                 Insert spacer                    AA01 201
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 19 AA01 202
#                                                                       AA01 203
ELSE IF(LINID==6)#                     *********** master **********    AA01 204
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 23 AA01 205
FOR(I=1;I>0;I=I+1)#                    Loop over input fields           AA01 206
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 24 AA01 207
ifvo:(BUFIN(I)) BREAK#                 Exit on first void               AA01 208
IF(BUFIN(I)>voidflg:) iquit:(AA0120)#  Illegal input on master          AA01 209
stringlim:(I,J,K)#                     Get string limits                AA01 210
compchar:(CHRIN,J,A018,1,2,3,NA018,K)# Find match with input string     AA01 211
IF(K==0) iquit:(AA0125)#               Illegal input string             AA01 212
IF(K==1)      MASTER=no:#              Set master status off            AA01 213
ELSE IF(K==2) MASTER=yes:#             Set master status on             AA01 214
ELSE#                                  Must be read/write extensions    AA01 215
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 25 AA01 216
I=I+1; ifvo:(BUFIN(I)) iquit:(AA0120)# Illegal construction             AA01 217
IF(BUFIN(I)>voidflg:) ncodefld:(BUFIN,I,EXT,30333.,1)# Format extensi   AA01 218
ELSE#                                  This is a character string       AA01 219
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 26 AA01 220
stringlim:(I,J,L); movechar:(CHRIN,J,EXT,1,3,0)# Store extension        AA01 221
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 26 AA01 222
IF(K==3) MASTIN=EXT#                   Save input master extension      AA01 223
ELSE     MASTOT=EXT#                   Save output master extension     AA01 224
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 25 AA01 225
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 24 AA01 226
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 23 AA01 227
#                                                                       AA01 228
ELSE IF(LINID==7)#                     ********** compid ***********    AA01 229
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 27 AA01 230
ifvo:(BUFIN(1)) COMPID='XTAL'#         Default compid is xtal           AA01 231
ELSE ifch:(BUFIN(1))#                  If a character string            AA01 232
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 28 AA01 233
stringlim:(1,I,J)#                     Get the compid string limits     AA01 234
COMPID=CHRIP(I^J-1)#                   Store compid as entered          AA01 235
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 28 AA01 236
ELSE#                                  Treat numbers as strings also    AA01 237
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 29 AA01 238
DO I=CHRCOL,CHRMAX;IF(CHRIP(I^I)!=' ')BREAK# Get first char             AA01 239
DO J=I,CHRMAX;     IF(CHRIP(J^J)==' ')BREAK# Get last char              AA01 240
IF (I<CHRMAX-6) COMPID=CHRIP(I^J)#     Store compid as entered          AA01 241
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 29 AA01 242
TITLE(9^14)=COMPID#                    Store compound id code           AA01 243
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 27 AA01 244
#                                                                       AA01 245
ELSE IF(LINID==8)#                     ************* title *********    AA01 246
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 30 AA01 247
TITLE(63^mxcout:)=CHRIP(7^CHRMAX)#     Store string in the title     
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30 AA01 249
#                                                                       AA01 250
ELSE IF(LINID==9)#                     ************ remark *********    AA01 251
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 31 AA01 252
movechar:(A013,1,CHRIP,1,6,0)#         Replace remark with ******       AA01 253
writeline:(0,CHRIP,CHRMAX,3,1)#        Print it at top priority         AA01 254
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 31 AA01 255
#                                                                       AA01 256
ELSE IF(LINID==10)#                    *********** finish **********    AA01 257
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 32 AA01 258
IF(LIST(1^6)=='PRGLST') iquit:(FINISH)# Exit if program line expected   AA01 259
LINID=0;  L=ABS(NLIST)#                Reset line id number             AA01 260
FOR(I=1;I<=L;I=I+1)#                   Loop over supplied line id's     AA01 261
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 33 AA01 262
IF(LIST(I^I)==' ') NEXT#               Skip leading blanks              AA01 263
FOR(J=I+1;J<=L;J=J+1)#                 Loop over name string            AA01 264
IF(LIST(J^J)==' ') BREAK#              Find trailing blank              AA01 265
LINID=LINID+1#                         Count each name on list          AA01 266
IF(LIST(I^J-1)=='END') BREAK#          Save posn of 'end' if present    AA01 267
I=J#                                   Reset list pointer               AA01 268
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 33 AA01 269
IF(I>L&NLIST>0) iquit:(AA0103)#        Go to quit if line missing       AA01 270
IF(I>L) LINID=0#                       End not found but continue       AA01 271
LINFLG=-1;   GOTO 200#                 Save the finish line for later   AA01 272
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 32 AA01 273
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA01 274
#                                                                       AA01 275
#    IS IMAGE ON THE SUPPLIED LIST?                                     AA01 276
#    -----------------------------                                      AA01 277
#                                                                       AA01 278
ELSE#                                  If system image not found        AA01 279
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 34 AA01 280
LINFLG=NLIST;   L=IABS(NLIST);  M=0#   Set reread flag from nlist       AA01 281
IF(SETIDF==no:)#                       If setid not in force            AA01 282
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 35 AA01 283
FOR(I=1;I<=L&NC>0;I=I+1)#              Loop over supplied line id's     AA01 284
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 36 AA01 285
IF(LIST(I^I)==' ') NEXT#               Skip leading blanks              AA01 286
FOR(J=I+1;J<=L;J=J+1)#                 Loop over name string            AA01 287
IF(LIST(J^J)==' ') BREAK#              Find trailing blank              AA01 288
LINID=LINID+1#                         Count each name on list          AA01 289
IF(J-I==NC&CHRIN(1^NC)==LIST(I^J-1)) BREAK# Exit if names same          AA01 290
IF('END'==LIST(I^J-1)) M=LINID#        Save posn of 'end' if present    AA01 291
I=J#                                   Reset list pointer               AA01 292
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 36 AA01 293
IF(I>L) LINID=0#                       Reset if name not found          AA01 294
IF(LINID==0&M>0)#                      Not found - was end sought?      AA01 295
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 37 AA01 296
NAME=CHRIN(1^NC)#                      Store program name id            AA01 297
compchar:(NAME,1,PRGLST,1,6,7,PNTPRG,N)# Is input line program id       AA01 298
IF(N>0)#                               Test if program id found         AA01 299
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 38 AA01 300
LINID=M;   LINFLG=-1;   GOTO 200#      Set id as end & keep input ima   AA01 301
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 38 AA01 302
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 37 AA01 303
IF(LINID==0&LINFLG>0)#                 No match of images               AA01 304
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 39 AA01 305
movechar:(CHRIP,1,CHROT,2,CHRMAX,0)#   Message and transfer name        AA01 306
writeline:(2,A012,NA012,2,1)#          Tell user bad news               AA01 307
iquit:(AA0110)#                        Now quit                         AA01 308
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 39 AA01 309
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 35 AA01 310
ELSE#                                  Setid is active                  AA01 311
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 40 AA01 312
CHRCOL=1; LINID=SETIDF#                Set match to id flag             AA01 313
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 40 AA01 314
IF(LINID>0)#                           Image sought found               AA01 315
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 41 AA01 316
LINFLG=1; dcodefld:#                   Decode image to bufin            AA01 317
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 41 AA01 318
BREAK#                                 Exit from name search            AA01 319
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 34 AA01 320
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA01 321
200 RETURN#                                                             AA01 322
END#                                                                    AA01 323
systemheader:(AA02)#                   Alphanumeric field decoder       AA02   1
######################################################################  AA02   2
##                                                                   #  AA02   3
##                              AA02 (used in dcodefld:)             #  AA02   4
##                                                                   #  AA02   5
######################################################################  AA02   6
SUBROUTINE AA02#                                                        AA02   7
include:(AACOMN)#                      Munn,holden,stewart,hall 78      AA02   8
#                                      G.s.d.king feb 89                AA02   9
INTEGER I,J,K,M,N,KEY,CODE,DLIM,FIRSTD,ITEN#                            AA02  10
REAL ANUM,SYGN,NULL,MANT#                                               AA02  11
chardata:(A021,[ 0123456789.-+*$,:=  ])#                                AA02  12
chardata:(A022,' Input image      has SYNTAX ERROR in col    chr   ')#  AA02  13
datastuff:#                                                             AA02  14
#                                                                       AA02  15
A021(NA021^NA021)=tabchr:#             Add horizontal tab character     AA02  16
NULL=voidflg:#                         Initialize null                  AA02  17
DLIM=0#                                Initialize delimitor flag        AA02  18
CODE=1;     FIRSTD=0#                  Initialize status code           AA02  19
ANUM=0.#                               Initialize number store          AA02  20
MANT=1.#                               Initialize mantissa              AA02  21
ITEN=0#                                Initialize after dp exponent     AA02  22
SYGN=+1.#                              Initialize sign flag             AA02  23
M=1#                                   Initialize field counter         AA02  24
movereal:(NULL,1,BUFIN,1,mxfdim:,2)#   Initialize fl. pt. buffer        AA02  25
#                                                                       AA02  26
FOR(N=CHRCOL;N<=CHRMAX+1;N=N+1)#       Scan each column in input        AA02  27
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA02  28
IF(N>CHRMAX) KEY=1#                    Force trailing blank at eor      AA02  29
ELSE KEY=INDEX(A021,CHRIN(N^N))#       Is this character 'digit' chr    AA02  30
IF(KEY==NA021)KEY=1#                   Treat tab char as a space        AA02  31
#                                                                       AA02  32
IF(KEY==1&CODE==1) NEXT#               Skip over leading blanks         AA02  33
#                                                                       AA02  34
IF(KEY==1&CODE>1) DLIM=1#              ( )blank key tested              AA02  35
#                                                                       AA02  36
ELSE IF(KEY>=2&KEY<=11)#               (0-9)number key tested           AA02  37
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA02  38
IF(CODE==1)#                           Signal first digit               AA02  39
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA02  40
CODE=2;     FIRSTD=N#                  Flag number & remember col       AA02  41
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA02  42
ANUM=ANUM*10.+FLOAT(KEY-2)#            Build fp mantissa                AA02  43
IF(CODE==3) ITEN=ITEN+1#               Build fp exponent                AA02  44
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA02  45
#                                                                       AA02  46
ELSE IF(KEY==12&CODE<=2)#              (.)point key tested.             AA02  47
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA02  48
IF(CODE==1) FIRSTD=N#                  Store first col position         AA02  49
CODE=3#                                Set code                         AA02  50
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA02  51
#                                                                       AA02  52
ELSE IF(KEY==13&CODE==1)#              (-)minus key tested              AA02  53
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA02  54
CODE=2;  SYGN=-1.;  FIRSTD=N#          Set code and sign word           AA02  55
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA02  56
#                                                                       AA02  57
ELSE IF(KEY==14&CODE==1)#              (+)plus key tested.              AA02  58
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA02  59
CODE=2;   FIRSTD=N#                    Set type & store first col       AA02  60
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA02  61
#                                                                       AA02  62
ELSE IF((KEY==13\KEY==14)$#            (-)or(+) keys tested             AA02  63
&(CODE==2\CODE==3))#                   And decimal num preceded         AA02  64
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA02  65
CODE=5#                                Set exponent start code          AA02  66
MANT=ANUM*SYGN#                        Store mantissa temporarily       AA02  67
ANUM=0. ; SYGN=1.0#                    Reset number and sign words      AA02  68
IF(KEY==13)  SYGN=-1.0#                Set exponent sign                AA02  69
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA02  70
#                                                                       AA02  71
ELSE IF(KEY==15&CODE==1) CODE=6#       (*)asterisk key tested.          AA02  72
#                                                                       AA02  73
ELSE IF(KEY==16&CODE==1) CODE=7#       ($)dollar key tested             AA02  74
#                                                                       AA02  75
ELSE IF(KEY==18)    DLIM=1#            (:)colon key tested.             AA02  76
#                                                                       AA02  77
ELSE IF(KEY==19&CODE==1&FIELDF==0)#    (=)equal key tested              AA02  78
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA02  79
J=CHRMAX-N   ; N=N+1#                  Skip as left quote               AA02  80
compchar:(A021,19,CHRIN,N,1,1,J,K)#    Second (=) as right quote        AA02  81
IF(K==0) K=CHRMAX+1-N#                 If(=) not found set end          AA02  82
K=K+N-1#                               Calculate rh column posn +1      AA02  83
J=BUFORD(M)#                           Field number from order          AA02  84
BUFIN(J)=FLOAT(N*100+K)*(-1.E+20)#     String pointers to bufin         AA02  85
N=K  ; M=M+1#                          Update column counter            AA02  86
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA02  87
#                                                                       AA02  88
ELSE IF(KEY==17)    DLIM=1#            (,) comma key tested             AA02  89
#                                                                       AA02  90
ELSE IF((KEY==0&(CODE==1\FIRSTD>0))$#  Is char found a stranger         AA02  91
\ SYNTXF==1)#                          Or syntax checking is off        AA02  92
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA02  93
IF(FIELDF==no:)#                       If no field line in progress     AA02  94
FOR(K=N+1;K<=CHRMAX;K=K+1)#            Search over characters           AA02  95
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA02  96
compchar:(CHRIN,K,A021,17,1,1,5,KEY)#  Search for comma, colon,         AA02  97
IF(KEY==0) NEXT#                       Equal, or blank. !=go on         AA02  98
KEY=KEY+16;IF(KEY!=19) BREAK#          Stop if comma,colon, or blnk     AA02  99
J=CHRMAX-K#                            Set extent of search             AA02 100
compchar:(A021,19,CHRIN,K+1,1,1,J,KEY)# Search for second equal         AA02 101
K=K+KEY#                               Jump over embedded string        AA02 102
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA02 103
ELSE K=BUFPNT(M)+1#                    Field is predefined              AA02 104
J=BUFORD(M)#                           Field number from order          AA02 105
IF(FIRSTD>0)#                          Char field starts with num       AA02 106
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA02 107
N=FIRSTD;   FIRSTD=0;   CODE=1#        Set field to first col           AA02 108
ANUM=0.;    SYGN=1.#                   Reset number stores              AA02 109
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA02 110
BUFIN(J)=FLOAT(N*100+K)*(-1.E+20)#     String pointers to bufin         AA02 111
IF(FIELDF==no:) N=K#                   Point to current column          AA02 112
ELSE            N=K-1#                 Go back one column               AA02 113
M=M+1#                                 Count up the fields              AA02 114
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA02 115
#                                                                       AA02 116
ELSE IF(SYNTXF==0)#                    Is syntax print flag on          AA02 117
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 AA02 118
BUFOT(1)=FLOAT(NIMAG)#                 Message to op line               AA02 119
ncodefld:(BUFOT,1,A022,170413.,1)#     Insert image number              AA02 120
BUFOT(1)=FLOAT(N)#                     Float column count               AA02 121
ncodefld:(BUFOT,1,A022,440213.,1)#     Insert column count              AA02 122
movechar:(CHRIN,N,A022,51,1,0)#        Illegal char in reprimand        AA02 123
writeline:(0,A022,NA022,3,1)#          Print line                       AA02 124
movechar:(CHRIN,1,CHROT,2,CHRMAX,0)#   Copy the offending line          AA02 125
writeline:(0,0,0,1,1)#                 Echo the offending line          AA02 126
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 AA02 127
#                                                                       AA02 128
#     CONVERT TO FP NUMBER/PACKED POINTER                               AA02 129
#     -----------------------------------                               AA02 130
#                                                                       AA02 131
IF((DLIM==1&FIELDF==0)$#               When delim flag on/fieldnot      AA02 132
\(FIELDF==1&BUFPNT(M)==N))#            Or field on and col matches      AA02 133
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 AA02 134
IF(CODE>1&CODE<6)#                     Test real number found           AA02 135
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 AA02 136
I=BUFORD(M)#                           Extract field order              AA02 137
IF(CODE==5) ITEN=ITEN-NINT(ANUM*SYGN)# Build exponent                   AA02 138
ELSE        MANT=ANUM*SYGN#            Build mantissa                   AA02 139
IF(ABS(ITEN)>21) ITEN=SIGN(21,ITEN)#   Protect against overflow         AA02 140
IF(ITEN<0) BUFIN(I)=MANT*10.**IABS(ITEN)# Calculate mumber              AA02 141
ELSE       BUFIN(I)=MANT/10.**ITEN#    Calculate number                 AA02 142
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 AA02 143
#                                                                       AA02 144
ELSE IF(CODE==6)#                      Field pointer in anum            AA02 145
M=MIN(NINT(ANUM),mxfdim:)-1#           Position field number            AA02 146
#                                                                       AA02 147
ELSE IF(CODE==7)#                      Field pointer in anum            AA02 148
M=MIN(NINT(ANUM)+M,mxfdim:)-1#         Increment field number           AA02 149
#                                                                       AA02 150
ANUM=0.;  SYGN=1.;  FIRSTD=0;  ITEN=0# Reset number/sign words          AA02 151
CODE=1 ; DLIM=0 ; M=M+1#               Reset code/delimitor flags.      AA02 152
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 AA02 153
IF(KEY==18)  BREAK#                    If colon detected go home        AA02 154
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA02 155
CHRMAX=mxchim:#                        Reset length of input line       AA02 156
#                                                                       AA02 157
RETURN#                                                                 AA02 158
END#                                                                    AA02 159
systemheader:(AA03)#                   Output line numeric encoder      AA03   1
######################################################################  AA03   2
##                                                                   #  AA03   3
##                           AA03 (used in ncodefld:)                #  AA03   4
##                                                                   #  AA03   5
######################################################################  AA03   6
SUBROUTINE AA03(FROM,N,TO,FORM,NFLD)#  Hall, holden, stewart, 1978      AA03   7
include:(AACOMN)#                      Hall march 1986                  AA03   8
#                                                                       AA03   9
INTEGER J,K,N,M,NFLD,RCOL,L,I,NODR#                                     AA03  10
INTEGER WDTH,TYPE,NDPL,IX,ICOL,JCOL,LCOL#                               AA03  11
REAL FORM(*),FROM(*),X,Y,A,SCAL,BASE#                                   AA03  12
string:(TO,*)#                                                          AA03  13
chardata:(A031,'0123456789abcdefghijklmnopquvrstwxyz*')#                AA03  14
realdata:(ITSYNO,1E-32);  intdata:(NCOL,1)#                             AA03  15
intdata:(ORD,[32,16,8,4,2,1])#                                          AA03  16
realdata:(POW,[1E+32,1E+16,1E+8,1E+4,1E+2,1E+1])#                       AA03  17
realdata:(BASEN,[10.,10.,10.,2.,8.,36.,1.,3.,4.])#                      AA03  18
realdata:(SCL,[10.,100.,1E+3,1E+4,1E+5,1E+6,1E+7,1E+8,1E+9])#           AA03  19
realdata:(RND,[.5,.05,.005,5E-4,5E-5,5E-6,5E-7,5E-8,5E-9,5E-10])#       AA03  20
datastuff:#                                                             AA03  21
#                                                                       AA03  22
#   LOOP OVER REQUESTED FIELDS                                          AA03  23
#   --------------------------                                          AA03  24
#                                                                       AA03  25
DO M=1,NFLD#                           Loop over specified fields       AA03  26
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA03  27
X=FORM(M)+.01#                         Format(rcol/wdth/dp/typ)         AA03  28
RCOL=NINT(X*0.0001)#                   Right-most column posn           AA03  29
J=NINT(X-FLOAT(RCOL*10000))#           Extract lldt as integer          AA03  30
WDTH=J/100#                            Unpack width of field            AA03  31
IF(WDTH==0) NEXT#                      Skip if null field               AA03  32
NDPL=(J-WDTH*100)/10#                  Number decimal places            AA03  33
TYPE=MOD(J,10)#                        Unpack format type               AA03  34
IF(RCOL==0) RCOL=LCHROT+WDTH#          If format in stack mode          AA03  35
LCHROT=RCOL#                           Reset last character output      AA03  36
LCOL=RCOL+1-WDTH#                      Left-most column posn            AA03  37
TO(LCOL^RCOL)=' '#                     Blank out whole field            AA03  38
J=N+M-1#                               Point to number in from          AA03  39
ifsel:(VMS,SLPC)#                      Apply fp valid test to all       AA03  40
ifsel:#                                Os's except vms                  AA03  41
IF(TYPE<3) $#                          For f.p numbers                  AA03  42
IF(FROM(J)!=FROM(J)) iquit:(AA0399)#   Test if ieee 'not a number'      AA03  43
endsel:#                                                                AA03  44
#                                                                       AA03  45
IF(TYPE<4) ifvo:(FROM(J))#             Test if field is voidflg:        AA03  46
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA03  47
IF(PRVOID==no:) NEXT#                  Void field left blank            AA03  48
IF(PRVOID==yes:)#                      Void field is flagged @@@@       AA03  49
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA03  50
I=RCOL+1-MIN(WDTH,4)#                  Define width of @@@@ flag        AA03  51
TO(I^RCOL)='@@@@';  NEXT#              Insert flag into field           AA03  52
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA03  53
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA03  54
#                                                                       AA03  55
#     PROCESS E,F,I BASE10 & I BASE2,8,36                               AA03  56
#     -----------------------------------                               AA03  57
#                                                                       AA03  58
IF(TYPE<=6)#                           Is number packed/unpacked        AA03  59
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA03  60
X=ABS(FROM(J))#                        Store magnitude in fp word       AA03  61
Y=FROM(J)#                             Store number in fp word          AA03  62
IF((TYPE==3)&(X<(.99)))#               Protect integers                 AA03  63
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA03  64
Y=0.0; X=0.0#                                                           AA03  65
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA03  66
IF(Y<(-ITSYNO))WDTH=WDTH-1#            See if a minus sign needed       AA03  67
#                                                                       AA03  68
#                                       ******* if format possible      AA03  69
REPEAT#                                Repeat  of format change         AA03  70
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA03  71
BASE=BASEN(TYPE)  ; SCAL=1.#           Extract number base              AA03  72
IF(TYPE>2)    A=X+.5#                  Round up non fp numbers          AA03  73
ELSE          A=X+RND(NDPL+1)#         Round up fp numbers              AA03  74
FOR(NODR=0;A>=SCAL;NODR=NODR+1)#       Count order of number            AA03  75
SCAL=SCAL*BASE#                        Scale base order                 AA03  76
IF(TYPE==1)  BREAK#                    If e-format continue             AA03  77
IF(NODR<=WDTH & NODR<=mxsgfp:) BREAK#  Is order less than width         AA03  78
TYPE=1   ;  NDPL=8#                    If not change to e-format        AA03  79
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA03  80
IF(TYPE==4) NODR=MIN0(NODR+1,WDTH)#    Stop overflow binary number      AA03  81
NCOL=MAX0(NODR,NDPL)#                  Minimum col requirement          AA03  82
#                                                                       AA03  83
#                                       ******** process e and f        AA03  84
IF(TYPE<=2)#                           Test if e or f-type format       AA03  85
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA03  86
#                                                                       AA03  87
IF(TYPE==2)#                           Process f-type first             AA03  88
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA03  89
NCOL=NODR+NDPL+1#                      Columns required for f           AA03  90
IF(NCOL>WDTH)#                         Does min.fp overflow             AA03  91
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA03  92
K=WDTH-NODR-1  ;  NCOL=WDTH#           Calc dec places/ col length      AA03  93
IF(K<0)  TYPE=1#                       Overflow must be e-format        AA03  94
ELSE  NDPL=K#                          Reset num of decimal places      AA03  95
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA03  96
IF((TYPE==2)&(NCOL>mxsgfp:+1))#        If fp digits significant         AA03  97
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA03  98
K=mxsgfp:-NODR;  NCOL=mxsgfp:+1#       No reduce to max possible        AA03  99
IF(K<0)  TYPE=1#                       Insufficient make e-format       AA03 100
ELSE     NDPL=K#                       Reset num of decimal places      AA03 101
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA03 102
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA03 103
#                                                                       AA03 104
IF(TYPE==1)#                           If e-type format                 AA03 105
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA03 106
NDPL=MIN0(NDPL,WDTH-4,mxsgfp:)#        No. sig. places possible         AA03 107
IF(NDPL<0) GOTO 100#                   If below signal overflow         AA03 108
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA03 109
IF(NDPL<=0) SCAL=1.#                   Set scale to default value       AA03 110
ELSE        SCAL=SCL(NDPL)#            Set decimal place scale          AA03 111
#                                                                       AA03 112
IF(TYPE==1)#                           Is this is e-type format         AA03 113
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 AA03 114
NCOL=NDPL+4#                           Set total column scan            AA03 115
A=1.-0.5/SCAL#                         Avoid ovfl in most sig. digi     AA03 116
IF((X<1.)&(X>ITSYNO))#                 If num < one but > zero          AA03 117
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 AA03 118
DO K=2,6; IF(X*POW(K)<A)#              Loop decr. powers of 10          AA03 119
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 AA03 120
X=X*POW(K) ; NODR=NODR-ORD(K)#         Scale up number and count        AA03 121
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 AA03 122
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 AA03 123
ELSE#                                  If number ge to one              AA03 124
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 15 AA03 125
L=NODR#                                Set temporary counter            AA03 126
DO K=1,6; IF(L>=ORD(K))#               Loop decr. powers  of 10         AA03 127
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16 AA03 128
X=X/POW(K)  ; L=L-ORD(K)#              If not apply to number           AA03 129
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 16 AA03 130
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 15 AA03 131
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 AA03 132
X=X*SCAL#                              Scale up for unpacking           AA03 133
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA03 134
#                                                                       AA03 135
IF(TYPE>0)#                            Test for not overflowed          AA03 136
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 17 AA03 137
IX=NINT(X);    L=NINT(BASEN(TYPE))#    Ensure value rounded off         AA03 138
JCOL=RCOL-NDPL#                        Reset dec. place pointer         AA03 139
ICOL=RCOL-NCOL;   I=1;     J=L#        Unpacking base constants         AA03 140
IF(TYPE==2&ICOL==JCOL-1) LCOL=JCOL#    If fp < one                      AA03 141
ELSE                     LCOL=ICOL#    Else set scan limit              AA03 142
IF(TYPE==1) K=RCOL-3#                  Skip exponent for e format       AA03 143
ELSE        K=RCOL#                    For all other formats            AA03 144
FOR(;K>LCOL;K=K-1)#                    Loop over active columns         AA03 145
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 18 AA03 146
IF(K==JCOL&TYPE==2) K=K-1#             Skip . posn for f-format         AA03 147
I=MOD(IX,J)/I+1#                       Store pointer to digit           AA03 148
TO(K^K)=A031(I^I)#                     Store the digit                  AA03 149
I=J;     J=J*L#                        Reset unpacking constants        AA03 150
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 18 AA03 151
IF(Y<(-ITSYNO)) TO(ICOL^ICOL)='-'#     Insert mantissa - sign           AA03 152
IF(TYPE==2)     TO(JCOL^JCOL)='.'#     Insert decimal point             AA03 153
IF(TYPE==1)#                           If e-type format                 AA03 154
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 19 AA03 155
IF(NODR>=0)     TO(RCOL-2^RCOL-2)='+'# Insert exponent+sign             AA03 156
ELSE            TO(RCOL-2^RCOL-2)='-'# Insert exponent-sign             AA03 157
K=IABS(NODR)/10  ;TO(RCOL-1^RCOL-1)=A031(K+1^K+1)# Exponent 10s digit   AA03 158
K=IABS(NODR)-K*10;TO(RCOL^RCOL)=A031(K+1^K+1)# Exponent 1s digit        AA03 159
TO(JCOL-3^JCOL-3)='.'#                 Insert decimal point             AA03 160
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 19 AA03 161
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 17 AA03 162
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA03 163
#                                                                       AA03 164
#     PROCESS PACKED BIN, OCTAL & HEX                                   AA03 165
#     -------------------------------                                   AA03 166
#                                                                       AA03 167
ELSE#                                  In this section unpack bit s     AA03 168
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 20 AA03 169
movepakwd:(FROM(J),X)  ;NCOL=RCOL#     Packed word ; set col count      AA03 170
J=NINT(BASEN(TYPE))#                   Extract base modulo              AA03 171
WDTH=MIN0(WDTH*J,mxbtwd:)-J#           Set unpacking upper limit        AA03 172
DO K=0,WDTH,J#                         Loop over packets of j bits      AA03 173
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 21 AA03 174
intunpak:(X,I,K,J)#                    Move bit packet j from x to      AA03 175
TO(NCOL^NCOL)=A031(I+1^I+1)#           Store digit                      AA03 176
NCOL=NCOL-1#                           Decrement column count           AA03 177
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 21 AA03 178
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 20 AA03 179
NEXT#                                  Skip to next format entry        AA03 180
#                                                                       AA03 181
100 CONTINUE#                          If overflow fill with *'s        AA03 182
movechar:(A031,37,TO,LCOL,WDTH,1)#     Insert * in all columns          AA03 183
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA03 184
#                                                                       AA03 185
RETURN#                                                                 AA03 186
END#                                                                    AA03 187
systemheader:(AA04)#                   Line outputter & paginator       AA04   1
######################################################################  AA04   2
##                                                                   #  AA04   3
##                          AA04 (used in writeline:)                #  AA04   4
##                                                                   #  AA04   5
######################################################################  AA04   6
SUBROUTINE AA04(NSP,HEADER,LGH,KEY,PR)# S.r.hall  september 1978        AA04   7
include:(AACOMN)#                      S.r.hall  november 1981          AA04   8
#                                                                       AA04   9
INTEGER    NSP#                        Spaces before first line         AA04  10
INTEGER    LGH#                        Length of header array           AA04  11
INTEGER    KEY,K#                      Output control mode              AA04  12
INTEGER    PR#                         Priority                         AA04  13
INTEGER    KB#                         No. of lines for buffer          AA04  14
INTEGER    KH#                         No. of lines for header          AA04  15
INTEGER    KS#                         No. of blank lines               AA04  16
INTEGER    LEN#                        Actual length of header          AA04  17
string:(HEADER,*)#                     Header array                     AA04  18
datastuff:#                                                             AA04  19
#                                                                       AA04  20
#-------------------------------------------------------------------    AA04  21
#                     =|1| OPTIONAL HEADER / CHROT()  PRINTED           AA04  22
#    KEY MODE         =|2| HEADER / CHROT()  PRINTED                    AA04  23
#                     =|3| HEADER  PRINTER                              AA04  24
#                                                                       AA04  25
#        IF KEY IS NEGATIVE THE PAGE HEADER IS NOT PRINTED              AA04  26
#                                                                       AA04  27
#  LINRM IS THE NUMBER OF LINES REQUIRED FOR A PRINT SEQUENCE           AA04  28
#  ON THE CURRENT PAGE. IF THERE IS INSUFFICIENT ROOM A NEW             AA04  29
#  PAGE IS FORCED AND LINRM IS SET TO ZERO IF KEY=1                     AA04  30
#                  OR LINRM IS DECREMENTED IF KEY=2 OR 3.               AA04  31
#-------------------------------------------------------------------    AA04  32
#                                                                       AA04  33
IF(PR<=PPRIOR)#                        Is priority acceptable           AA04  34
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA04  35
KS=NSP; KH=0; KB=0#                    Reset space/head/buf flags       AA04  36
LEN=MIN0(LGH,prtcmax:)#                Calculate header length          AA04  37
IF((LINRM>0\IABS(KEY)>=2)&LEN>0) KH=1# Test if header forced            AA04  38
IF(IABS(KEY)<=2) KB=1#                 Line buffer output               AA04  39
IF((LINCT<KS+KH+KB)\(LINCT<LINRM))#    Test if sufficient lines         AA04  40
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA04  41
IF(NPAGE>0) nextpage:#                 Skip to top of next page         AA04  42
NPAGE=NPAGE+1#                         Increment page counts            AA04  43
ncodefld:(FLOAT(NPAGE),1,TITLE,350313.,1)# Put page counts in title     AA04  44
IF(KEY>0) lineout:(PR,TITLE,prtcmax:)# Print the page heading           AA04  45
LINCT=prtlmax:-1#                      Reset lines per page             AA04  46
KS=1#                                  Force line below title           AA04  47
IF(LEN>0) KH=1#                        Force header line                AA04  48
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA04  49
#                                                                       AA04  50
DO K=1,KS;lineout:(PR,BLANK,2)#        Print blank lines                AA04  51
IF(KH==1) lineout:(PR,HEADER,LEN)#     Print the header                 AA04  52
IF(KB==1) lineout:(PR,CHROT,prtcmax:)# Print the output buffer          AA04  53
K=KS+KH+KB#                            Number of output lines           AA04  54
LINCT=LINCT-K#                         Decrement line counter           AA04  55
#                                                                       AA04  56
IF(IABS(KEY)==1) LINRM=0#              Reset lineroom counter           AA04  57
ELSE             LINRM=MAX0(LINRM-K,0)# Reset lineroom counter          AA04  58
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA04  59
#                                                                       AA04  60
IF(KEY!=3) CHROT(1^mxcout:)=' '#       If output buffer used, reset     AA04  61
LCHROT=1#                              Reset last char to chrot buffe   AA04  62
#                                                                       AA04  63
RETURN#                                                                 AA04  64
END#                                                                    AA04  65
systemheader:(AA05)#                   Strip components from atom lab   AA05   1
######################################################################  AA05   2
##                                                                   #  AA05   3
##                          AA05 (used by label:)                    #  AA05   4
##                                                                   #  AA05   5
######################################################################  AA05   6
SUBROUTINE AA05(LABEL,LLEN,SLEN,SYMTAB,ISYM)#                           AA05   7
include:(AACOMN)#                                                       AA05   8
#                                                                       AA05   9
INTEGER I,J,N#                                                          AA05  10
INTEGER ISYM#                          Pointer to the symbol array      AA05  11
INTEGER SLEN#                          Number of characters in symbol   AA05  12
INTEGER LLEN#                          Number of characters in label    AA05  13
INTEGER IPNT#                          Pointer to atom label            AA05  14
string:(LABEL,*)#                      Atom label string                AA05  15
string:(SYMTAB,*)#                     Atom type symbol table           AA05  16
string:(ATYPE,8)#                      Atom type symbol string          AA05  17
string:(UPSYM,8)#                      Atom symbol in upper case        AA05  18
chardata:(NUM,'0123456789')#                                            AA05  19
chardata:(SPC,' ~@#$%^*()"[]{}=+-<>.,/? |!')# Special chars             AA05  20
datastuff:#                                                             AA05  21
#                                                                       AA05  22
#   GET THE LENGTH OF THE LABEL                                         AA05  23
#   ---------------------------                                         AA05  24
#                                                                       AA05  25
SPC(1^1)=''''#                         Stuff right parenthesis also     AA05  26
SPC(25^25)='\\\\'#                     Stuff backslash also             AA05  27
FOR(N=1;N<24;N=N+1) IF(LABEL(N+1^N+1)==' ') BREAK# Search for blank     AA05  28
LLEN=N;        SLEN=LLEN#              Save label length                AA05  29
LABMAX=MAX(LABMAX,LLEN)#               Save max label encountered       AA05  30
#                                                                       AA05  31
#   GET THE LENGTH OF THE ATOM TYPE SYMBOL                              AA05  32
#   --------------------------------------                              AA05  33
#                                                                       AA05  34
FOR(I=1;I<=N;I=I+1)#                   Loop along atom label            AA05  35
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA05  36
IF(LABEL(I^I)=='_')BREAK#              Underscores terminate            AA05  37
IF(INDEX(SPC,LABEL(I^I))!=0)BREAK#     Special chars terminate          AA05  38
IF(INDEX(NUM,LABEL(I^I))!=0)#          Got a number oxid or label?      AA05  39
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA05  40
IF(LABEL(I+1^I+1)=='+'\LABEL(I+1^I+1)=='-')I=I+1# Skip oxidation numb   AA05  41
ELSE BREAK#                            Break on numeric label           AA05  42
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA05  43
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA05  44
SLEN=I-1#                              Save symbol length and exit      AA05  45
#                                                                       AA05  46
#   IDENTIFY THE ATOM TYPE AND SEQU. NUMBER                             AA05  47
#   ---------------------------------------                             AA05  48
#                                                                       AA05  49
IF(LABEL(SLEN^SLEN)=='(') SLEN=SLEN-1# Ignore brackets                  AA05  50
ATYPE=LABEL(1^SLEN);  ISYM=0#          Get the type symbol              AA05  51
upcase:(ATYPE,ATYPE,SLEN)#             Convert to upper case            AA05  52
FOR(I=1;I<200;I=I+8)#                  Loop over symbol length          AA05  53
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA05  54
IF(SYMTAB(I^I)==' ') BREAK#            Exit after end of list           AA05  55
upcase:(SYMTAB(I^I+7),UPSYM,8)#        Ensure that symbol in upcase     AA05  56
IF(UPSYM!=ATYPE) NEXT#                 Skip if no match                 AA05  57
ISYM=I/8+1;    BREAK#                  Set the atom type number         AA05  58
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA05  59
#                                                                       AA05  60
#    GET POSITION AND LENGTHS OF LABEL COMPONENTS                       AA05  61
#    --------------------------------------------                       AA05  62
#                                                                       AA05  63
IPNT=SLEN+1#                           Set pointer for components       AA05  64
DO I=1,7#                              Loop over label components       AA05  65
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA05  66
LABPOS(I)=IPNT#                        Set component pointer            AA05  67
DO J=IPNT,24#                          Loop over chars in string        AA05  68
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA05  69
IF(I==2) IF(INDEX(NUM,LABEL(J^J))!=0) BREAK# Exit if digit              AA05  70
IF(LABEL(J^J)=='_'\LABEL(J^J)==' ') BREAK# Exit at end                  AA05  71
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA05  72
LABLEN(I)=J-IPNT#                      Set component length             AA05  73
IF(LABEL(J^J)=='_'&I!=2) IPNT=J+1#     Reset pointer                    AA05  74
ELSE                     IPNT=J#       Reset pointer                    AA05  75
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA05  76
#                                                                       AA05  77
RETURN#                                                                 AA05  78
END#                                                                    AA05  79
systemheader:(AA06)#                   Error exit routine               AA06   1
######################################################################  AA06   2
##                                                                   #  AA06   3
##                          AA06 (used in iquit:)                    #  AA06   4
##                                                                   #  AA06   5
######################################################################  AA06   6
ifsel:(LHPC)#                                                           AA06   7
RECURSIVE SUBROUTINE AA06(CODE,FIELD)#                                  AA06   8
ifsel:#                                                                 AA06   9
SUBROUTINE AA06(CODE,FIELD)#                                            AA06  10
endsel:#                                                                AA06  11
include:(AACOMN)#                      J.m.stewart 1979                 AA06  12
#                                      S.r.hall 1989                    AA06  13
INTEGER LNBLNK#                        External function retuns int     AA06  14
INTEGER I,IWR,IOZ,IWRP,FIELD,NDEV#                                      AA06  15
REAL TEMP#                                                              AA06  16
LOGICAL TEST#                          Test file existence              AA06  17
chardata:(AA061," Failure in           SUBROUTINE AA00  Error   ")#     AA06  18
chardata:(AA062," ERROR in field    of the following input line.")#     AA06  19
chardata:(AA063,' Last input line:  ')#                                 AA06  20
chardata:(AA064,"         error message ......")#                       AA06  21
chardata:(AA065,' >>> bdf  xxxxxx.xxx --> master file  xxxxxx.xxx')#    AA06  22
chardata:(AA066," Error text not on unit   ")#                          AA06  23
chardata:(AA067," A consoling message from OZY .......")#               AA06  24
chardata:(AA068, ****** F I N I S H ******)#                            AA06  25
chardata:(AA069,' Error in input master file on line       ')#          AA06  26
chardata:(AA06A,' Unable to locate Xtal error message file:')#          AA06  27
chardata:(AA06B,' Check definition of XTALHOME environment variable')#  AA06  28
string:(TEXT,80);  string:(CODE,*)#                                     AA06  29
datastuff:#                                                             AA06  30
#                                                                       AA06  31
IF(CODE(1^1)=='-') QUITF=CODE(2^7)#    Extract the quit code            AA06  32
ELSE               QUITF=CODE(1^6)#    Extract the quit code            AA06  33
#                                                                       AA06  34
IF(QUITF=='FINISH')#                   If its all over, s t o p         AA06  35
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA06  36
writeline:(1,AA068,NAA068,3,1); GOTO 200# Write finish salutation       AA06  37
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA06  38
#                                                                       AA06  39
IF(FIELD>0)#                           Test if field flag active        AA06  40
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA06  41
ncodefld:(FLOAT(FIELD),1,AA062,180213.,1)# Format field for print       AA06  42
writeline:(1,AA062,NAA062,3,1)#        Print error message              AA06  43
movechar:(CHRIP,1,CHROT,2,CHRMAX,0)#   Copy erroneous line              AA06  44
writeline:(0,0,0,1,1)#                 Print erroneous line             AA06  45
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA06  46
#                                                                       AA06  47
IF(QUITF(1^3)=='AA2')#                 Test if master file error        AA06  48
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA06  49
ncodefld:(FLOAT(LINMAS),1,AA069,420713.,1)# Format input line number    AA06  50
writeline:(1,AA069,NAA069,3,2)#        Print error message              AA06  51
movechar:(HEADOT,1,CHROT,2,CHRMAX,0)#  Copy erroneous line              AA06  52
writeline:(0,0,0,1,1)#                 Print erroneous line             AA06  53
MASTER=no:#                            Switch off the master file       AA06  54
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA06  55
#                                                                       AA06  56
IF(QUITF(1^2)!='AA') AA061(13^19)=PROGID# Insert program name           AA06  57
ELSE                 AA061(13^20)='NUCLEUS'# Insert program name        AA06  58
movechar:(QUITF,1,AA061,34,4,0)#       Store subroutine name            AA06  59
movechar:(QUITF,5,AA061,46,2,0)#       Store error number               AA06  60
writeline:(1,AA061,NAA061,3,1)#        Print quit message               AA06  61
movechar:(AA063,1,CHROT,1,NAA063,0)#   Show last input line             AA06  62
movechar:(CHRIP,1,CHROT,NAA063,CHRMAX,0)# To help user                  AA06  63
writeline:(0,0,0,1,1)#                 Find trouble                     AA06  64
#                                                                       AA06  65
#  ATTACH THE ERROR MESSAGE TEXT FILE                                   AA06  66
#  ----------------------------------                                   AA06  67
#                                                                       AA06  68
IWR=no:;   IWRP=no:;   IOZ=oznum:#     Set switch to no write yet       AA06  69
INQUIRE(FILE=errfile:,EXIST=TEST)#     Does the errfile exist ?         AA06  70
IF(!TEST)#                             Aparently not, quit gracefully   AA06  71
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA06  72
CHROT=AA06A//errfile:#                 Indicate which file is missing   AA06  73
writeline:(0,AA06B,NAA06B,2,1)#        Indicate why file is missing     AA06  74
GOTO 200#                              Brach point to final quit.       AA06  75
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA06  76
openfmt:(ioerr:,errfile:)#             Open error message file          AA06  77
movechar:(AA061,13,AA064,2,7,0)#       Move program name to header      AA06  78
writeline:(1,AA064,NAA064,3,1)#        Output program message           AA06  79
REPEAT#                                Search for message in text fil   AA06  80
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA06  81
readfmt:(ioerr:,'(A)',100,TEXT)#       Error id & text                  AA06  82
IF(TEXT(2^7)==QUITF)#                  Test for match                   AA06  83
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA06  84
IWR=yes:#                              Set write switch to found mess   AA06  85
movechar:(TEXT,9,CHROT,2,72,0)#        Move message                     AA06  86
writeline:(0,0,0,1,1)#                 Print the message                AA06  87
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA06  88
ELSE IF(IWR==yes:&CODE(1^1)=='-') GOTO150# This is only a warning       AA06  89
ELSE IF(IWR==yes:&IOZ==0) BREAK#       Been there done that             AA06  90
ELSE IF(IWR==yes:)#                    If fatal & message output        AA06  91
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA06  92
IOZ=0;  IWR=no:;  IWRP=yes:#           Set ozy flags                    AA06  93
QUITF='ZZZ'#                           Overwrite with ozy id            AA06  94
getcpus:(TEMP)#                        Get cpu time in seconds          AA06  95
TEMP=AMOD(TEMP*100.,oznum:.)#          Generate random search number    AA06  96
ncodefld:(TEMP,1,QUITF,60333.,1)#      Store as search code             AA06  97
writeline:(1,AA067,NAA067,2,3)#        Warn user that ozy is coming     AA06  98
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA06  99
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA06 100
100 CONTINUE#                          End-of-file branchpoint          AA06 101
IF(IWRP==no:&IOZ!=0)#                  If no message found              AA06 102
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA06 103
ncodefld:(FLOAT(ioerr:),1,AA066,260313.,1)# Format device number        AA06 104
writeline:(0,AA066,NAA066,3,1)#        Tell user no errmes file         AA06 105
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA06 106
150 CONTINUE#                          Warning branch point             AA06 107
closefmt:(ioerr:)#                     Close errmes file                AA06 108
#                                                                       AA06 109
#   CLOSEUP SHOP AND GO HOME                                            AA06 110
#   ------------------------                                            AA06 111
#                                                                       AA06 112
200 CONTINUE#                          Exit branch point                AA06 113
IF(CODE(1^1)!='-')#                    If not a warning                 AA06 114
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA06 115
closepch:#                             Close off the punch file         AA06 116
QXCUR=QXSTR#                           Reinitialize the memory          AA06 117
IF(MASTER==yes:)#                      If masterfile op requested       AA06 118
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA06 119
MASTER=no:#                            Prevent recursion                AA06 120
inquirefile:(IOUNIT(1),I,' ')#         Inquire if bdf file exists       AA06 121
IF(I==yes:)#                           Copy files only if it does       AA06 122
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA06 123
inquireunit:(NDEV,FILENM(IOUNIT(1)))#  Is bdf file assigned?            AA06 124
IF(NDEV!=0) bdfclose:(NDEV)#           If so, close it                  AA06 125
FILEXT(iofm0:)=MASTOT#                 Define fmt as xtal archive       AA06 126
openfmt:(iofm0:,' ')#                  Open xtal archive file           AA06 127
movechar:(FILENM(IOUNIT(1)),1,AA065,11,10,0)# Insert requested filena   AA06 128
movechar:(FILENM(iofm0:),1,AA065,39,10,0)# Insert requested filename    AA06 129
writeline:(2,AA065,NAA065,3,3)#        Tell user master file read       AA06 130
bdfclose:(IOUNIT(1)); PRHIST=no:#      Close the input archive bdf      AA06 131
IOPKPT(1)=0; IORWFL(1)=0; IOLRHD(1)=0# Reset the file switches          AA06 132
CALL AA26#                             Transfer bdf to master file      AA06 133
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA06 134
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA06 135
localstop:#                            Tidy-up before shutdown          AA06 136
IF(PPRIOR>=0) STOP#                    A compiler-proof stop...         AA06 137
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA06 138
#                                                                       AA06 139
RETURN#                                                                 AA06 140
END#                                                                    AA06 141
systemheader:(AA07)#                   Initialize system variables      AA07   1
#####################################################################   AA07   2
##                                                                  #   AA07   3
##                          AA07 (used in initcom:)#                #   AA07   4
##                                                                  #   AA07   5
#####################################################################   AA07   6
SUBROUTINE AA07#                       Hall, stewart  sept.  1978       AA07   7
ifsel:(MSNT)#                          Win nt f90 includes              AA07   8
USE DFLIB#                             Include extras: iargc getarg     AA07   9
endsel:#                               End of f90 includes              AA07  10
include:(AACOMN)#                                                       AA07  11
#                                                                       AA07  12
INTEGER IARGC#                         External func returns int        AA07  13
INTEGER ARGC,IOUTF,INF#                                                 AA07  14
INTEGER LNBLNK#                        External func returns int        AA07  15
LOGICAL TEST#                                                           AA07  16
INTEGER CMDARG,EXEX#                   How many command line args#      AA07  17
string:(INPFIL,256)#                   Very long command line filenam   AA07  18
string:(OUTFIL,256)#                   Very long output filename        AA07  19
string:(STRNG,256)#                    Very long temp string            AA07  20
#                                                                       AA07  21
INTEGER I,J,K#                         Index pointers                   AA07  22
string:(DATUM,8)#                                                       AA07  23
chardata:(A71," progid XTAL     dd-mmmyy   Page nn   Xtal")#            AA07  24
chardata:(A72,0123456789)#                                              AA07  25
chardata:(A73,version:)#                                                AA07  26
chardata:(A74,update:)#                                                 AA07  27
datastuff:#                                                             AA07  28
#                                                                       AA07  29
#    INITIALIZE LINE IO PARAMETERS                                      AA07  30
#    ----------------------------                                       AA07  31
#                                                                       AA07  32
QXSTR=1#                               Start of usable qx array         AA07  33
QXMAX=memmax:#                         Max qx array                     AA07  34
QXCUR=QXSTR#                           Current qx pointer               AA07  35
LABMAX=0#                              Max length of atom label         AA07  36
PRVOID=yes:#                           Print voidflg: as @@@@           AA07  37
PRHIST=no:#                            File a history not printed       AA07  38
LINID=0#                               Set key card code for aa98       AA07  39
LCHROT=1#                              Last char op to chrot buffer     AA07  40
PROGID=' '#                            Blank program id name            AA07  41
COMPID='XTAL'#                         Assume default compid name       AA07  42
QUITF=' '#                             Set error flag to null           AA07  43
LINFLG=1#                              Set aa01 rescan flag to no:      AA07  44
CHRMAX=mxchim:#                        Set max chars per input imag     AA07  45
LINCT=0#                               Set output line counter          AA07  46
LINMAS=0#                              Set master file line count       AA07  47
LINRM=0#                               Set line-room counter            AA07  48
NIMAG=0#                               Set input image counter          AA07  49
NPAGE=0#                               Set total page counter           AA07  50
CHREOF=0#                              Set input eof flag off           AA07  51
SYNTXF=0#                              Set syntax check on (off=1)      AA07  52
FIELDF=0#                              Set input field flag off         AA07  53
SETIDF=0#                              Set input setid flag off         AA07  54
PRGLST(1^)='PRGLST'#                   Set prog list identifier         AA07  55
PNTPRG=8#                              Set program list pointer         AA07  56
ELAPST=0.#                             Reset elapsed time counter       AA07  57
prtstat:=3.;      PPRIOR=3#            Set default print priority       AA07  58
prtcpin:=nchin:#                       Set default chars/inch           AA07  59
prtlpin:=nliin:#                       Set default lines/inch           AA07  60
prtcmax:=mxchln:#                      Set default max chars/line       AA07  61
prtlmax:=mxlnpg:#                      Set default max lines/page       AA07  62
#                                                                       AA07  63
#     INITIALIZE FILE IO PARAMETERS                                     AA07  64
#     -----------------------------                                     AA07  65
#                                                                       AA07  66
DO I=1,22; IOUNIT(I)=1#                Reset all io units               AA07  67
J=unitbdf:#                            Set device number of filea       AA07  68
DO K=1,8#                              Loop over all io files           AA07  69
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA07  70
IOUNIT(K)=K + J - 1#                   Deposit device number            AA07  71
IOMARK(K)=0#                           Set buffer pointer               AA07  72
IORWFL(K)=0#                           Set rewind flag off              AA07  73
IOPKPT(K)=0#                           Set packet pointer               AA07  74
IOLRHD(K)=0#                           Set logical record head poin     AA07  75
IOPRCT(K)=0#                           Set physical record count        AA07  76
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA07  77
ioinp:=unitinp:;   IOIN2=unitinp:#     Store line input device number   AA07  78
ioprt:=unitprt:#                       Store printer device number      AA07  79
iopch:=unitpch:#                       Store punch line device number   AA07  80
ioerr:=uniterr:#                       Store error file device number   AA07  81
iofm0:=unitfm0:#                       Store line device number 0       AA07  82
iofm1:=unitfm1:#                       Store line device number 1       AA07  83
iofm2:=unitfm2:#                       Store line device number 2       AA07  84
ioda1:=unitda1:#                       Store dir acc device number 1    AA07  85
ioda2:=unitda2:#                       Store dir acc device number 2    AA07  86
ioda3:=unitda3:#                       Store dir acc device number 3    AA07  87
#                                                                       AA07  88
ifsel:(VMS,UNXHP)#                     Dec vax vms compiler and hp      AA07  89
## ideally this code is just for the macintosh and PC                   AA07  90
ifsel:#                                For all other compilers          AA07  91
CMDARG=IARGC()#                        Get number of command line arg   AA07  92
IOUTF=yes:;INF=yes:#                                                    AA07  93
INPFIL=' '#                            Set to blank                     AA07  94
OUTFIL=' '#                            Set to blank                     AA07  95
FOR(ARGC=1;ARGC<=CMDARG;ARGC=ARGC+1)#  At least one command line arg    AA07  96
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA07  97
STRNG=' '#                             Set to blank                     AA07  98
CALL GETARG(ARGC,STRNG)#               Get input filename               AA07  99
I=LNBLNK(STRNG)#                       Get last non blank character     AA07 100
IF(STRNG(1^I)=='-n'\STRNG(1^I)=='-N')# No input file (use stdin)        AA07 101
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA07 102
INF=no:#                               No input file on command line    AA07 103
NEXT#                                                                   AA07 104
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA07 105
ELSEIF(STRNG(1^I)=='-p'\STRNG(1^I)=='-P')# No print file (use stdout)   AA07 106
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA07 107
IOUTF=no:#                             No output file on command line   AA07 108
NEXT#                                                                   AA07 109
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA07 110
ELSEIF(STRNG(1^1)=='-')iquit:(AA0702)# No print file (use stdout)       AA07 111
ELSEIF(INF  ==yes:&INPFIL(1^1)==' ')INPFIL=STRNG# Save first as input   AA07 112
ELSEIF(IOUTF==yes:&OUTFIL(1^1)==' ')OUTFIL=STRNG# Save next as out fi   AA07 113
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA07 114
#                                                                       AA07 115
IF(INF==yes:&INPFIL!=' ')#             Filename on command line         AA07 116
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA07 117
J=LNBLNK(INPFIL)#                      Get last non blank character     AA07 118
I=MAX(4,J)#                            Get last non blank character     AA07 119
IF(INPFIL(I-3^I)!='.dat'&INPFIL(I-3^I)!='.DAT'&$#                       AA07 120
   INPFIL(I-3^I)!='.inp'&INPFIL(I-3^I)!='.INP')EXEX=no:# No extension   AA07 121
ELSE EXEX=yes:#                        Extension exists                 AA07 122
INQUIRE(FILE=INPFIL,EXIST=TEST)#       Does the explicit filename exi   AA07 123
IF(!TEST&EXEX==no:)#                   Doesn't exist-must be implied    AA07 124
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA07 125
INPFIL(J+1^)='.dat'#                   Append a .dat to the filename    AA07 126
EXEX=yes:#                             Extension now exists             AA07 127
INQUIRE(FILE=INPFIL,EXIST=TEST)#       Does new filename exist now      AA07 128
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA07 129
IF(!TEST) iquit:(AA0701)#              Terminate program run            AA07 130
OPEN(UNIT=unitin1:,FILE=INPFIL,STATUS='UNKNOWN',# Open formatted sequ   AA07 131
ACCESS='SEQUENTIAL',FORM='FORMATTED')# Open formatted sequ file         AA07 132
ioinp:=unitin1:;   IOIN2=unitin1:#     Store line input device number   AA07 133
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA07 134
#                                      Else use standard input          AA07 135
#                                                                       AA07 136
#                                                                       AA07 137
IF(IOUTF==yes:&(INPFIL(1^1)!=' '\OUTFIL(1^1)!=' '))#                    AA07 138
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA07 139
IF(OUTFIL==' ')#                       Not literal, so derive from in   AA07 140
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA07 141
OUTFIL=INPFIL#                                                          AA07 142
K=LNBLNK(OUTFIL)#                                                       AA07 143
IF(EXEX==yes:)OUTFIL(K-3^K)='.lst'#    Change extension                 AA07 144
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA07 145
INQUIRE(FILE=OUTFIL,EXIST=TEST)#       Does the input filename exist    AA07 146
IF(TEST)#                              File already exists              AA07 147
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA07 148
OPEN(UNIT=unitpr1:,FILE=OUTFIL,STATUS='OLD')# Open the old file         AA07 149
CLOSE(unitpr1:,STATUS='DELETE')#       Close and delete it              AA07 150
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA07 151
OPEN(UNIT=unitpr1:,FILE=OUTFIL,STATUS='NEW')# Open formatted output f   AA07 152
ioprt:=unitpr1:#                       Store printer device number      AA07 153
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA07 154
endsel:#                               End of machine specific          AA07 155
#                                                                       AA07 156
DO I=1,22; IF(IOUNIT(I)<1\IOUNIT(I)>99) iquit:(AA0710)# Illegal unit    AA07 157
#                                                                       AA07 158
#     ASSIGN DEFAULT FILENAME EXTENSIONS                                AA07 159
#     ----------------------------------                                AA07 160
#                                                                       AA07 161
MASTER=masterfile:#                    Set default master file level    AA07 162
MASTIN='aaa';     MASTOT='aaa'#        Unset master file extensions     AA07 163
DO I=1,99#                             Loop over all devices            AA07 164
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA07 165
J=I/10+1;     K=MOD(I,10)+1#           Point to device numbers          AA07 166
FILEXT(I)=A72(J^J)//A72(K^K)#          Default ext for binary files     AA07 167
FILENM(I)=' '#                         Default name for binary files    AA07 168
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA07 169
FILEXT(IOUNIT(1))='AA1'#               Default archive 1 bdf            AA07 170
FILEXT(IOUNIT(2))='AA2'#               Default archive 2 bdf            AA07 171
FILEXT(iopch:)='PCH'#                  Default punch device file        AA07 172
FILEXT(iofm0:)='FM0'#                  Default line file                AA07 173
FILEXT(iofm1:)='FM1'#                  Default line file                AA07 174
FILEXT(iofm2:)='FM2'#                  Default line file                AA07 175
FILEXT(ioda1:)='DA1'#                  Default direct acc file          AA07 176
FILEXT(ioda2:)='DA2'#                  Default direct acc file          AA07 177
FILEXT(ioda3:)='DA3'#                  Default direct acc file      ^   AA07 178
iopch:=-iopch:#                        Flag punch file as unopened      AA07 179
#                                                                       AA07 180
#    INITIALIZE VARIOUS BUFFERS & TITLE                                 AA07 181
#    ----------------------------------                                 AA07 182
#                                                                       AA07 183
DO K=1,mxfdim:#                        Loop over the input fields       AA07 184
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA07 185
BUFORD(K)=K#                           Insert default order number      AA07 186
BUFPNT(K)=mxchim:#                     Set all fields to maximum        AA07 187
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA07 188
movechar:(A71,1,BLANK,1,mxchwd:,1)#    Blank out common blank word      AA07 189
movechar:(A71,1,TITLE,1,mxcout:,1)#    Blank out title buffer           AA07 190
movechar:(A71,1,CHROT,1,mxcout:,1)#    Blank out line output buffer     AA07 191
movechar:(A71,1,CHRIN,1,mxchim:,1)#    Blank out input line buffer      AA07 192
movechar:(A71,1,CHRIP,1,mxchim:,1)#    Blank out input line buffer      AA07 193
movechar:(A71,1,TITLE,1,NA71,0)#       Put system name into title       AA07 194
getdate:(DATUM)#                       Get execution date dd/mm/yy      AA07 195
movechar:(DATUM,1,TITLE,18,8,0)#       Store date in title line         AA07 196
movechar:(A73,1,TITLE,43,NA73,0)#      Store version number in title    AA07 197
movechar:(A74,1,TITLE,50,NA74,0)#      Store update in title        ^^
#                                                                       AA07 199
RETURN#                                                                 AA07 200
END#                                                                    AA07 201
systemheader:(AA08)#                   Program start/finish/report      AA08   1
######################################################################  AA08   2
##                                                                   #  AA08   3
##                              AA08 (used in initprg:)              #  AA08   4
##                                                                   #  AA08   5
######################################################################  AA08   6
SUBROUTINE AA08#                                                        AA08   7
include:(AACOMN)#                      S.r.hall oct 89                  AA08   8
#                                                                       AA08   9
INTEGER I,J,IFST#                                                       AA08  10
chardata:(A01," Time  h  m  s     CPU secs    Total CPU secs    $#      AA08  11
 Memory words")#                                                        AA08  12
chardata:(A02,' >>> master file  xxxxxx.xxx --> bdf  xxxxxx.xxx')#      AA08  13
chardata:(A03,[" >>>>> ARCHIVE files interchanged. A in: xxxxxx.xxx$#   AA08  14
   B out: xxxxxx.xxx"])#                                                AA08  15
chardata:(A04," *** Begin        ***")#                                 AA08  16
chardata:(A05," ********************")#                                 AA08  17
chardata:(A06,                -)#                                       AA08  18
realdata:(FMT,[271052.,451052.,601013.])#                               AA08  19
datastuff:#                                                             AA08  20
#                                                                       AA08  21
#     LIST TIME/MEMORY REPORT                                           AA08  22
#     -----------------------                                           AA08  23
#                                                                       AA08  24
getcpus:(BUFOT(2))#                    Get cpu time in seconds          AA08  25
BUFOT(1)=BUFOT(2)-ELAPST#              Calculate elapsed cpu time       AA08  26
ELAPST=BUFOT(2)#                       Restore last elapsed time        AA08  27
BUFOT(3)=FLOAT(QXCUR)#                 Store max qx used                AA08  28
#                                                                       AA08  29
IF(PROGID!='      ')#                  Enter after 1st calculation      AA08  30
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA08  31
IFST=no:#                              Reset the first flag             AA08  32
gettime:(A06);    LINRM=3#             Get wallclock time hh:mm:ss      AA08  33
ncodefld:(BUFOT,1,CHROT,FMT,3)#        Set up time report               AA08  34
movechar:(A06,1,CHROT,7,8,0)#          Insert wallclock time in buf     AA08  35
writeline:(1,A01,NA01,2,2)#            Output first heading             AA08  36
movechar:(A06,17,CHROT,2,79,1)#        Insert '-' to mark prog end      AA08  37
writeline:(1,0,0,1,2)#                 Output end of program line       AA08  38
IF(IOUNIT(1)!=INPBDF)#                 Test if file a changed           AA08  39
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA08  40
I=INPBDF;    J=IOUNIT(1)#              Get prev & new device numbers    AA08  41
movechar:(FILENM(J),1,A03,42,10,0)#    Insert filename of input         AA08  42
movechar:(FILENM(I),1,A03,62,10,0)#    Insert filename of output        AA08  43
IF(FILENM(I)(1^1)==' ') J=54; ELSE J=71# Get length of message          AA08  44
writeline:(1,A03,J,2,1)#               Print files line                 AA08  45
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA08  46
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA08  47
ELSE IFST=yes:#                        Flag as first time through       AA08  48
INPBDF=IOUNIT(1)#                      Reset current value of file a    AA08  49
LABMAX=0#                              Reset max length of atom label   AA08  50
PRVOID=yes:#                           Reset voidflg: print to @@@@     AA08  51
PRHIST=no:#                            Reset file a hist print flag     AA08  52
QUITF=' '#                             Reset error flag to null         AA08  53
#                                                                       AA08  54
#     IDENTIFY NEXT PROGRAM                                             AA08  55
#     ---------------------                                             AA08  56
#                                                                       AA08  57
readline:(PRGLST,PNTPRG)#              Read next line & identify        AA08  58
movechar:(PRGLST,LINID*7-6,PROGID,1,6,0)# Move name current program     AA08  59
movechar:(PROGID,1,TITLE,2,6,0)#       Insert program id in title       AA08  60
#                                                                       AA08  61
#     GET MASTER FILE IF REQUESTED                                      AA08  62
#     ----------------------------                                      AA08  63
#                                                                       AA08  64
IF(IFST==yes:&MASTER==yes:)#           Get master archive file          AA08  65
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA08  66
FILEXT(iofm0:)=MASTIN#                 Define fmt as xtal archive       AA08  67
inquirefile:(iofm0:,I,' ')#            Inquire if read file exists      AA08  68
IF(I==yes:)#                           Copy files only if it does       AA08  69
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA08  70
openfmt:(iofm0:,' ')#                  Open xtal archive file           AA08  71
CALL AA20#                             Transfer master file to bdf      AA08  72
movechar:(FILENM(iofm0:),1,A02,19,10,0)# Insert requested filename      AA08  73
movechar:(FILENM(IOUNIT(1)),1,A02,39,10,0)# Insert requested filename   AA08  74
writeline:(1,A02,NA02,2,3)#            Tell user master file read       AA08  75
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA08  76
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA08  77
qxmemory:(QXSTR)#                      Reset start of memory            AA08  78
#                                                                       AA08  79
#     PRINT PROGRAM NAME                                                AA08  80
#     ------------------                                                AA08  81
#                                                                       AA08  82
movechar:(PROGID,1,A04,12,6,0)#        Insert program id in title       AA08  83
LINRM=12#                              Ensure room for new start        AA08  84
writeline:(1,A05,NA05,3,2)#            Tell user program to begin       AA08  85
writeline:(0,A04,NA04,3,2)#            Tell user program to begin       AA08  86
writeline:(0,A05,NA05,3,2)#            Tell user program to begin       AA08  87
#                                                                       AA08  88
RETURN#                                                                 AA08  89
END#                                                                    AA08  90
systemheader:(AA09)#            ## Compare char string to list string   AA09   1
#####################################################################   AA09   2
##                                                                  #   AA09   3
##                         AA09 (used in compchar:)                 #   AA09   4
##                                                                  #   AA09   5
#####################################################################   AA09   6
SUBROUTINE AA09(STRG,IS,LIST,IL,LEN,STEP,END,KEY)# S.r.hall 89          AA09   7
INTEGER IS,IL,LEN,STEP,END,KEY,II,JJ,JS,I,KK#                           AA09   8
string:(STRG,*); string:(LIST,*)#                                       AA09   9
#                                                                       AA09  10
KEY=0#                                 Reset key to no match            AA09  11
II=IL-1; JJ=II+LEN-1; JS=IS+LEN-1#     Reset search pointers            AA09  12
KK=END-LEN+1#                          Protect against over run         AA09  13
DO I=1,KK,STEP#                        Loop along list string           AA09  14
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA09  15
KEY=KEY+1#                             Count the steps                  AA09  16
IF(STRG(IS^JS)==LIST(II+I^JJ+I)) RETURN# Exit with match                AA09  17
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA09  18
KEY=0#                                 Reset key to no match            AA09  19
RETURN#                                                                 AA09  20
END#                                                                    AA09  21
systemheader:(AA10)#                   Copy bdf1 to bdf2                AA10   1
#####################################################################   AA10   2
##                                                                  #   AA10   3
##                         AA10 (used in copybdf:)                  #   AA10   4
##                                                                  #   AA10   5
#####################################################################   AA10   6
SUBROUTINE AA10(FROM,TO)#              S.r. hall apr 89                 AA10   7
include:(AACOMN)#                                                       AA10   8
#                                                                       AA10   9
INTEGER I,J,K,M,N#                                                      AA10  10
INTEGER FROM,TO,IR,IW#                                                  AA10  11
#                                                                       AA10  12
#    OPEN FILES AND COPY                                                AA10  13
#    -------------------                                                AA10  14
#                                                                       AA10  15
IR=FROM;    IW=TO#                     Store logical unit numbers       AA10  16
inquirefile:(IR,I,' ')#                Inquire if read file exists      AA10  17
IF(I==yes:)#                           Copy files only if it does       AA10  18
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA10  19
I=QXCUR#                               Define the start of a buffer     AA10  20
incrqx:(J,I+bdfbuf:,AA1001)#           Get buffer space for copy        AA10  21
bdfreadopen:(IR)#                      Open the binary file             AA10  22
bdfwriteopen:(IW)#                     Open the binary file             AA10  23
M=0#                                   Reset io read error flag         AA10  24
FOR(N=0;N>=0;N=N+1)#                   Loop over contents of file       AA10  25
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA10  26
bdfread:(IR,N,(QX(K),K=I+1,J))#        Read the binary file             AA10  27
bdfwrite:(IW,N,(QX(K),K=I+1,J))#       Write to binary file             AA10  28
ifvo:(QX(J)) BREAK#                    Exit if last record              AA10  29
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA10  30
bdfclose:(IR)#                         Close the read  bdf              AA10  31
bdfclose:(IW)#                         Close the write bdf              AA10  32
qxmemory:(I)#                          Reset memory pointer             AA10  33
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA10  34
#                                                                       AA10  35
RETURN#                                                                 AA10  36
END#                                                                    AA10  37
systemheader:(AA11)#                   Sequential file writer/creater   AA11   1
####################################################################### AA11   2
##                                                                    # AA11   3
##                         AA11 (used in writepkt:)                   # AA11   4
##                                                                    # AA11   5
####################################################################### AA11   6
SUBROUTINE AA11(ODISC,REC,PACK,IPT)#   R.olthof   january 1981          AA11   7
include:(AACOMN)#                      S.r. hall  november 1981         AA11   8
#                                                                       AA11   9
CHARACTER*8 CH#                        Timeclock: value                 AA11  10
CHARACTER*8 DATUM#                     Date: value                      AA11  11
INTEGER    HEAD#                       Pointer to head of lr            AA11  12
INTEGER    IPT#                        Pointer to next packet           AA11  13
INTEGER    K#                          Number chars in lr 1             AA11  14
INTEGER    L#                          Number words in lr 1             AA11  15
INTEGER    LBUF#                       Last word of buffer              AA11  16
INTEGER    LPAK#                       Current packet length            AA11  17
INTEGER    M#                          Number words in lr 1 packet      AA11  18
INTEGER    NREC#                       Current log record type          AA11  19
INTEGER    ODISC#                      Output file number               AA11  20
INTEGER    PACK#                       Requested packet size            AA11  21
INTEGER    REC#                        Logical record number            AA11  22
INTEGER    TAG#                        End-of-phys.rec marker           AA11  23
#                                                                       AA11  24
#------------------------------------------------------------------     AA11  25
#                                                                       AA11  26
# LOGICAL RECORD (LR)                                                   AA11  27
# -------------------                                                   AA11  28
# WORD 1     LENGTH OF LR (WHOLE RECORD OR PART OF IT IN GIVEN PR)      AA11  29
# WORD 2     LOGICAL RECORD NUMBER                                      AA11  30
# WORD 3     RECORD PACKET SIZE                                         AA11  31
#                                                                       AA11  32
# PHYSICAL RECORD (PR)                                                  AA11  33
# --------------------                                                  AA11  34
# LENGTH     BINSEQBUF:                                                 AA11  35
# LAST WORD  +1 IF END OF PR IS     END OF LR                           AA11  36
#            -1 IF END OF PR IS NOT END OF LR                           AA11  37
#                                                                       AA11  38
# AACOMN PARAMETERS                                                     AA11  39
# ----------------                                                      AA11  40
# IOLRHD(U)   0 VALUE BEFORE FIRST ACCESS OF FILE U & AFTER CLOSE       AA11  41
#            -1 AFTER REWIND                                            AA11  42
#            +H POINTER TO HEAD OF CURRENT LR                           AA11  43
# IOPKPT(U)   0 INITIAL VALUE; AFTER EOR; AFTER REWIND; AFTER CLOSE     AA11  44
#            -H AFTER LR NOT FOUND                                      AA11  45
#            IP CONTAINS POINTER TO NEXT PACKET                         AA11  46
# IOPRCT(U)     PHYSICAL RECORD COUNT                                   AA11  47
# IORWFL(U)     READ/WRITE FLAG                                         AA11  48
#             0 READ- OR WRITE-ONLY MODE                                AA11  49
#             V FILE (READ FROM)/(WRITE TO) UNIT U AND (WRITE TO)       AA11  50
#               /(READ FROM) UNIT V                                     AA11  51
#            -V AS ABOVE, BUT NOW IN COPY MODE (SEE AA12)               AA11  52
#                                                                       AA11  53
# MODES                                                                 AA11  54
# -----                                                                 AA11  55
# WRITE-ONLY AA11  1 FILE   1 BUFFER IN QX                              AA11  56
# READ-ONLY  AA12  1 FILE   1 BUFFER IN QX  ODISC=0                     AA11  57
# READ/WRITE AA12  1 FILE   1 BUFFER IN QX  UNIT(IDISC)=UNIT(ODISC)     AA11  58
#                  2 FILES  1 BUFFER IN QX  UNIT(IDISC)#UNIT(ODISC)     AA11  59
# COPY       AA12  2 FILES  2 BUFFERS IN QX UNIT(IDISC)=UNIT(ODISC)     AA11  60
#                                                                       AA11  61
#                                                                       AA11  62
#       TEST IF FIRST ENCOUNTER WITH FILE                               AA11  63
#       ---------------------------------                               AA11  64
#                                                                       AA11  65
IF(IOLRHD(ODISC)<=0)#                  Test first call of odisc         AA11  66
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA11  67
HEAD=IOMARK(ODISC)#                    Pointer to head of buffer        AA11  68
QX(HEAD+1)=3.#                         Default for empty lr 1           AA11  69
QX(HEAD+2)=FLOAT(REC)#                 Simulate record no. 1            AA11  70
QX(HEAD+3)=FLOAT(PACK)#                Packet size                      AA11  71
IPT=HEAD+3#                            Set packet pointer               AA11  72
#                                                                       AA11  73
IF(IORWFL(ODISC)==0)#                  *******write-only mode           AA11  74
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA11  75
CALL AA14(1,ODISC)#                    Open output file                 AA11  76
#                                                                       AA11  77
IF(REC==1)#                            ******** start new file          AA11  78
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA11  79
M=incr:(arith:(23,/,mxchwd:))#         Words needed for packet          AA11  80
L=50*M#                                Allow 50 packets of lr 1         AA11  81
K=L*mxchwd:#                           Number of chars in lr 1          AA11  82
QX(HEAD+3)=FLOAT(L)#                   Store packet size                AA11  83
movector:(BLANK,1,QX(HEAD+4),1,K,1)#   Blank all packets                AA11  84
movector:(COMPID,1,QX(HEAD+4),1,6,0)#  Compound id in packet 1          AA11  85
L=M*mxchwd:+1#                         Point to start of record         AA11  86
movector:(PROGID,1,QX(HEAD+4),L,6,0)#  Program id in packet 2           AA11  87
getdate:(DATUM)#                       Get execution date dd/mm/yy      AA11  88
##movechar:(DATUM,1,QX(HEAD+4),L+7,8,0)# Date in packet 2               AA11  89
movector:(DATUM,1,QX(HEAD+4),L+7,8,0)# Date in packet 2                 AA11  90
##movector:(TITLE,18,QX(HEAD+4),L+7,8,0)# Date in packet 2              AA11  91
gettime:(CH)#                          Get time as hh:mm:ss             AA11  92
movector:(CH,1,QX(HEAD+4),L+16,8,0)#   Store time in packet 2           AA11  93
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA11  94
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA11  95
IOLRHD(ODISC)=HEAD#                    Pointer to head of lr            AA11  96
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA11  97
#                                                                       AA11  98
#   GET PACKET POINTER OF EXISTING FILE                                 AA11  99
#   -----------------------------------                                 AA11 100
#                                                                       AA11 101
ELSE#                                  ******** existing file           AA11 102
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA11 103
HEAD=IOLRHD(ODISC)#                    Pointer to record header         AA11 104
QX(HEAD+1)=QX(HEAD+1)+QX(HEAD+3)#      Add up total words stored        AA11 105
IPT=IOPKPT(ODISC)+ NINT(QX(HEAD+3))#   Increment packet pointer         AA11 106
#                                                                       AA11 107
#     CHECK STATUS OF PHYSICAL BUFFER                                   AA11 108
#     -------------------------------                                   AA11 109
#                                                                       AA11 110
NREC=NINT(QX(HEAD+2))#                 Current record type              AA11 111
LPAK=NINT(QX(HEAD+3))#                 Current packet length            AA11 112
LBUF=IOMARK(ODISC)+bdfbuf:#            Last word of buffer              AA11 113
IF((REC!=NREC)\(IPT+LPAK>=LBUF))#      Test room for current lr         AA11 114
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA11 115
TAG=0#                                 Reset eor marker                 AA11 116
IF(REC==NREC)           TAG=-1.#       Lr continues in next pr          AA11 117
ELSE#                                                                   AA11 118
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA11 119
IF(PACK>=arith:(bdfbuf:,-,3)) iquit:(AA1101)# Pack is too big           AA11 120
LPAK=PACK#                             Set new packet size              AA11 121
IF((IPT+PACK+3)>=LBUF) TAG=+1.#        Lr finishes in this pr           AA11 122
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA11 123
IF(TAG==0)  HEAD=IPT#                  If not end of pr                 AA11 124
ELSE#                                  Lr full/ write & reset           AA11 125
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA11 126
QX(IPT+1)=TAG#                         Mark eor in this pr              AA11 127
CALL AA14(4,ODISC)#                    Write physical record            AA11 128
HEAD=IOMARK(ODISC)#                    Start header in next pr          AA11 129
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA11 130
IPT=HEAD+3#                            Reset packet pointer             AA11 131
IOLRHD(ODISC)=HEAD#                    Reset header pointer             AA11 132
QX(HEAD+1)=3.0#                        Start next lr or pr              AA11 133
QX(HEAD+2)=FLOAT(REC)#                 Record number                    AA11 134
QX(HEAD+3)=FLOAT(LPAK)#                Packet size                      AA11 135
IF(REC>=endrecord:)#                   Is finish requested              AA11 136
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA11 137
CALL AA14(5,ODISC);   IPT=0#           Eof,close,rewind                 AA11 138
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA11 139
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA11 140
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA11 141
#                                                                       AA11 142
IOPKPT(ODISC)=IPT#                     Store packet pointer             AA11 143
#                                                                       AA11 144
RETURN#                                                                 AA11 145
END#                                                                    AA11 146
systemheader:(AA12)#                   Read and/or write a bdf          AA12   1
######################################################################  AA12   2
##                                                                   #  AA12   3
##                        AA12 (used in readwpkt:)                   #  AA12   4
##                                                                   #  AA12   5
######################################################################  AA12   6
SUBROUTINE AA12(IDISC,REC,PACK,IP,ODISC)# R.olthof   january 1981       AA12   7
include:(AACOMN)#                      S.r. hall november 1981          AA12   8
#                                                                       AA12   9
string:(CH,24)#                        Local character buffer           AA12  10
INTEGER   HEAD#                        Pointer to head of lr            AA12  11
INTEGER   I,J,K,L,M,N#                 Local index variables            AA12  12
INTEGER   IDISC#                       Input file unit                  AA12  13
INTEGER   IP#                          Start of input packet            AA12  14
INTEGER   LINRMH#                      Protect line room code           AA12  15
INTEGER   ODISC#                       Output file unit                 AA12  16
INTEGER   OUT#                         Designated output file           AA12  17
INTEGER   PACK#                        Packet size from lr              AA12  18
INTEGER   REC#                         Logical record number            AA12  19
#                                                                       AA12  20
chardata:(A121,' Input xxxxxx.xxx with file history... XXXXXX')#        AA12  21
chardata:(A123,123)#                                                    AA12  22
SAVE#                                                                   AA12  23
datastuff:#                                                             AA12  24
#                                                                       AA12  25
#---------------------------------------------------------------        AA12  26
#  FOR AA11 NOTES FOR DETAILS AND OPERATION OF THIS ROUTINE             AA12  27
#---------------------------------------------------------------        AA12  28
#                                                                       AA12  29
IF(REC>=endrecord:&IORWFL(IDISC)<=0)#  Test for read endrecord:         AA12  30
CALL AA14(7,IDISC)#                    End input file in read or co     AA12  31
#                                                                       AA12  32
#    TEST FOR FIRST READ OF FILE                                        AA12  33
#    ===========================                                        AA12  34
#                                                                       AA12  35
ELSE#                                  All other reads                  AA12  36
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA12  37
IF(IOLRHD(IDISC)<=0)#                  Test first call of idisc         AA12  38
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA12  39
LINRMH=LINRM#                          Protect linrm                    AA12  40
IORWFL(IDISC)=ODISC#                   Set r/w or copy flag             AA12  41
CALL AA14(2,IDISC)#                    ***** open/read i/p file         AA12  42
HEAD=IOMARK(IDISC)#                    Pointer to head of lr            AA12  43
#                                                                       AA12  44
#    READ HISTORY RECORD (LR1) IF PRESENT                               AA12  45
#    --------------------------------------                             AA12  46
#                                                                       AA12  47
IF(NINT(QX(HEAD+2))==1)#               Is lr1 present.....              AA12  48
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA12  49
movertoc:(QX(HEAD+4),1,CH,1,8,0)#      Move compound i.d., key          AA12  50
IF(CH(8^8)!=' ') iquit:(AA1210)#       This is a 2.6 or earlier bdf     AA12  51
IF(PRHIST!=IDISC&(IOLRHD(IDISC)==0\ODISC!=0))# 1st access of file       AA12  52
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA12  53
I=IOUNIT(IDISC);    PRHIST=IDISC#      Get input disc device number     AA12  54
movechar:(FILENM(I),1,A121,8,10,0)#    Insert file name                 AA12  55
movechar:(CH,1,A121,40,6,0)#           Insert compound id               AA12  56
writeline:(1,A121,NA121,3,3)#          Print history header             AA12  57
L=mxchwd:*NINT(QX(HEAD+3))#            Packet size in chars             AA12  58
K=L/50;  I=2#                          Record size in chars             AA12  59
DO J=K+1,L,K#                          Loop over history record         AA12  60
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA12  61
movertoc:(QX(HEAD+4),J,CH,1,1,0)#      Extract program id               AA12  62
compchar:(BLANK,1,CH,1,1,1,1,N)#       Test blank program i.d.          AA12  63
IF(N!=0) BREAK#                        Quit printing when blank         AA12  64
IF(I>(80-K))#                          Test print line length           AA12  65
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA12  66
writeline:(0,0,0,1,3); I=2#            Print file history               AA12  67
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA12  68
movertoc:(QX(HEAD+4),J,CHROT,I,K,0)#   Store program on op line         AA12  69
I=I+K+2#                               Increment print column           AA12  70
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA12  71
writeline:(0,0,0,1,3)#                 Write last line                  AA12  72
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA12  73
#                                                                       AA12  74
IF(ODISC!=0)#                          ********update history           AA12  75
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA12  76
IF(J>L)#                               Packets have been written        AA12  77
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA12  78
M=2*K+1; L=L-K#                        Pointer to third pack            AA12  79
DO J=M,L,K#                            Loop packet 3 until n-1          AA12  80
$(#                                    5>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA12  81
movertoc:(QX(HEAD+4),J+K,CH,1,K,0)#    Store program name               AA12  82
movector:(CH,1,QX(HEAD+4),J,K,0)#      Shift to new location            AA12  83
$)#                                    5<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA12  84
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA12  85
movector:(PROGID,1,QX(HEAD+4),J,6,0)#  Move program i.d. into list      AA12  86
movector:(TITLE,18,QX(HEAD+4),J+7,8,0)# Move date into list             AA12  87
gettime:(CH)#                          Get local time as hh:mm:ss       AA12  88
movector:(CH,1,QX(HEAD+4),J+16,8,0)#   Move time into list              AA12  89
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA12  90
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA12  91
#                                                                       AA12  92
#      INITIALIZE OUTPUT FILE                                           AA12  93
#      ----------------------                                           AA12  94
#                                                                       AA12  95
IF(ODISC!=0)#                          Read/write or copy mode          AA12  96
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA12  97
OUT=IABS(ODISC)#                       Pick up output unit              AA12  98
IF(IOUNIT(IDISC)!=IOUNIT(OUT))#        Are i/p & o/p same device        AA12  99
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA12 100
IORWFL(OUT)=SIGN(IDISC,ODISC)#         Set r/w or copy flag             AA12 101
CALL AA14(1,OUT)#                      ***** open output file           AA12 102
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA12 103
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA12 104
#                                                                       AA12 105
LINRM=LINRMH#                          Reset lineroom counter           AA12 106
IOLRHD(IDISC)=HEAD#                    Point to head of first lr        AA12 107
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA12 108
#                                                                       AA12 109
#                                                                       AA12 110
#     FILE HAS ALREADY BEEN ACCESSED                                    AA12 111
#     ==============================                                    AA12 112
#                                                                       AA12 113
ELSE#                                  Idisc was called before          AA12 114
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 AA12 115
HEAD=IOLRHD(IDISC)#                    Set pointer to head of lr        AA12 116
IF( NINT(QX(HEAD+2))==REC)#            Requested lr is in buffer        AA12 117
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 AA12 118
PACK=NINT(QX(HEAD+3))#                 Packet size of record            AA12 119
IF(IOPKPT(IDISC)<=0) IOPKPT(IDISC)=HEAD+3#                              AA12 120
ELSE IOPKPT(IDISC)=IOPKPT(IDISC)+PACK# Increment packet pointer         AA12 121
IF(REC!=endrecord:)#                   Don't set ptr for last rec       AA12 122
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 AA12 123
HEAD=HEAD+NINT(QX(HEAD+1))#            Header for next record           AA12 124
IF(IOPKPT(IDISC)<HEAD) GOTO100#        Packet belongs to pr             AA12 125
IF(QX(HEAD+1)>=0.)#                    End of lr                        AA12 126
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 15 AA12 127
IOPKPT(IDISC)=0; GOTO100#              Set flag for end of lr           AA12 128
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 15 AA12 129
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 AA12 130
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 AA12 131
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 AA12 132
#                                                                       AA12 133
#    SEARCH FOR REQUESTED LR, WRITE/READ A PHYSICAL RECORD              AA12 134
#    ======================================================             AA12 135
#                                                                       AA12 136
OUT=IORWFL(IDISC)#                     Pick up read/write flag          AA12 137
REPEAT#                                Loop over packets & lr           AA12 138
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16 AA12 139
IF(QX(HEAD+1)<=1.5)#                   Test if buffer exhausted         AA12 140
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 17 AA12 141
IF(OUT>0) CALL AA14(4,OUT)#            ***** write in r/w mode          AA12 142
CALL AA14(3,IDISC)#                    ***** read next pr               AA12 143
HEAD=IOMARK(IDISC)#                    Extract start of buffer          AA12 144
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 17 AA12 145
IF(NINT(QX(HEAD+2))<REC)#              See if lr found                  AA12 146
HEAD=HEAD+NINT(QX(HEAD+1))#            No; get next header              AA12 147
ELSE#                                  If lr found or past              AA12 148
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 18 AA12 149
IF(REC<endrecord:)#                    No need to close the file        AA12 150
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 19 AA12 151
IF(NINT(QX(HEAD+2))==REC)#             See if requested lr              AA12 152
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 20 AA12 153
IOPKPT(IDISC)=HEAD+3#                  Reset packet pointer             AA12 154
PACK=NINT(QX(HEAD+3))#                 Extract packet pointer           AA12 155
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 20 AA12 156
ELSE IOPKPT(IDISC)=-HEAD#              No: flag to lr not found         AA12 157
IOLRHD(IDISC)=HEAD#                    Advance log rec header           AA12 158
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 19 AA12 159
ELSE#                                  Last one-close the files         AA12 160
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 21 AA12 161
IF(OUT>0)#                             Read/copy same file mode         AA12 162
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 22 AA12 163
IF(IOUNIT(IDISC)!=IOUNIT(OUT)) CALL AA14(7,IDISC)# Two files to close   AA12 164
CALL AA14(5,OUT)#                      Close output file                AA12 165
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 22 AA12 166
ELSE CALL AA14(7,IDISC)#               End input file in read only      AA12 167
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 21 AA12 168
BREAK#                                 Exit from lr search loop         AA12 169
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 18 AA12 170
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 16 AA12 171
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA12 172
#                                                                       AA12 173
100 CONTINUE#                                                           AA12 174
IP=IOPKPT(IDISC)#                      Return packet pointer            AA12 175
#                                                                       AA12 176
RETURN#                                Program and return               AA12 177
END#                                                                    AA12 178
systemheader:(AA13)#                   Binary file copier               AA13   1
######################################################################  AA13   2
##                                                                   #  AA13   3
##                        AA13 (used in copyfile:)                   #  AA13   4
##                                                                   #  AA13   5
######################################################################  AA13   6
SUBROUTINE AA13(IDISC,JDISC,ISTART,ISTOP)# J.m. stewart 1978            AA13   7
include:(AACOMN)#                      Doherty, olthof 1981             AA13   8
#                                      Hall 1981                        AA13   9
INTEGER FINAL#                         Last record copied in loop       AA13  10
INTEGER HEAD#                          Pointer to head of lr            AA13  11
INTEGER IDISC#                         Input file                       AA13  12
INTEGER JDISC#                         Output file                      AA13  13
INTEGER IPAK#                          Pointer to packet in idisc       AA13  14
INTEGER JPAK#                          Pointer to packet in jdisc       AA13  15
INTEGER LPAK#                          Packet length                    AA13  16
INTEGER ISTART#                        First lr to be copied            AA13  17
INTEGER ISTOP#                         Last lr to be copied             AA13  18
INTEGER NREC#                          Index of current lr              AA13  19
#                                                                       AA13  20
#----------------------------------------------------------------       AA13  21
#  COPY LOGICAL RECORDS ISTART TO ISTOP FROM FILE IDISC TO JDISC        AA13  22
#  LOGICAL RECORDS MUST BE SEQUENTIAL BUT SOME MAY BE MISSING.          AA13  23
#----------------------------------------------------------------       AA13  24
#                                                                       AA13  25
IF(ISTART<=ISTOP)#                     Test if copy required            AA13  26
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA13  27
NREC=ISTART#                           Reset lr number marker           AA13  28
FINAL=MIN0(ISTOP,decr:(endrecord:))#   Limit to eof marker              AA13  29
REPEAT#                                Loop lr's to be copied           AA13  30
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA13  31
REPEAT#                                Loop over packets                AA13  32
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA13  33
readwpkt:(IDISC,NREC,LPAK,IPAK,-JDISC)# Point to input packet           AA13  34
IF(IPAK<=0) BREAK#                     Exit when lr complete            AA13  35
writepkt:(JDISC,NREC,LPAK,JPAK)#       Point to output packet           AA13  36
movereal:(QX,IPAK+1,QX,JPAK+1,LPAK,1)# Copy packet ip to op             AA13  37
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA13  38
HEAD=IOLRHD(IDISC)#                    Get current log rec head         AA13  39
IF(IPAK==0) HEAD=HEAD+ NINT(QX(HEAD+1))# Move to next lr header         AA13  40
IF(QX(HEAD+1)<3.) NREC=NREC+1#         Advance one record if eor        AA13  41
ELSE NREC=MAX0(NREC+1, NINT(QX(HEAD+2)))# Skip missing lr's             AA13  42
IF(NREC>FINAL) BREAK#                  Until last record requested      AA13  43
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA13  44
IF(ISTOP>=endrecord:)#                 Test if eof reached              AA13  45
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA13  46
readwpkt:(IDISC,endrecord:,LPAK,IPAK,0)# End input file                 AA13  47
writepkt:(JDISC,endrecord:,4,IPAK)#    Write last packet                AA13  48
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA13  49
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA13  50
#                                                                       AA13  51
RETURN#                                                                 AA13  52
END#                                                                    AA13  53
systemheader:(AA14)#                   Treatment of physical record     AA14   1
######################################################################  AA14   2
##                                                                   #  AA14   3
##                        AA14 (used in AA1* and rewindbdf:)            AA14   4
##                                                                   #  AA14   5
######################################################################  AA14   6
SUBROUTINE AA14(FLAG,DISC)#            R. olthof   january 1981         AA14   7
include:(AACOMN)#                      S.r. hall nov 1981               AA14   8
#                                                                       AA14   9
INTEGER DISC#                          Main input/output unit           AA14  10
INTEGER FLAG#                          Specified control flag           AA14  11
INTEGER HEAD#                          Unsubscripted start of log r     AA14  12
INTEGER I,J,K,L#                       Local variables                  AA14  13
INTEGER NDEV#                          Device number of main unit       AA14  14
INTEGER ODIS#                          Aux input/output unit            AA14  15
#                                                                       AA14  16
#------------------------------------------------------------------     AA14  17
#                  1 OPEN AN OUTPUT FILE ONLY                           AA14  18
#                  2 OPEN AN INPUT FILE AND READ FIRST PR               AA14  19
#                  3 READ NEXT PR                                       AA14  20
#   FLAG MODES     4 WRITE PR                                           AA14  21
#   ----------     5 WRITE LAST PR AND EOF,REWIND,CLOSE(EXCHANGE)       AA14  22
#                  6 EOF,REWIND,CLOSE(EXCHANGE)                         AA14  23
#                  7 REWIND,CLOSE AN INPUT FILE                         AA14  24
#                  8 REWIND IMMEDIATELY                                 AA14  25
#---------------------------------------------------------------------  AA14  26
#                                                                       AA14  27
NDEV=IOUNIT(DISC)#                     Device code of main unit         AA14  28
ODIS=IORWFL(DISC)#                     Unit code of output unit         AA14  29
HEAD=IOLRHD(DISC)#                     Start of log record              AA14  30
#                                                                       AA14  31
IF(FLAG<=2) IOPRCT(DISC)=0#            Initialize pr count              AA14  32
IF((FLAG==1)&(HEAD==0)) bdfwriteopen:(NDEV)# ***** flag=1 ******        AA14  33
#                                                                       AA14  34
ELSE IF(FLAG<6)#                       ***** flag=2,3,4,5 *****         AA14  35
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA14  36
IF((FLAG==2)&(HEAD==0)) bdfreadopen:(NDEV)# Open new read file          AA14  37
IF((FLAG>3)&(ODIS>0))#                 ***** flag=4,5 & r/w ***         AA14  38
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA14  39
J=IOMARK(ODIS)+1#                      Start of output buffer           AA14  40
IF(NDEV==IOUNIT(ODIS))#                Test if i/p & o/p same           AA14  41
IOPRCT(DISC)=IOPRCT(DISC)-1#           Adjust physical rec count        AA14  42
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA14  43
ELSE J=IOMARK(DISC)+1#                 Start of input buffer            AA14  44
K=J+arith:(bdfbuf:,-,1)#               End of buffer                    AA14  45
L=IOPRCT(DISC)#                        Word addr.,mass storage          AA14  46
ifvo:(QX(K)) QX(K)=0.#                 Remove old end-of-file marks     AA14  47
IF(FLAG==5)  QX(K)=voidflg:#           Bdf physical end-of-file mark    AA14  48
IF(FLAG<4)#                            ***** flag=2,3 *****             AA14  49
bdfread:(NDEV,L,(QX(I),I=J,K))#        Read next physical record        AA14  50
ELSE#                                  ***** flag=4,5 *****             AA14  51
bdfwrite:(NDEV,L,(QX(I),I=J,K))#       Write physical record            AA14  52
IOPRCT(DISC)=IOPRCT(DISC)+1#           Increment pr count               AA14  53
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA14  54
#                                                                       AA14  55
IF(FLAG>4)#                            ***** flag=5,6,7,8 *****         AA14  56
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA14  57
IOPKPT(DISC)=0#                        Reset packet pointer             AA14  58
IORWFL(DISC)=0#                        Reset output file indicator      AA14  59
IF(FLAG<8)#                            ***** flag=5,6,7 *****           AA14  60
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA14  61
IOLRHD(DISC)=0#                        Reset logical record pointer     AA14  62
bdfclose:(NDEV)#                       Close the bdf                    AA14  63
IF(FLAG!=7 & DISC==2)#                 If output to fileb               AA14  64
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA14  65
IOLRHD(1)=0#                           Reset logical record pointer     AA14  66
IOUNIT(2)=IOUNIT(1); IOUNIT(1)=NDEV#   Interchange archive files        AA14  67
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA14  68
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA14  69
ELSE IOLRHD(DISC)=-1#                  ***** flag=8 ******              AA14  70
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA14  71
#                                                                       AA14  72
RETURN#                                                                 AA14  73
END#                                                                    AA14  74
systemheader:(AA15)#                   Directory indexing routine       AA15   1
######################################################################  AA15   2
##                                                                   #  AA15   3
##                        AA15 (used in indexpkt:)                   #  AA15   4
##                                                                   #  AA15   5
######################################################################  AA15   6
SUBROUTINE AA15(IDISC,NREC,LPAK,IPNT,JDISC,KEY,IWNT,IREL)#              AA15   7
include:(AACOMN)#                      J.m.stewart september 1978       AA15   8
#                                      R.olthof    january   1981       AA15   9
#                                      S.r hall    1983                 AA15  10
INTEGER I,J,K,L,M,N#                   Working indices                  AA15  11
INTEGER IDISC#                         Input file unit                  AA15  12
INTEGER JDISC#                         Output file unit                 AA15  13
INTEGER ODISC#                         Output file (r/w mode)           AA15  14
INTEGER NREC#                          Logical record number            AA15  15
INTEGER LPAK#                          Input packet length              AA15  16
INTEGER IPNT,JPNT#                     Input packet pointer             AA15  17
INTEGER KEY(4)#                        Control signal array             AA15  18
INTEGER K1,K2,K3,K4#                   Values of key()                  AA15  19
INTEGER IWNT(1)#                       Want list of idnu's              AA15  20
INTEGER IREL(1)#                       Pack location of idnums          AA15  21
INTEGER NPAK#                          Output packet length             AA15  22
chardata:(AA001," Updated LR   contains items...")#                     AA15  23
realdata:(FMT,[70613.,140613.,210613.,280613.,#                         AA15  24
350613.,420613.,490613.,560613.,630613.,700613.])#                      AA15  25
datastuff:#                                                             AA15  26
#                                                                       AA15  27
#------------------------------------------------------------------     AA15  28
#  AA15 FINDS THE RELATIVE POSITION IN THE DIRECTORY PACKET             AA15  29
#  OF THE ID-NUMBERS SUPPLIED IN THE IWNT() ARRAY. THESE                AA15  30
#  POSITIONS ARE PLACED IN THE ARRAY IREL().                            AA15  31
#                                                                       AA15  32
#  THE WANTED IDNUM'S ARE IN THREE CATEGORIES SPECIFIED                 AA15  33
#  BY DELIMITER VALUES STORED IN KEY().                                 AA15  34
#  1.  IDNUM'S STORED IN IWNT() WITH SUBSCRIPTS 1 TO KEY(1)             AA15  35
#      DESIGNATE ITEMS THAT *MUST* BE ON THE INPUT FILE IDISC           AA15  36
#      IN ORDER FOR THE CALLER ROUTINE TO CONTINUE. IF ANY              AA15  37
#      IDNUM IN THIS CATEGORY CANNOT BE FOUND KEY(4) IS                 AA15  38
#      RETURNED WITH A *NEGATIVE INDEX* POINTING TO THE                 AA15  39
#      IWNT() ELEMENT CONTAINING THE MISSING IDNUM.                     AA15  40
#                                                                       AA15  41
#  2.  IDNUM'S STORED IN IWNT() WITH SUBSCRIPTS KEY(1)+1 TO             AA15  42
#      KEY(2) DESIGNATE ITEMS THAT ARE OPTIONAL INPUT FROM              AA15  43
#      FILE IDISC. KEY(4) IS UNEFFECTED BY THIS CATEGORY.               AA15  44
#                                                                       AA15  45
#  3.  IDNUM'S STORED IN IWNT() WITH SUBSCRIPTS KEY(2)+1 TO             AA15  46
#      KEY(3) DESIGNATE ITEMS TO BE ADDED TO OR DELETED FROM            AA15  47
#      THE PACKET DIRECTORY BEFORE OUTPUTTING TO JDISC.                 AA15  48
#      FOR THIS CATEGORY IREL() BETWEEN KEY(2)+1 TO KEY(3)              AA15  49
#      IS RETURNED IN ONE OF TWO FORMS ACCORDING TO THE                 AA15  50
#      PRESET VALUE OF KEY(4).                                          AA15  51
#            KEY(4)=0 TO MODIFY OR ADD ITEMS TO THE O/P                 AA15  52
#            PACKET. NO DELETIONS ARE PERMITTED IN THIS                 AA15  53
#            MODE. NEW IDNUMS ARE ADDED TO THE END OF THE               AA15  54
#            IP PACKET, EXISTING IDNUMS REMAIN UNCHANGED.               AA15  55
#            IREL() CONTAINS THE REL POINTERS IN THE ORDER              AA15  56
#            OF THE IWNT() LIST. MUST BE USED WITH LR'S                 AA15  57
#            WHERE EACH PACKET IS A DIFFERENT DATA SET.                 AA15  58
#                                                                       AA15  59
#            KEY(4)=1 ENABLES ADDITIONS AND/OR DELETIONS                AA15  60
#            TO THE OUTPUT PACKET. IN THIS MODE *ALL*                   AA15  61
#            IDNUM'S NAMED IN KEY(2)+1 TO KEY(3) OF IWNT()              AA15  62
#            ARE FIRST DELETED FROM THE I/P PACKET (IF                  AA15  63
#            THEY EXIST) AND THE +VE IDNUM'S ARE ADDED TO               AA15  64
#            THE END OF THE COMPRESSED PACKET FOR OUTPUT.               AA15  65
#            IREL() IS RETURNED AS A PUSHED-DOWN LIST OF                AA15  66
#            SORTED (ASCENDING MAGNITUDE) PACK POINTERS                 AA15  67
#            TO THE 'DELETE' ITEMS *ONLY*. THIS SPEEDS UP               AA15  68
#            THE SUBSEQUENT DATA PACKET TRANSFERS.                      AA15  69
#            THIS MODE IS DESIGNED PRINCIPALLY FOR ARCH-                AA15  70
#            IVING REFLECTION OR ATOM DATA RECORDS.                     AA15  71
#                                                                       AA15  72
#      KEY(4) IS RETURNED WITH THE OUTPUT PACKET LENGTH.                AA15  73
#                                                                       AA15  74
#  THE SAME IDNUM CAN BE IN BOTH CATEGORY 1. (OR 2.) AND 3.             AA15  75
#  THIS MAKES POSSIBLE THEIR APPLICATION AS INPUT DATA AND              AA15  76
#  SUBSEQUENT REMOVAL FROM THE OUTPUT FILE.                             AA15  77
#  SEE ROUTINES 'FC' AND 'GE' FOR APPLICATIONS OF AA15.                 AA15  78
#------------------------------------------------------------------     AA15  79
#                                                                       AA15  80
#                                                                       AA15  81
K1=KEY(1);   K2=MAX0(K1,KEY(2))#       Set iwnt() delimiters            AA15  82
K4=KEY(4);   K3=MAX0(K2,KEY(3))#       Set iwnt() delimiters            AA15  83
DO I=1,K3+1; IREL(I)=0#                Zero pointer                     AA15  84
I=IOPKPT(IDISC)#                       Get the packet pointer           AA15  85
IF(IOLRHD(IDISC)<=0)J=IOMARK(IDISC)#   Header                           AA15  86
ELSE                J=IOLRHD(IDISC)#   Use header                       AA15  87
IF(IORWFL(IDISC)>0) ODISC=JDISC#       Test for one-buffer r/w          AA15  88
ELSE                ODISC=0#           Supress output file              AA15  89
IF((I<=0)\( NINT(QX(J+2))!=NREC))#     Check position of file           AA15  90
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA15  91
readwpkt:(IDISC,NREC,LPAK,IPNT,ODISC)# Point to input packet            AA15  92
IF(IPNT<=0) GO TO 100#                 Return if no directory found     AA15  93
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA15  94
ELSE IPNT=J+3#                         Point to front of directory      AA15  95
NPAK=LPAK;   M=999999;   N=0#          Set op paklen to ip value        AA15  96
DO K=1,K3#                             Loop over want list              AA15  97
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA15  98
I=IABS(IWNT(K))#                       Get the iwant number             AA15  99
IF(I==M) N=N+1#                        Incr the tag pointer             AA15 100
ELSE     N=0#                          This is a new request            AA15 101
IF(K==K1+1\K==K2+1) N=0#               Take care of cross-boundaries    AA15 102
M=I#                                   Reset the last request           AA15 103
DO J=1,LPAK#                           Loop over directory packet       AA15 104
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA15 105
IF(NINT(QX(IPNT+J))!=I)   NEXT#        Skip if no match                 AA15 106
IF(J+N>LPAK)              N=0#         Reset if past end of packet      AA15 107
IF(NINT(QX(IPNT+J+N))!=I) N=0#         Reset when no new match          AA15 108
L=J+N;             BREAK#              Exit from loop                   AA15 109
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA15 110
IF(J<=LPAK) IREL(K)=L#                 Set rel pointer and tag          AA15 111
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA15 112
DO I=1,K3#                             Loop over want list              AA15 113
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA15 114
IF((IREL(I)<=0)&(I<=K1)) KEY(4)=-I#    Ensure required ip items         AA15 115
IF(I<=K2) NEXT#                        Skip input iwants                AA15 116
IF(IWNT(I)>0) NPAK=NPAK+1#             Incr op pklen for add's          AA15 117
IF(IREL(I)>0) NPAK=NPAK-1#             Decr op pklen for delete's       AA15 118
ELSE IF(K4>0) IREL(I)=10000#           Cull for later sort              AA15 119
ELSE          IREL(I)=-NPAK#           For k4=0 add new word            AA15 120
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA15 121
IF(K4>0)#                              Sort irel in archive mode        AA15 122
FOR(I=K2+1;I<=K3;I=I+1)#               Loop over output items           AA15 123
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA15 124
K=I#                                   Set initial sort value           AA15 125
DO J=I,K3#                             Inner sort loop                  AA15 126
IF(IREL(K)>IREL(J)) K=J#               Sort increasing order            AA15 127
IF(K==I) NEXT#                         Don't swap itself                AA15 128
J=IREL(I); IREL(I)=IREL(K); IREL(K)=J# Exchange elements                AA15 129
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA15 130
#                                                                       AA15 131
IF((JDISC>0)&(ODISC==0))#              Is output directory needed       AA15 132
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA15 133
writepkt:(JDISC,NREC,NPAK,JPNT)#       Point to output packet           AA15 134
J=JPNT+1;  K=K3+1#                     Set opbuff & irel() points       AA15 135
IF(K4>0)   K=K2+1#                     Set start archive list           AA15 136
DO I=1,LPAK#                           Loop over ip packet              AA15 137
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA15 138
QX(J)=QX(IPNT+I)#                      Transfer idnum ip to op          AA15 139
IF(IREL(K)==I) K=K+1#                  Incr to next delete seqnum       AA15 140
ELSE           J=J+1#                  Incr op packet pointer           AA15 141
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA15 142
IF(K3>K2)#                             Test for update items            AA15 143
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA15 144
FOR(I=K2+1;I<=K3;I=I+1)#               Loop over output items           AA15 145
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA15 146
IF(IWNT(I)<0) NEXT#                    Skip delete items                AA15 147
IF(K4==0&IREL(I)>0) NEXT#              Skip existing idnums             AA15 148
QX(J)=FLOAT(IWNT(I));  J=J+1#          Store add idnums to op           AA15 149
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA15 150
IF(K4>0\PPRIOR==5)#                    Selective print of update        AA15 151
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA15 152
I=LINRM; LINRM=4#                      Reset line room for print        AA15 153
ncodefld:(FLOAT(NREC),1,AA001,130223.,1)# Insert values into head       AA15 154
writeline:(1,AA001,NAA001,3,3)#        Print contents header            AA15 155
DO J=1,NPAK,10#                        Loop over op directory           AA15 156
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA15 157
K=MIN0(10,NPAK-J+1)#                   Truncate line to items           AA15 158
ncodefld:(QX,JPNT+J,CHROT,FMT,K)#      Format ten idnums                AA15 159
writeline:(0,0,0,1,3)#                 Print line of op idnums          AA15 160
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA15 161
LINRM=I#                               Reset line room counter          AA15 162
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA15 163
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA15 164
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA15 165
#                                                                       AA15 166
FOR(I=K2+1;I<=K3;I=I+1) IREL(I)=IABS(IREL(I))# Reset new k4=0 items     AA15 167
IF(KEY(4)>=0) KEY(4)=NPAK#             Store op packet length           AA15 168
#                                                                       AA15 169
100 CONTINUE#                                                           AA15 170
RETURN#                                                                 AA15 171
END#                                                                    AA15 172
systemheader:(AA20)#                   Input archive cif                AA20   1
######################################################################  AA20   2
#                                                                    #  AA20   3
#                             AA20  (CF40 IN CIFIO)                  #  AA20   4
#                                                                    #  AA20   5
######################################################################  AA20   6
SUBROUTINE AA20#                                                        AA20   7
include:(AACOMN)#                                                       AA20   8
#                                                                       AA20   9
macro:(eof:,IF(IEOF==yes:)GOTO500)#                                     AA20  10
macro:(putpakt:,$(CALL AA21(STRG,NSTR,$1,LO,HI,REP,NCHR,IEOF);eof:$))#  AA20  11
macro:(puthkle:,$(CALL AA22(STRG,NSTR,IP,K,IDN1(K),NCHR,IEOF);eof:$))#  AA20  12
macro:(getstrg:,$(CALL AA23(STRG,NSTR,NTYP,NCHR,IEOF);eof:$))#          AA20  13
macro:(getline:,$(CALL AA24(NCHR,IEOF);eof:$))#                         AA20  14
macro:(getnumb:,$(CALL AA25(STRG,NSTR,RNUM,SDEV,NCHR)$))#               AA20  15
macro:(mxwd8c:,incr:(arith:( 7,/,mxchwd:)))#                            AA20  16
macro:(mxwd12:,incr:(arith:(11,/,mxchwd:)))#                            AA20  17
macro:(mxwd20:,incr:(arith:(19,/,mxchwd:)))#                            AA20  18
macro:(mxwd24:,incr:(arith:(23,/,mxchwd:)))#                            AA20  19
macro:(mxwd40:,incr:(arith:(39,/,mxchwd:)))#                            AA20  20
macro:(mxwd72:,incr:(arith:(71,/,mxchwd:)))#                            AA20  21
macro:(mxwdim:,incr:(arith:(decr:(mxchim:),/,mxchwd:)))#                AA20  22
#                                                                       AA20  23
INTEGER I,IP,MARK,N,NCHR,NSTR,IEOF,NSYM,NTYP#                           AA20  24
INTEGER LO(20),HI(20),REP(20)#         Boundaries of char strings       AA20  25
REAL    RNUM,SDEV#                                                      AA20  26
string:(STRG,80)#                                                       AA20  27
string:(BLOCK,24)#                                                      AA20  28
#                                                                       AA20  29
IOMARK(1)=QXSTR#                       Start of input archive file      AA20  30
incrqx:(MARK,IOMARK(1)+bdfbuf:+1,AA2002)# Get memory for buffer         AA20  31
#                                                                       AA20  32
#   LOOP OVER LOGICAL RECORDS                                           AA20  33
#   -------------------------                                           AA20  34
#                                                                       AA20  35
NCHR=80;   IEOF=no:#                   Set char count to force read     AA20  36
NSYM=0#                                Initialise symop count           AA20  37
REPEAT#                                Loop over string requests        AA20  38
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA20  39
getstrg:#                              Get a char string from arc       AA20  40
#                                                                       AA20  41
100 LO(1)=0#                           Reset char idnum test            AA20  42
IF(STRG(1^5)=='data_') BLOCK=STRG(6^NSTR)# Save the data block code     AA20  43
IF(STRG(1^5)=='loop_') NEXT#           Skip loop commands               AA20  44
#                                                                       AA20  45
#                                                                       AA20  46
IF(STRG(1^5)=='_hist')#                *********** hist *************   AA20  47
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA20  48
writepkt:(1,lrhist:,3,IP)#             Get output packet pointer        AA20  49
movector:(BLANK,1,QX(IP+1),1,1200,1)#  Blank history                    AA20  50
movector:(BLOCK,1,QX(IP+1),1,24,0)#    Store compound id                AA20  51
N=25#                                  Start of history record          AA20  52
getline:#                              Get next line from fmt file      AA20  53
REPEAT#                                Loop over text lines             AA20  54
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA20  55
getline:#                              Get next line from fmt file      AA20  56
IF(HEADOT(1^1)==';') BREAK#            Exit when text finished          AA20  57
movector:(HEADOT,1,QX(IP+1),N,72,0)#   Transfer history to buffer       AA20  58
N=N+72#                                Incr character pointer           AA20  59
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA20  60
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA20  61
#                                                                       AA20  62
ELSE IF(STRG(1^5)=='_labl')#           *********** labl *************   AA20  63
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA20  64
getline:#                              Get next line from fmt file      AA20  65
REPEAT#                                Loop over text lines             AA20  66
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA20  67
getline:#                              Get next line from fmt file      AA20  68
IF(HEADOT(1^1)==';') BREAK#            Exit when text finished          AA20  69
writepkt:(1,lrlabl:,mxwdim:,IP)#       Get output packet pointer        AA20  70
movector:(BLANK,1,QX(IP+1),1,mxchim:,2)# Blank history                  AA20  71
movector:(HEADOT,1,QX(IP+1),1,72,0)#   Transfer label to buffer         AA20  72
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA20  73
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA20  74
#                                                                       AA20  75
ELSE IF(STRG(1^5)=='_cell')#           *********** cell *************   AA20  76
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA20  77
writepkt:(1,lrcell:,9,IP)#             Get output packet pointer        AA20  78
DO I=1,9#                              Loop over cell elements          AA20  79
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 AA20  80
getstrg:; IF(NTYP!=3) iquit:(AA2005)#  String must be a number          AA20  81
getnumb:; QX(IP+I)=RNUM#               Get and store the number         AA20  82
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 AA20  83
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA20  84
#                                                                       AA20  85
ELSE IF(STRG(1^9)=='_symm_pak')#       *********** symm *************   AA20  86
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 AA20  87
IF(NSYM==0) writepkt:(1,lrsymm:,12,IP)# Get output packet pointer       AA20  88
NSYM=NSYM+1#                           Count the symmetry elements      AA20  89
getstrg:; IF(NTYP!=3) iquit:(AA2007)#  String must be a number          AA20  90
getnumb:; QX(IP+NSYM)=RNUM#            Get and store the number         AA20  91
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 AA20  92
ELSE IF(STRG(1^5)=='_symm')#           Get looped symmetry matrices     AA20  93
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 14 AA20  94
DO I=1,11; getstrg:#                   Get remaining _symm data names   AA20  95
REPEAT#                                Loop over symmetry packets       AA20  96
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 15 AA20  97
DO I=1,12#                             Loop over symmetry elements      AA20  98
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16 AA20  99
getstrg:; IF(NTYP!=3&I==1) GOTO 100#   String must be a number          AA20 100
ELSE IF(NTYP!=3) iquit:(AA2010)#       Miscount in elements             AA20 101
IF(I==1) writepkt:(1,lrsymm:,12,IP)#   Get output packet pointer        AA20 102
getnumb:; QX(IP+I)=RNUM#               Get and store the number         AA20 103
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 16 AA20 104
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 15 AA20 105
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 14 AA20 106
#                                                                       AA20 107
ELSE IF(STRG(1^9)=='_sgnm_pak')#       *********** sgnm ************    AA20 108
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 17 AA20 109
REPEAT#                                Loop over possible symbols       AA20 110
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 18 AA20 111
getstrg:#                              Get the sgname string            AA20 112
writepkt:(1,lrsgnm:,mxwd40:,IP)#       Get output packet pointer        AA20 113
movector:(BLANK,1,QX(IP+1),1,40,2)#    Blank output buffer              AA20 114
movector:(STRG,1,QX(IP+1),1,NSTR,0)#   Transfer sgname to buffer        AA20 115
getstrg:#                              Get the sgname string            AA20 116
IF(STRG(1^5)=='loop_') GOTO 100#       Exit when next loop              AA20 117
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 18 AA20 118
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 17 AA20 119
#                                                                       AA20 120
ELSE IF(STRG(1^5)=='_twin')#           *********** twin *************   AA20 121
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 19 AA20 122
DO I=1,12; getstrg:#                   Get remaining _twin data names   AA20 123
REPEAT#                                Loop over twin packets           AA20 124
DO I=1,13#                             Loop over twin elements          AA20 125
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 20 AA20 126
getstrg:; IF(NTYP!=3&I==1) GOTO 100#   String must be a number          AA20 127
ELSE IF(NTYP!=3) iquit:(AA2010)#       Miscount in elements             AA20 128
IF(I==1) writepkt:(1,lrtwin:,13,IP)#   Get output packet pointer        AA20 129
getnumb:; QX(IP+I)=RNUM#               Get and store the number         AA20 130
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 20 AA20 131
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 19 AA20 132
#                                                                       AA20 133
ELSE IF(STRG(1^5)=='_scat')#           *********** scat *************   AA20 134
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 21 AA20 135
LO(1)=11; HI(1)=11; REP(1)=mxwd8c:#    Get repeat scat fac symbol       AA20 136
LO(2)=95; HI(2)=95; REP(2)=mxwd40:#    Get repeat scat fac symbol       AA20 137
LO(3)=0;  putpakt:(lrscat:)#           Generate output packets          AA20 138
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 21 AA20 139
#                                                                       AA20 140
ELSE IF(STRG(1^5)=='_sequ')#           *********** sequ ************    AA20 141
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 22 AA20 142
REPEAT#                                Loop over possible sequences     AA20 143
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 23 AA20 144
getstrg:#                              Get the next string              AA20 145
IF(STRG(1^5)=='loop_') GOTO 100#       Exit when next loop              AA20 146
writepkt:(1,lrsequ:,mxwd8c:,IP)#       Get output packet pointer        AA20 147
movector:(BLANK,1,QX(IP+1),1,8,2)#     Blank output buffer              AA20 148
movector:(STRG,1,QX(IP+1),1,NSTR,0)#   Transfer atom sequ to buffer     AA20 149
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 23 AA20 150
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 22 AA20 151
#                                                                       AA20 152
ELSE IF(STRG(1^5)=='_ddef')#           *********** ddef ************    AA20 153
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 24 AA20 154
REPEAT#                                Loop over possible data defs     AA20 155
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 25 AA20 156
getstrg:#                              Get the next string              AA20 157
IF(STRG(1^5)=='loop_') GOTO 100#       Exit when next loop              AA20 158
writepkt:(1,lrddef:,mxwd12:,IP)#       Get output packet pointer        AA20 159
movector:(BLANK,1,QX(IP+1),1,12,2)#    Blank output buffer              AA20 160
movector:(STRG,1,QX(IP+1),1,NSTR,0)#   Transfer dset name to buffer     AA20 161
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 25 AA20 162
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 24 AA20 163
#                                                                       AA20 164
ELSE IF(STRG(1^5)=='_expl')#           *********** expl *************   AA20 165
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 26 AA20 166
LO(1)= 93; HI(1)= 93; REP(1)=mxwd20:#  Get repeat scat fac symbol       AA20 167
LO(2)=511; HI(2)=515; REP(2)=mxwd40:#  Get repeat meas description      AA20 168
LO(3)=531; HI(3)=535; REP(3)=mxwd40:#  Get repeat rcode criteria        AA20 169
LO(4)=560; HI(4)=560; REP(4)=mxwd20:#  Get crystal colour               AA20 170
LO(5)=561; HI(5)=561; REP(5)=mxwd20:#  Get crystal shape                AA20 171
LO(6)=40;  HI(6)=40;  REP(6)=1#        Get diffractometer type          AA20 172
LO(7)=0;   putpakt:(lrexpl:)#          Generate output data packets     AA20 173
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 26 AA20 174
#                                                                       AA20 175
ELSE IF(STRG(1^5)=='_dset')#           *********** dset *************   AA20 176
putpakt:(lrdset:)#                     Generate output data packets     AA20 177
#                                                                       AA20 178
ELSE IF(STRG(1^5)=='_dict')#           *********** dict *************   AA20 179
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 27 AA20 180
LO(1)=1; HI(1)=2; REP(1)=1#            Get atom and residue names       AA20 181
LO(2)=0; putpakt:(lrdict:)#            Generate output data packets     AA20 182
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 27 AA20 183
#                                                                       AA20 184
ELSE IF(STRG(1^5)=='_graf')#           *********** graf *************   AA20 185
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 28 AA20 186
LO(1)=  1; HI(1)=  1; REP(1)=mxwd8c:#  Plot mole parameters             AA20 187
LO(2)=  2; HI(2)=  2; REP(2)=mxwd24:#  Plot mole parameters             AA20 188
LO(3)=  3; HI(3)=  5; REP(3)=mxwd8c:#  Plot mole parameters             AA20 189
LO(4)= 11; HI(4)= 11; REP(4)=mxwd8c:#  Plot mole parameters             AA20 190
LO(5)= 31; HI(5)= 31; REP(5)=mxwd8c:#  Plot mole parameters             AA20 191
LO(6)= 32; HI(6)= 42; REP(6)=mxwd24:#  Plot mole parameters             AA20 192
LO(7)=101; HI(7)=101; REP(7)=mxwd8c:#  Plot mole parameters             AA20 193
LO(8)=102; HI(8)=102; REP(8)=mxwd24:#  Plot mole parameters             AA20 194
LO(9)=103; HI(9)=105; REP(9)=mxwd8c:#  Plot mole parameters             AA20 195
LO(10)=111;HI(10)=111;REP(10)=mxwd8c:# Plot mole parameters             AA20 196
LO(11)=0;  putpakt:(lrgraf:)#          Generate output data packets     AA20 197
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 28 AA20 198
#                                                                       AA20 199
ELSE IF(STRG(1^5)=='_site')#           *********** site *************   AA20 200
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 29 AA20 201
LO(1)=  1; HI(1)=  1; REP(1)=mxwd24:#  Primary site label               AA20 202
LO(2)= 21; HI(2)= 21; REP(2)=mxwd24:#  Complexed site label             AA20 203
LO(3)=0;  putpakt:(lrsite:)#           Generate output data packets     AA20 204
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 29 AA20 205
#                                                                       AA20 206
ELSE IF(STRG(1^5)=='_atom')#           *********** atom *************   AA20 207
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 30 AA20 208
LO(1)= 14; HI(1)= 14; REP(1)=mxwd24:#  Get repeat atom label            AA20 209
LO(2)= 15; HI(2)= 19; REP(2)=1#        Get repeat atom label codes      AA20 210
LO(3)= 55; HI(3)= 55; REP(3)=mxwd8c:#  Get repeat refinement codes      AA20 211
LO(4)= 56; HI(4)= 58; REP(4)=mxwd40:#  Get repeat refinement codes      AA20 212
LO(5)=300; HI(5)=300; REP(5)=mxwd8c:#  H atom calcat type               AA20 213
LO(6)=310; HI(6)=310; REP(6)=mxwd24:#  H atom parent+1st p dependent    AA20 214
LO(7)=312; HI(7)=312; REP(7)=mxwd24:#  H atom parent+2nd p dependent    AA20 215
LO(8)=314; HI(8)=314; REP(8)=mxwd24:#  H atom parent+3rd p dependent    AA20 216
LO(9)=316; HI(9)=316; REP(9)=mxwd24:#  H atom parent+4th p dependent    AA20 217
LO(10)=320;HI(10)=323;REP(10)=mxwd24:# Covariant h atom sites           AA20 218
LO(11)=0;   putpakt:(lratom:)#         Generate output data packets     AA20 219
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30 AA20 220
#                                                                       AA20 221
ELSE IF(STRG(1^5)=='_cons')#           *********** cons *************   AA20 222
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 31 AA20 223
LO(1)=  1; HI(1)=  1; REP(1)=mxwd24:#  Get repeat subject atom label    AA20 224
LO(2)= 11; HI(2)= 11; REP(2)=mxwd24:#  Get repeat ref 1   atom label    AA20 225
LO(3)= 21; HI(3)= 21; REP(3)=mxwd24:#  Get repeat ref 2   atom label    AA20 226
LO(4)= 31; HI(4)= 31; REP(4)=mxwd24:#  Get repeat ref 3   atom label    AA20 227
LO(5)=0;   putpakt:(lrcons:)#          Generate output data packets     AA20 228
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 31 AA20 229
#                                                                       AA20 230
ELSE IF(STRG(1^5)=='_slav')#           *********** slav ************    AA20 231
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 32 AA20 232
getstrg:;  IF(NTYP!=4) iquit:(AA2015)# Pull in extra data name          AA20 233
REPEAT#                                Loop over packets                AA20 234
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 33 AA20 235
getstrg:; IF(NTYP!=3) GOTO 100#        Get first string & test end      AA20 236
writepkt:(1,lrslav:,2,IP)#             Get output packet pointer        AA20 237
getnumb:;  QX(IP+1)=RNUM#              Store master atom number         AA20 238
getstrg:; IF(NTYP!=3) iquit:(AA2017)#  Loop sequence out of order       AA20 239
getnumb:;  QX(IP+2)=RNUM#              Store master atom number         AA20 240
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 33 AA20 241
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 32 AA20 242
#                                                                       AA20 243
ELSE IF(STRG(1^5)=='_mole')#           *********** mole *************   AA20 244
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 34 AA20 245
LO(1)= 10; HI(1)= 10; REP(1)=mxwd72:#  Get repeat mole formula          AA20 246
LO(2)= 11; HI(2)= 11; REP(2)=mxwd72:#  Get repeat mole formula          AA20 247
LO(3)=0;   putpakt:(lrmole:)#          Generate output data packets     AA20 248
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 34 AA20 249
#                                                                       AA20 250
ELSE IF(STRG(1^5)=='_refl')#           *********** refl *************   AA20 251
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 35 AA20 252
LO(1)=1015; HI(1)=1016; REP(1)=1#      Get repeat goniometer codes      AA20 253
LO(2)=0; putpakt:(lrrefl:)#            Generate output data packets     AA20 254
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 35 AA20 255
#                                                                       AA20 256
ELSE IF(STRG(1^5)=='_thet')#           *********** thet *************   AA20 257
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 36 AA20 258
DO I=1,6; getstrg:#                    Pull in extra data names         AA20 259
REPEAT#                                Loop over packets                AA20 260
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 37 AA20 261
IF(NTYP!=3) GOTO 100#                  Test if loop finished            AA20 262
writepkt:(1,lrthet:,6,IP)#             Get output packet pointer        AA20 263
DO I=1,6#                              Loop over number data            AA20 264
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 38 AA20 265
getnumb:;  QX(IP+I)=RNUM;  getstrg:#   Store dsn h k l 2t wln           AA20 266
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 38 AA20 267
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 37 AA20 268
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 36 AA20 269
#                                                                       AA20 270
ELSE IF(STRG(1^5)=='_sfls')#           *********** sfls *************   AA20 271
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 39 AA20 272
LO(1)= 11; HI(1)= 17; REP(1)=mxwd40:#  Get repeat sfls parameters       AA20 273
LO(2)=0;   putpakt:(lrsfls:)#          Generate output data packets     AA20 274
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 39 AA20 275
#                                                                       AA20 276
ELSE IF(STRG(1^5)=='_rfac')#           *********** rfac ************    AA20 277
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 40 AA20 278
DO I=1,5; getstrg:#                    Pull in extra data names         AA20 279
REPEAT#                                Loop over packets                AA20 280
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 41 AA20 281
getstrg:; IF(NTYP!=3) GOTO 100#        Get first string & test end      AA20 282
writepkt:(1,lrrfac:,arith:(5,+,mxwd40:),IP)# Get output packet pointe   AA20 283
DO I=1,5#                              Loop over number data            AA20 284
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 42 AA20 285
getnumb:;  QX(IP+I)=RNUM;  getstrg:#   Store master atom number         AA20 286
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 42 AA20 287
IF(NTYP!=4) iquit:(AA2025)#            Sequence error - must be char    AA20 288
movector:(BLANK,1,QX(IP+6),1,40,2)#    Blank output buffer              AA20 289
movector:(STRG,1,QX(IP+6),1,NSTR,0)#   Store title info                 AA20 290
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 41 AA20 291
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 40 AA20 292
#                                                                       AA20 293
ELSE IF(STRG(1^5)=='_dens')#           *********** dens *************   AA20 294
putpakt:(lrdens:)#                     Generate output data packets     AA20 295
#                                                                       AA20 296
ELSE IF(STRG(1^5)=='_bond')#           *********** bond *************   AA20 297
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 43 AA20 298
LO(1)= 11; HI(1)= 11; REP(1)=mxwd24:#  Get repeat atom label 1          AA20 299
LO(2)= 21; HI(2)= 21; REP(2)=mxwd24:#  Get repeat atom label 2          AA20 300
LO(3)=0;   putpakt:(lrbond:)#          Generate output data packets     AA20 301
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 43 AA20 302
#                                                                       AA20 303
ELSE IF(STRG(1^5)=='_cont')#           *********** cont *************   AA20 304
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 44 AA20 305
LO(1)= 11; HI(1)= 11; REP(1)=mxwd24:#  Get repeat atom label 1          AA20 306
LO(2)= 21; HI(2)= 21; REP(2)=mxwd24:#  Get repeat atom label 2          AA20 307
LO(3)=0;   putpakt:(lrcont:)#          Generate output data packets     AA20 308
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 44 AA20 309
#                                                                       AA20 310
ELSE IF(STRG(1^5)=='_angl')#           *********** angl *************   AA20 311
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 45 AA20 312
LO(1)= 11; HI(1)= 11; REP(1)=mxwd24:#  Get repeat atom label 1          AA20 313
LO(2)= 21; HI(2)= 21; REP(2)=mxwd24:#  Get repeat atom label 2          AA20 314
LO(3)= 31; HI(3)= 31; REP(3)=mxwd24:#  Get repeat atom label 3          AA20 315
LO(4)=0;   putpakt:(lrangl:)#          Generate output data packets     AA20 316
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 45 AA20 317
#                                                                       AA20 318
ELSE IF(STRG(1^5)=='_dihe')#           *********** dihe *************   AA20 319
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 46 AA20 320
LO(1)= 11; HI(1)= 11; REP(1)=mxwd24:#  Get repeat atom label 1          AA20 321
LO(2)= 21; HI(2)= 21; REP(2)=mxwd24:#  Get repeat atom label 2          AA20 322
LO(3)= 31; HI(3)= 31; REP(3)=mxwd24:#  Get repeat atom label 3          AA20 323
LO(4)= 41; HI(4)= 41; REP(4)=mxwd24:#  Get repeat atom label 4          AA20 324
LO(5)=0;   putpakt:(lrdihe:)#          Generate output data packets     AA20 325
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 46 AA20 326
#                                                                       AA20 327
ELSE IF(STRG(1^5)=='_rigi')#           *********** rigi *************   AA20 328
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 47 AA20 329
LO(1)= 11; HI(1)= 11; REP(1)=mxwd24:#  Get repeat atom label 1          AA20 330
LO(2)= 21; HI(2)= 21; REP(2)=mxwd24:#  Get repeat atom label 2          AA20 331
LO(3)=0;   putpakt:(lrrigi:)#          Generate output data packets     AA20 332
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 47 AA20 333
#                                                                       AA20 334
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA20 335
500 writepkt:(1,endrecord:,3,IP)#      Finish off the file              AA20 336
closefmt:(iofm0:)#                     Close the formatted file         AA20 337
HEADOT=' '#                            Clear buffer area                AA20 338
#                                                                       AA20 339
RETURN#                                                                 AA20 340
END#                                                                    AA20 341
systemheader:(AA21)#                   Place data in packets            AA21   1
######################################################################  AA21   2
#                                                                    #  AA21   3
#                             AA21  PUTPAKT: (CF41 IN CIFIO)         #  AA21   4
#                                                                    #  AA21   5
######################################################################  AA21   6
SUBROUTINE AA21(STRG,NSTR,NREC,LO,HI,REP,NCHR,IEOF)#                    AA21   7
include:(AACOMN)#                                                       AA21   8
#                                                                       AA21   9
INTEGER NW,NITM,NREC,NSTR,NREP#                                         AA21  10
INTEGER LO(*),HI(*),REP(*)#            Boundaries of char strings       AA21  11
INTEGER IDN1(500)#                                                      AA21  12
INTEGER I,IEOF,IP,J,K,NCHR,NTYP#                                        AA21  13
REAL    RNUM,SDEV#                                                      AA21  14
string:(STRG,*)#                                                        AA21  15
string:(NAME,5)#                                                        AA21  16
chardata:(AA1,' >>> Miscount in master file loop - file corrupted')#    AA21  17
datastuff:#                                                             AA21  18
#                                                                       AA21  19
NAME=STRG(1^5)#                        Store logical record name        AA21  20
NITM=0;  DO I=1,500; IDN1(I)=0#        Reset item count & directory     AA21  21
#                                                                       AA21  22
#   SET UP THE DIRECTORY PACKET                                         AA21  23
#   ---------------------------                                         AA21  24
#                                                                       AA21  25
FOR(NW=0;;NW=NW+NREP)#                 Loop over directory words        AA21  26
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA21  27
IF(STRG(1^5)!=NAME) BREAK#             Exit after last directory item   AA21  28
STRG(1^4)=STRG(7^10);   NSTR=4#        Isolate directory number         AA21  29
getnumb:;   K=NINT(RNUM);   NREP=1#    Extract directory number         AA21  30
DO I=1,100#                            Loop over char string idnums     AA21  31
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA21  32
IF(LO(I)==0) BREAK#                    Tests finish on zero             AA21  33
IF(K<LO(I)\K>HI(I)) NEXT#              Test if idnum is char string     AA21  34
NREP=REP(I);  BREAK#                   Get the words per char string    AA21  35
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA21  36
DO I=1,NREP;  IDN1(NW+I)=K#            Store id numbers                 AA21  37
getstrg:;     NITM=NITM+1#             Get another string & count       AA21  38
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA21  39
writepkt:(1,NREC,NW,IP)#               Get output packet pointer        AA21  40
DO I=1,NW; QX(IP+I)=FLOAT(IDN1(I))#    Store id numbers                 AA21  41
#                                                                       AA21  42
#    TRANSFER DATA INTO ALL OTHER PACKETS                               AA21  43
#    ------------------------------------                               AA21  44
#                                                                       AA21  45
REPEAT#                                Loop over output packets         AA21  46
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA21  47
IF(STRG(1^5)=='loop_') BREAK#          Exit when data finished          AA21  48
IF(STRG(1^1)=='_')     BREAK#          Exit when data finished          AA21  49
writepkt:(1,NREC,NW,IP)#               Get output packet pointer        AA21  50
K=1#                                   Start packet word count          AA21  51
DO I=1,NITM#                           Loop over items in packet        AA21  52
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA21  53
IF(NTYP==3)#                           Is this a number                 AA21  54
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA21  55
getnumb:; QX(IP+K)=RNUM; K=K+1#        Store the number                 AA21  56
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA21  57
ELSE IF(NAME=='_refl'&K<4) puthkle:#   Treat hkl and sym packed data    AA21  58
ELSE IF(NAME=='_dset'&(IDN1(I)==10))puthkle:# Treat dset packed data    AA21  59
ELSE#                                  This is a char strg              AA21  60
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA21  61
J=K+1#                                 Incr the word counter            AA21  62
WHILE(IDN1(J)==IDN1(J-1)) J=J+1#       Rcount number of char words      AA21  63
movector:(BLANK,1,QX(IP+K),1,(J-K)*mxchwd:,2)# Blank output buffer      AA21  64
movector:(STRG,1,QX(IP+K),1,NSTR,0)#   Transfer string to buffer        AA21  65
K=J#                                   Reset the word pointer           AA21  66
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA21  67
getstrg:#                              Get the next string              AA21  68
IF((STRG(1^5)=='loop_'\STRG(1^1)=='_')&I<NITM)# Test for loop end       AA21  69
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA21  70
writeline:(1,AA1,NAA1,3,3)#            Print error message              AA21  71
iquit:(AA2105)#                        Illegal loop count               AA21  72
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA21  73
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA21  74
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA21  75
#                                                                       AA21  76
500 RETURN#                                                             AA21  77
END#                                                                    AA21  78
systemheader:(AA22)#                   Process packed hkl & symm data   AA22   1
######################################################################  AA22   2
#                                                                    #  AA22   3
#                             AA22   PUTHKLE:   (CF42 IN CIFIO)      #  AA22   4
#                                                                    #  AA22   5
######################################################################  AA22   6
SUBROUTINE AA22(STRG,NSTR,IP,NW,IDNW,NCHR,IEOF)#                        AA22   7
include:(AACOMN)#                                                       AA22   8
#                                                                       AA22   9
INTEGER I,IEOF,IH,IK,IL,NSTR,IP,NCHR,NW,J,IDNW#                         AA22  10
REAL HKL,RNUM,SDEV#                                                     AA22  11
REAL GE#                                                                AA22  12
string:(STRG,*)#                                                        AA22  13
chardata:(HEXN,'123456789abcdef')#                                      AA22  14
datastuff:#                                                             AA22  15
#                                                                       AA22  16
#    RESTORE PACKED HKL WORD                                            AA22  17
#    -----------------------                                            AA22  18
#                                                                       AA22  19
IF(NW==1&IDNW==1)#                     This is a packed hkl string      AA22  20
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA22  21
NSTR=4#                                Index strings are 4 chars        AA22  22
getnumb:; IH=NINT(RNUM)#               Get the h index                  AA22  23
STRG(1^4)=STRG(5^8)#                   Shift the k index                AA22  24
getnumb:; IK=NINT(RNUM)#               Get the k index                  AA22  25
STRG(1^4)=STRG(9^12)#                  Shift the l index                AA22  26
getnumb:; IL=NINT(RNUM)#               Get the l index                  AA22  27
#                                                                       AA22  28
IF(IH<0) J=4 ; ELSE J=0#               Set h sign bit                   AA22  29
IF(IK<0) J=J+2#                        Set k sign bit                   AA22  30
IF(IL<0) J=J+1#                        Set l sign bit                   AA22  31
intpak:(J,HKL,0,3)#                    Pack hkl sign code               AA22  32
intpak:(IABS(IL),HKL, 3,9)#            Pack l index                     AA22  33
intpak:(IABS(IK),HKL,12,9)#            Pack k index                     AA22  34
intpak:(IABS(IH),HKL,21,bitlen:(21))#  Pack h index                     AA22  35
movepakwd:(HKL,QX(IP+NW))#             Store hkl word in op file        AA22  36
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA22  37
#                                                                       AA22  38
#   RESTORE SYMMETRY PACKED WORD                                        AA22  39
#   ----------------------------                                        AA22  40
#                                                                       AA22  41
ELSE IF(NW==3&IDNW==3)#                This is the packed symmetry wo   AA22  42
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA22  43
movepakwd:(0,HKL)#                     Zero hkl word                    AA22  44
DO I=6,9#                              Loop over hex digits             AA22  45
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA22  46
IF(STRG(I^I)=='0') NEXT#               Skip zeros                       AA22  47
J=INDEX(HEXN,STRG(I^I))#               Get hex number value             AA22  48
IF(J==0) iquit:(AA2205)#               Illegal char in hex number       AA22  49
intpak:(J,HKL,36-I*4,4)#               Pack hex digits                  AA22  50
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA22  51
movepakwd:(HKL,QX(IP+NW))#             Store hkl word in op file        AA22  52
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA22  53
#                                                                       AA22  54
ELSE IF(IDNW==10)#                     Only for lrdset: word 10         AA22  55
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA22  56
movepakwd:(0,GE)#                      Zero hkl word                    AA22  57
DO I=2,9#                              Loop over hex digits             AA22  58
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA22  59
IF(STRG(I^I)=='0') NEXT#               Skip zeros                       AA22  60
J=INDEX(HEXN,STRG(I^I))#               Get hex number value             AA22  61
IF(J==0) iquit:(AA2207)#               Illegal char in hex number       AA22  62
intpak:(J,GE,40-I*4,37-I*4)#           Pack hex digits                  AA22  63
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA22  64
movepakwd:(GE,QX(IP+NW))#              Store hkl word in op file        AA22  65
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA22  66
NW=NW+1#                               Incr the word count              AA22  67
#                                                                       AA22  68
RETURN#                                                                 AA22  69
END#                                                                    AA22  70
systemheader:(AA23)#                   Get char string from fmt file    AA23   1
######################################################################  AA23   2
#                                                                    #  AA23   3
#                             AA23   GETSTRG:   (CF43 IN CIFIO)      #  AA23   4
#                                                                    #  AA23   5
######################################################################  AA23   6
SUBROUTINE AA23(STRG,NSTR,NTYP,NCHR,IEOF)#                              AA23   7
include:(AACOMN)#                                                       AA23   8
#                                                                       AA23   9
INTEGER I,IEOF,NCHR,NSTR,NTYP#                                          AA23  10
string:(C,1)#                                                           AA23  11
string:(STRG,*)#                                                        AA23  12
chardata:(NUM,0123456789+-.)#                                           AA23  13
chardata:(AA1," Warning: unmatched quotes on line      ")#              AA23  14
datastuff:#                                                             AA23  15
#                                                                       AA23  16
#                                                                       AA23  17
FOR(NCHR=NCHR+1;;NCHR=NCHR+1)#         Loop over character in line      AA23  18
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA23  19
IF(NCHR>80)#                           Test if line is finished         AA23  20
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA23  21
getline:#                              Get the next linr from fmt fil   AA23  22
IF(HEADOT(1^1)==';')#                  Exit if start of text            AA23  23
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA23  24
HEADOT(1^1)=' ';     NTYP=5#           Cancel the semicolon             AA23  25
DO I=80,1,-1; IF(HEADOT(I^I)!=' ') BREAK# Search for possible text      AA23  26
IF(I>0) STRG(1^I)=HEADOT(1^I)#         Transfer text to string          AA23  27
NSTR=I; BREAK#                         Return to caller                 AA23  28
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA23  29
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA23  30
C=HEADOT(NCHR^NCHR)#                   Extract single character         AA23  31
IF(C==' '\C==tabchr:) NEXT#            Skip if blank or tab character   AA23  32
IF(C=='#')#                            Start of comment on line         AA23  33
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA23  34
NCHR=80;    NEXT#                      Force a new line                 AA23  35
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA23  36
#                                                                       AA23  37
ELSE IF(C==''''\C=='"')#               Test for leading quote           AA23  38
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA23  39
NCHR=NCHR+1;    NTYP=4#                Skip the leading quote           AA23  40
DO I=NCHR,80#                          Loop over line                   AA23  41
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA23  42
IF(HEADOT(I^I)!=C) NEXT#               Skip non-quotes                  AA23  43
IF(I<80&HEADOT(I+1^I+1)!=' ') NEXT#    Skip imbedded quotes             AA23  44
IF(HEADOT(I-1^I-1)!='\\') BREAK#       Skip special characters          AA23  45
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA23  46
IF(I>80)#                              Test if matching quote missing   AA23  47
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA23  48
ncodefld:(FLOAT(LINMAS),1,AA1,400513.,1)# Format line number            AA23  49
writeline:(1,AA1,NAA1,3,3)#            Print warning message            AA23  50
I=80; HEADOT(I^I)=C#                   Force quote on end of line       AA23  51
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA23  52
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA23  53
#                                                                       AA23  54
ELSE#                                  This is blank bounded string     AA23  55
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA23  56
IF(C=='_')               NTYP=1#       Flag as data name                AA23  57
ELSE IF(INDEX(NUM,C)==0) NTYP=4#       Flag as char string              AA23  58
ELSE                     NTYP=3#       Flag as number string            AA23  59
DO I=NCHR,80; IF(HEADOT(I^I)==' ') BREAK# Look for matching blank       AA23  60
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA23  61
NSTR=I-NCHR;   NCHR=I#                 Get the chars in string          AA23  62
STRG(1^NSTR)=HEADOT(I-NSTR^NCHR)#      Store the string                 AA23  63
BREAK#                                 Go to caller                     AA23  64
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA23  65
#                                                                       AA23  66
500 RETURN#                                                             AA23  67
END#                                                                    AA23  68
systemheader:(AA24)#                   Get a new line from fmt file     AA24   1
######################################################################  AA24   2
#                                                                    #  AA24   3
#                             AA24   GETLINE:   (CF44 IN CIFIO)      #  AA24   4
#                                                                    #  AA24   5
######################################################################  AA24   6
SUBROUTINE AA24(NCHR,IEOF)#                                             AA24   7
include:(AACOMN)#                                                       AA24   8
INTEGER NCHR,IEOF#                                                      AA24   9
#                                                                       AA24  10
readfmt:(iofm0:,'(A80)',100,HEADOT)#   Read another line from fmt fil   AA24  11
NCHR=1;   LINMAS=LINMAS+1#             Reset char and strg type poin    AA24  12
GOTO 200#                              Skip eof flag                    AA24  13
100 IEOF=yes:#                         Eof detected                     AA24  14
200 RETURN#                                                             AA24  15
END#                                                                    AA24  16
systemheader:(AA25)#                   Convert string to number         AA25   1
######################################################################  AA25   2
#                                                                    #  AA25   3
#                             AA25   GETNUMB:  (CF45 IN CIFIO)       #  AA25   4
#                                                                    #  AA25   5
######################################################################  AA25   6
SUBROUTINE AA25(STRG,NSTR,RNUM,SDEV,NCHR)#                              AA25   7
include:(AACOMN)#                                                       AA25   8
#                                                                       AA25   9
INTEGER CCNT,MANT,EXPN,MSIN,ESIN,M,N,NCHR,NSTR,NDEC#                    AA25  10
REAL    RNUM,SDEV#                                                      AA25  11
string:(STRG,*)#                                                        AA25  12
chardata:(TEST,'0123456789+.-()')#                                      AA25  13
chardata:(MESS,' Numeric string expected but not found:')#              AA25  14
datastuff:#                                                             AA25  15
#                                                                       AA25  16
##   components CCNT 11111222223333444                                  AA25  17
##                   -xxxx.xxxx+xxx(x)                                  AA25  18
#                                                                       AA25  19
RNUM=voidflg:;  SDEV=0.#               Set default values               AA25  20
IF(STRG(1^NSTR)=='?') RETURN#          Value is unknown                 AA25  21
#                                                                       AA25  22
CCNT=0#                                Component counter                AA25  23
RNUM=1.;   SDEV=0.#                    Number scale & standard dev      AA25  24
MANT=0;    EXPN=0.#                    Zero mantissa & exponent         AA25  25
MSIN=+1;   ESIN=+1#                    Assume signs are positive        AA25  26
NDEC=0#                                Digits after decimal point       AA25  27
#                                                                       AA25  28
DO N=1,NSTR#                           Loop over chars in string        AA25  29
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA25  30
IF(CCNT==0&STRG(N^N)==' ') NEXT#       Skip leading blanks              AA25  31
M=INDEX(TEST,STRG(N^N))#               Get the index                    AA25  32
IF(M==0)#                              Test if number character         AA25  33
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA25  34
movechar:(MESS,1,CHROT,1,NMESS,0)#     Store error message              AA25  35
movechar:(STRG,1,CHROT,42,NSTR,0)#     Store erroneos string            AA25  36
writeline:(1,0,0,1,3)#                 Print error message              AA25  37
movechar:(HEADOT,1,CHROT,2,80,0)#      Store the input line             AA25  38
writeline:(0,0,0,1,3)#                 Print the input line             AA25  39
iquit:(AA2501)#                        Non-number char detected         AA25  40
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA25  41
#                                                                       AA25  42
IF(M<11)#                              Test if a digit                  AA25  43
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA25  44
IF(CCNT==0) CCNT=1#                    Start the number                 AA25  45
IF(CCNT==2) NDEC=NDEC+1#               Digits after dec point           AA25  46
IF     (CCNT<=2) MANT=MANT*10+M-1#     Accumulate mantissa              AA25  47
ELSE IF(CCNT==3) EXPN=EXPN*10+M-1#     Accumulate exponent              AA25  48
ELSE             SDEV=SDEV*10.+FLOAT(M-1)# Accumulate standard dev      AA25  49
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA25  50
#                                                                       AA25  51
ELSE IF(M==12)#                        If decimal point detected        AA25  52
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA25  53
IF(CCNT>1) iquit:(AA2502)#             Illegal number construction      AA25  54
CCNT=2#                                Signals that digits after deci   AA25  55
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA25  56
#                                                                       AA25  57
ELSE IF(M>13) CCNT=4#                  If parentheses detected          AA25  58
#                                                                       AA25  59
ELSE#                                  If signs '+' or '-'              AA25  60
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA25  61
IF(CCNT==3) iquit:(AA2502)#            Illegal sign construction        AA25  62
IF(CCNT==0)#                           Test if mantissa sign            AA25  63
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA25  64
CCNT=1; MSIN=12-M#                     Set the mantissa sign            AA25  65
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA25  66
ELSE#                                  This is an exponent sign         AA25  67
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA25  68
CCNT=3; ESIN=12-M#                     Set exponent sign                AA25  69
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA25  70
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA25  71
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA25  72
EXPN=EXPN*ESIN-NDEC#                   Calculate total exponent         AA25  73
IF(ABS(EXPN)>21) EXPN=SIGN(21,EXPN)#   Protect against overflow         AA25  74
IF(EXPN<0) RNUM=1./10.**ABS(EXPN)#     Apply negative exponent          AA25  75
IF(EXPN>0) RNUM=10.**EXPN#             Apply positive exponent          AA25  76
SDEV=RNUM*SDEV#                        Scale standard deviation         AA25  77
RNUM=RNUM*FLOAT(MANT*MSIN)#            Scale the number                 AA25  78
RETURN#                                                                 AA25  79
END#                                                                    AA25  80
systemheader:(AA26)#                   Arc out -- lr hist to sgnm       AA26   1
######################################################################  AA26   2
#                                                                    #  AA26   3
#                             AA26   (CF20 IN CIFIO)                 #  AA26   4
#                                                                    #  AA26   5
######################################################################  AA26   6
SUBROUTINE AA26#                                                        AA26   7
include:(AACOMN)#                                                       AA26   8
#                                                                       AA26   9
macro:(put:,[CALL AA28($1,$2,ifelse:($3,,0,$3),ifelse:($4,,0,$4),#      AA26  10
NCHR)])#                                                                AA26  11
macro:(out:,$(BUF=HEADOT(1^$1);writefmt:(iofm0:,'(A80)',BUF)#           AA26  12
HEADOT=' ';NCHR=0$))#                                                   AA26  13
macro:(num:,$(ncodefld:($2,1,HEADOT,$3,1);HEADOT(1^32)=$1;out:(50)$))#  AA26  14
macro:(dir:,[CALL AA29($1,$2,$3,$4,CHR,HEX,NCHR)])#                     AA26  15
#                                                                       AA26  16
INTEGER I,IPAK,J,K,MARK,NCHR,NPAK#                                      AA26  17
string:(BUF,80)#                                                        AA26  18
string:(NAME,32)#                                                       AA26  19
string:(NAME2,32)#                                                      AA26  20
chardata:(SYM,"$#                                                       AA26  21
1_lattice_type $#                                                       AA26  22
2_centro_type  $#                                                       AA26  23
3_total_symops $#                                                       AA26  24
4_basis_symops $#                                                       AA26  25
5_equiv_symops $#                                                       AA26  26
6_multiplicity $#                                                       AA26  27
7_cedar_symops $#                                                       AA26  28
8_moles/cell   $#                                                       AA26  29
9_cryst_system $#                                                       AA26  30
10             $#                                                       AA26  31
11             $#                                                       AA26  32
12             ")#                                                      AA26  33
chardata:(MAT,"r11r21r31r12r22r32r13r23r33t1 t2 t3 ")#                  AA26  34
chardata:(TWN,"r11r12r13r21r22r23r31r32r33")#                           AA26  35
chardata:(TWV,"1    1_esd2    2_esd")#                                  AA26  36
chardata:(HEAD,'# XTAL Archive File in STAR Format #')#                 AA26  37
chardata:(NUMB,1 2 3 4 5 6 7 8 91011121314151617181920)#                AA26  38
realdata:(FMT1,[131371.,261371.,391371.,521371.,651371.,781371.])#      AA26  39
realdata:(FMT2,[513.,513.,513.,513.,513.,513.,513.,513.,513.,#          AA26  40
1062.,1062.,1062.])#                                                    AA26  41
realdata:(FMT3,[50513.,100513.,150513.,200513.,250513.,300513.,#        AA26  42
350513.,400513.,450513.,540842.,620742.,700742.,780742.])#              AA26  43
datastuff:#                                                             AA26  44
#                                                                       AA26  45
#                                                                       AA26  46
#    OUTPUT FILE HEADER                                                 AA26  47
#    ------------------                                                 AA26  48
#                                                                       AA26  49
movechar:(HEAD,1,HEADOT,1,79,2)#       Fill line with sharps            AA26  50
movechar:(HEAD,1,HEADOT,22,35,0)#      Insert header                    AA26  51
put:(' ',79)#                          Force header                     AA26  52
NAME='data_'//COMPID#                  Data block code                  AA26  53
put:(NAME,11,2)#                       Output data block code           AA26  54
#                                                                       AA26  55
#    OUTPUT LR HISTORY                                                  AA26  56
#    -----------------                                                  AA26  57
#                                                                       AA26  58
IOMARK(1)=QXSTR#                       Start of input archive file      AA26  59
incrqx:(MARK,IOMARK(1)+bdfbuf:+1,CF1002)# Get memory for buffer         AA26  60
readwpkt:(1,1,NPAK,IPAK,0)#            Read the history record          AA26  61
put:('_hist',5,1)#                     Output history data name         AA26  62
put:(';',1)#                           Finish off history text          AA26  63
DO I=2,47,3#                           Loop over entries                AA26  64
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA26  65
J=IPAK+(I-1)*incr:(arith:(23,/,mxchwd:))# Point to each entry           AA26  66
movertoc:(QX(J+1),1,HEADOT,1,72,0)#    Extract prog, date, time         AA26  67
IF(HEADOT(1^1)==' ') BREAK#            Exit when entries finished       AA26  68
put:(' ',72)#                          Add entry to op buffer           AA26  69
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA26  70
put:(';',1)#                           Finish off history text          AA26  71
#                                                                       AA26  72
#    OUTPUT LR LABEL                                                    AA26  73
#    ---------------                                                    AA26  74
#                                                                       AA26  75
put:('_labl',5,1)#                     Output label data name           AA26  76
put:(';',1)#                           Finish off history text          AA26  77
REPEAT#                                Loop over label packets          AA26  78
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA26  79
readwpkt:(1,lrlabl:,NPAK,IPAK,0)#      Read next label                  AA26  80
IF(IPAK<=0) BREAK#                     Exit after last packet           AA26  81
movertoc:(QX(IPAK+1),1,HEADOT,1,72,0)# Store label in buffer            AA26  82
put:(' ',72)#                          Output this line                 AA26  83
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA26  84
put:(';',1)#                           Finish off label text            AA26  85
#                                                                       AA26  86
#    OUTPUT LR CELL                                                     AA26  87
#    --------------                                                     AA26  88
#                                                                       AA26  89
NAME='    _cell_pak_'#                 Define start of name             AA26  90
DO I=1,100#                            Loop over cell packets           AA26  91
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA26  92
readwpkt:(1,lrcell:,NPAK,IPAK,0)#      Read next packet                 AA26  93
IF(IPAK<=0) BREAK#                     Exit after last packet           AA26  94
put:('loop_',5,1)#                     Output loop command              AA26  95
NAME2=NAME(1^14)//NUMB(I*2-1^I*2)#     Construct data name              AA26  96
put:(NAME2,16,-16)#                    Output data name                 AA26  97
put:(' ',16)#                          Finish off cell packet           AA26  98
ncodefld:(QX,IPAK+1,HEADOT,FMT1,6)#    Output six values                AA26  99
put:(' ',78)#                          Finish off cell packet           AA26 100
ncodefld:(QX,IPAK+7,HEADOT,FMT1,3)#    Output three values              AA26 101
put:(' ',39)#                          Finish off cell packet           AA26 102
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA26 103
#                                                                       AA26 104
#   OUTPUT LR SYMM                                                      AA26 105
#   --------------                                                      AA26 106
#                                                                       AA26 107
NAME='_symm_pak_1_'#                   Define start of pak 1 name       AA26 108
readwpkt:(1,lrsymm:,NPAK,IPAK,0)#      Read next packet                 AA26 109
put:(' ',1)#                           Insert spacer                    AA26 110
DO I=1,12#                             Loop over items in packet 1      AA26 111
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA26 112
NAME(13^32)=SYM(I*15-14^I*15)#         Symm packet                      AA26 113
num:(NAME,QX(IPAK+I),404013.)#         Symm packet                      AA26 114
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA26 115
put:('loop_',5,1)#                     Insert loop line                 AA26 116
DO I=1,12#                             Loop over matrix elements        AA26 117
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA26 118
IF(MOD(I-1,6)==0) put:('    ',5,-4)#   Insert offset                    AA26 119
NAME2=NAME(1^6)//MAT(I*3-2^I*3)#       Matrix data name                 AA26 120
put:(NAME2,9,-12)#                     Insert matrix data name          AA26 121
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA26 122
put:(' ',75)#                          Output last buffer               AA26 123
DO I=1,1000#                           Loop over symm matrices          AA26 124
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA26 125
readwpkt:(1,lrsymm:,NPAK,IPAK,0)#      Read next packet                 AA26 126
IF(IPAK<=0) BREAK#                     Exit after last packet           AA26 127
LCHROT=0#                              Reset format pointer             AA26 128
ncodefld:(QX,IPAK+1,HEADOT,FMT2,12)#   Op symmetry elements             AA26 129
put:(' ',75)#                          Flush buffer                     AA26 130
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA26 131
#                                                                       AA26 132
#   OUTPUT LR SGNM                                                      AA26 133
#   --------------                                                      AA26 134
#                                                                       AA26 135
put:(' ',1)#                           Insert spacer                    AA26 136
DO K=1,10#                             Loop over sgname strings         AA26 137
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA26 138
readwpkt:(1,lrsgnm:,NPAK,IPAK,0)#      Read next packet                 AA26 139
IF(IPAK<=0) BREAK#                     If packet present                AA26 140
NAME='_sgnm_pak_'//NUMB(K*2-1^K*2)#    Start of sgname                  AA26 141
put:(NAME,12,-40)#                     Define start of sgname           AA26 142
movertoc:(QX(IPAK+1),1,HEADOT,41,40,0)# Store sgname as string          AA26 143
DO I=80,40,-1; IF(HEADOT(I^I)!=' ') BREAK# Find trailing nonblank       AA26 144
IF(I<40)#                              Is this a blank string?          AA26 145
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA26 146
HEADOT(40^40)='?'; put:(' ',40); NEXT# String missing                   AA26 147
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA26 148
DO J=40,I; IF(HEADOT(I^I)==' ') HEADOT(I^I)='_'# Replace blanks with    AA26 149
put:(' ',I)#                           Flush out the sgname             AA26 150
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA26 151
#                                                                       AA26 152
#   OUTPUT LR TWIN                                                      AA26 153
#   --------------                                                      AA26 154
#                                                                       AA26 155
NAME='_twin_vol_ratio'#                Define start of name             AA26 156
put:('loop_',5,1)#                     Insert loop line                 AA26 157
DO I=1,9#                              Loop over matrix elements        AA26 158
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA26 159
NAME2='_twin_'//TWN(I*3-2^I*3)#        Twin matrix data name            AA26 160
IF(MOD(I-1,6)==0) put:('    ',5,-4)#   Insert offset                    AA26 161
put:(NAME2,9,-12)#                     Insert matrix data name          AA26 162
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA26 163
put:(' ',79)#                          Output last buffer               AA26 164
put:('    ',5,-4)#                     Insert offset                    AA26 165
DO I=1,4#                              Loop over twin volumes           AA26 166
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 12 AA26 167
NAME2='_twin_vol_'//TWV(I*5-4^I*5)#    Twin volume ratio names          AA26 168
put:(NAME2,15,-17)#                    Insert twin ratio names          AA26 169
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 12 AA26 170
put:(' ',79)#                          Output last buffer               AA26 171
DO I=1,1000#                           Loop over twin matrices          AA26 172
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 13 AA26 173
readwpkt:(1,lrtwin:,NPAK,IPAK,0)#      Read next packet                 AA26 174
IF(IPAK<=0) BREAK#                     Exit after last packet           AA26 175
LCHROT=0#                              Reset last format num positn     AA26 176
DO J=1,9#                              Loop over the twinop             AA26 177
ifeq:(ANINT(QX(IPAK+J)),QX(IPAK+J))#   Integral element                 AA26 178
ncodefld:(QX,IPAK+J,HEADOT,FMT3(J),1)# Op integral symmetry elements    AA26 179
ELSE ncodefld:(QX,IPAK+J,HEADOT,522.,1)# Op symmetry elements           AA26 180
ncodefld:(QX,IPAK+10,HEADOT,FMT3(10),4)# Op symmetry elements           AA26 181
put:(' ',79)#                          Flush buffer                     AA26 182
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 13 AA26 183
IF(I==1) put:('1 0 0 0 1 0 0 0 1 1 0 0 0 ',26)# Identity twinop         AA26 184
#                                                                       AA26 185
CALL AA27#                             Output lrscat onwards            AA26 186
HEADOT=' '#                            Clear output buffer              AA26 187
#                                                                       AA26 188
RETURN#                                                                 AA26 189
END#                                                                    AA26 190
systemheader:(AA27)#                   Arc out -- lr scat to eof        AA27   1
######################################################################  AA27   2
#                                                                    #  AA27   3
#                             AA27    (CF21 IN CIFIO)                #  AA27   4
#                                                                    #  AA27   5
######################################################################  AA27   6
SUBROUTINE AA27#                                                        AA27   7
include:(AACOMN)#                                                       AA27   8
#                                                                       AA27   9
INTEGER I,IPAK,NCHR,NPAK#                                               AA27  10
INTEGER CHR(100),HEX(100)#                                              AA27  11
string:(NAME,24)#                                                       AA27  12
realdata:(FMT,[60613.,120613.])#                                        AA27  13
realdata:(FM2,[60613.,140842.,220842.,300842.,380742.])#                AA27  14
realdata:(FM3,[50513.,100513.,150513.,200513.,301052.,350513.])#        AA27  15
datastuff:#                                                             AA27  16
#                                                                       AA27  17
#   OUTPUT REMAINING RECORDS                                            AA27  18
#   ------------------------                                            AA27  19
#                                                                       AA27  20
CHR(1)=11;  CHR(2)=95#                 Atom type symbol & source        AA27  21
dir:(lrscat:,'_scat_',2,0)#            ********* lr scat **********     AA27  22
#                                                                       AA27  23
readwpkt:(1,lrsequ:,NPAK,IPAK,0)#      ********* lr sequ **********     AA27  24
IF(IPAK>0)#                            If data present                  AA27  25
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA27  26
put:('loop_',5,1)#                     Output loop header               AA27  27
HEADOT='    _sequ';  put:(' ',9)#      Output loop headers              AA27  28
REPEAT#                                Loop atom sequence info          AA27  29
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA27  30
movertoc:(QX(IPAK+1),1,NAME,1,8,0)#    Extract sequ name                AA27  31
put:(' '''//NAME(1^8)//'''',11,-11)#   Insert the sequ name             AA27  32
readwpkt:(1,lrsequ:,NPAK,IPAK,0)#      Point to next packet             AA27  33
IF(IPAK<=0) BREAK#                     Exit when finished               AA27  34
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA27  35
put:(' ',NCHR)#                        Flush out buffer                 AA27  36
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA27  37
#                                                                       AA27  38
readwpkt:(1,lrddef:,NPAK,IPAK,0)#      ********* lr ddef **********     AA27  39
IF(IPAK>0)#                            If data present                  AA27  40
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA27  41
put:('loop_',5,1)#                     Output loop header               AA27  42
HEADOT='    _ddef';  put:(' ',9)#      Output loop headers              AA27  43
REPEAT#                                Loop atom sequence info          AA27  44
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA27  45
movertoc:(QX(IPAK+1),1,NAME,1,12,0)#   Extract ddef name                AA27  46
put:(' '''//NAME(1^12)//'''',15,-15)#  Insert the ddef name             AA27  47
readwpkt:(1,lrddef:,NPAK,IPAK,0)#      Point to next packet             AA27  48
IF(IPAK<=0) BREAK#                     Exit when finished               AA27  49
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA27  50
put:(' ',NCHR)#                        Flush out buffer                 AA27  51
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA27  52
#                                                                       AA27  53
DO I=1,5; CHR(I  )=I+510#              ********* lr expl **********     AA27  54
DO I=1,5; CHR(I+5)=I+530#              Rcode criteria                   AA27  55
CHR(11)=40#                            Diffractometer type              AA27  56
CHR(12)=93#                            Radiation symbol                 AA27  57
CHR(13)=560#                           Crystal colour                   AA27  58
CHR(14)=561#                           Crystal shape                    AA27  59
dir:(lrexpl:,'_expl_',14,0)#           Output record                    AA27  60
#                                                                       AA27  61
HEX(1)=10#                             Word 10 is packed hex            AA27  62
dir:(lrdset:,'_dset_',0,1)#            ********* lr dset **********     AA27  63
#                                                                       AA27  64
CHR(1)=1; CHR(2)=2#                    Atom code id numbers             AA27  65
dir:(lrdict:,'_dict_',2,0)#            ********* lr dict **********     AA27  66
#                                                                       AA27  67
CHR(1)=1;  CHR(2)=2;  CHR(3)=3#        ********* lr graf **********     AA27  68
CHR(4)=4;  CHR(5)=5;  CHR(6)=11#       Identify character words         AA27  69
DO I=1,12; CHR(I+6)=30+I#              Identify character words         AA27  70
CHR(19)=101;CHR(20)=102;CHR(21)=103#   Identify character words         AA27  71
CHR(22)=104;CHR(23)=105;CHR(24)=111#   Identify character words         AA27  72
dir:(lrgraf:,'_graf_',24,0)#           Output directory record          AA27  73
#                                                                       AA27  74
CHR(1)=1;  CHR(2)=21#                  ********* lr site **********     AA27  75
dir:(lrsite:,'_site_',2,0)#            Output directory record          AA27  76
#                                                                       AA27  77
CHR(1)=14; CHR(2)=15; CHR(3)=16#       ********* lr atom **********     AA27  78
CHR(4)=18; CHR(5)=19; CHR(6)=55#       Identify character words         AA27  79
CHR(7)=56; CHR(8)=57; CHR(9)=58#       Identify character words         AA27  80
CHR(10)=300;CHR(11)=310;CHR(12)=312#   Identify character words         AA27  81
CHR(13)=314;CHR(14)=316;CHR(15)=320#   Identify character words         AA27  82
CHR(16)=321;CHR(17)=322;CHR(18)=323#   Identify character words         AA27  83
dir:(lratom:,'_atom_',18,0)#           Output directory record          AA27  84
#                                                                       AA27  85
CHR(1)= 1; CHR(2)=11; CHR(3)=21#       ********* lr cons **********     AA27  86
dir:(lrcons:,'_cons_',3,0)#            Output directory record          AA27  87
#                                                                       AA27  88
readwpkt:(1,lrslav:,NPAK,IPAK,0)#      ********* lr slav **********     AA27  89
IF(IPAK>0)#                            Is lrec present                  AA27  90
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA27  91
put:('loop_',5,1)#                     Output loop header               AA27  92
HEADOT='    _slav_1  _slav_2'#         Insert packet headers            AA27  93
put:(' ',20)#                          Op packet headers                AA27  94
REPEAT#                                Loop atom sequence info          AA27  95
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA27  96
ncodefld:(QX,IPAK+1,NAME,FMT,2)#       Format master/slave pointers     AA27  97
put:(NAME(1^12),12,-12)#               Insert the pointers              AA27  98
readwpkt:(1,lrslav:,NPAK,IPAK,0)#      Point to next packet             AA27  99
IF(IPAK<=0) BREAK#                     Exit when finished               AA27 100
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA27 101
put:(' ',NCHR)#                        Flush out buffer                 AA27 102
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA27 103
#                                                                       AA27 104
CHR(1)=10#                             ********* lr mole **********     AA27 105
CHR(2)=11#                             Addatm/startx celcon string      AA27 106
dir:(lrmole:,'_mole_',2,0)#            Output directory record          AA27 107
#                                                                       AA27 108
HEX(1)=3; CHR(1)=1015; CHR(2)=1016#    ********* lr refl **********     AA27 109
DO I=1,25; HEX(I+1)=I+1605#            Group s.f.'s are hex             AA27 110
dir:(lrrefl:,'_refl_',2,26)#           Output directory record          AA27 111
#                                                                       AA27 112
readwpkt:(1,lrthet:,NPAK,IPAK,0)#      ********* lr thet **********     AA27 113
IF(IPAK>0)#                            Is lrec present                  AA27 114
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA27 115
put:('loop_',5,1)#                     Output loop header               AA27 116
HEADOT='    _thet_1  _thet_2  _thet_3  _thet_4  _thet_5  _thet_6'#      AA27 117
put:(' ',56)#                          Op packet headers                AA27 118
REPEAT#                                Loop atom sequence info          AA27 119
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA27 120
ncodefld:(QX,IPAK+1,HEADOT,FM3,6)#     Format dsn h k l 2th wl          AA27 121
put:(' ',35)#                          Flush out buffer                 AA27 122
readwpkt:(1,lrthet:,NPAK,IPAK,0)#      Point to next packet             AA27 123
IF(IPAK<=0) BREAK#                     Exit when finished               AA27 124
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA27 125
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA27 126
#                                                                       AA27 127
DO I=1,7; CHR(I)=I+10#                 ********* lr sfls **********     AA27 128
dir:(lrsfls:,'_sfls_',7,0)#            Output directory record          AA27 129
#                                                                       AA27 130
readwpkt:(1,lrrfac:,NPAK,IPAK,0)#      ********* lr rfac **********     AA27 131
IF(IPAK>0)#                            Is lrec present                  AA27 132
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA27 133
put:('loop_',5,1)#                     Output loop header               AA27 134
HEADOT='    _rfac_1  _rfac_2  _rfac_3  _rfac_4  _rfac_5  _rfac_6'#      AA27 135
put:(' ',56)#                          Op packet headers                AA27 136
REPEAT#                                Loop atom sequence info          AA27 137
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA27 138
ncodefld:(QX,IPAK+1,HEADOT,FM2,5)#     Format r-factors                 AA27 139
movertoc:(QX(IPAK+6),1,HEADOT,41,40,0)# Insert stored title             AA27 140
HEADOT(40^40)=''''; HEADOT(80^80)=''''# Insert boundary quotes          AA27 141
put:(' ',80)#                          Flush out buffer                 AA27 142
readwpkt:(1,lrrfac:,NPAK,IPAK,0)#      Point to next packet             AA27 143
IF(IPAK<=0) BREAK#                     Exit when finished               AA27 144
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA27 145
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA27 146
#                                                                       AA27 147
dir:(lrdens:,'_dens_',0,0)#            ********* lr dens **********     AA27 148
#                                                                       AA27 149
CHR(1)=11; CHR(2)=21#                  ********* lr bond **********     AA27 150
dir:(lrbond:,'_bond_',2,0)#            Output directory record          AA27 151
#                                                                       AA27 152
CHR(1)=11; CHR(2)=21#                  ********* lr cont **********     AA27 153
dir:(lrcont:,'_cont_',2,0)#            Output directory record          AA27 154
#                                                                       AA27 155
CHR(1)=11; CHR(2)=21; CHR(3)=31#       ********* lr angl **********     AA27 156
dir:(lrangl:,'_angl_',3,0)#            Output directory record          AA27 157
#                                                                       AA27 158
CHR(1)=11;CHR(2)=21;CHR(3)=31;CHR(4)=41# ********* lr dihe **********   AA27 159
dir:(lrdihe:,'_dihe_',4,0)#            Output directory record          AA27 160
#                                                                       AA27 161
CHR(1)=11; CHR(2)=21#                  ********* lr rigi **********     AA27 162
dir:(lrrigi:,'_rigi_',2,0)#            Output directory record          AA27 163
#                                                                       AA27 164
readwpkt:(1,endrecord:,NPAK,IPAK,0)#   ********* lr eof  **********     AA27 165
closefmt:(iofm0:)#                     Close the .arc file              AA27 166
#                                                                       AA27 167
RETURN#                                                                 AA27 168
END#                                                                    AA27 169
systemheader:(AA28)#                   Put data to fmt buffer           AA28   1
######################################################################  AA28   2
#                                                                    #  AA28   3
#                             AA28  PUT:   (CF22 IN CIFIO)           #  AA28   4
#                                                                    #  AA28   5
######################################################################  AA28   6
SUBROUTINE AA28(STRG,NSTR,LT,LB,NCHR)#                                  AA28   7
include:(AACOMN)#                                                       AA28   8
#                                                                       AA28   9
string:(STRG,*)#                       String placed in output buffer   AA28  10
string:(BUF,80)#                                                        AA28  11
INTEGER NSTR,NCHR#                     Length of string output          AA28  12
INTEGER LT,LB#                         Lines op top and bottom          AA28  13
INTEGER I#                                                              AA28  14
#                                                                       AA28  15
IF(LT>0) DO I=1,LT; out:(1)#           Op top blank lines               AA28  16
#                                                                       AA28  17
IF(LT<0)#                              Test if string to be added       AA28  18
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA28  19
IF(NCHR+NSTR>=81) out:(NCHR)#          Test if buffer full              AA28  20
HEADOT(NCHR+1^NCHR+NSTR)=STRG(1^NSTR)# Add the string to the buffer     AA28  21
NCHR=MIN(80,NCHR-LT)#                  Incr char pointer                AA28  22
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA28  23
ELSE IF(STRG(1^1)!=' ')#               Else output after insertion      AA28  24
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA28  25
HEADOT(1^NSTR)=STRG(1^NSTR)#           Insert character string          AA28  26
out:(NSTR)#                            Op char buffer                   AA28  27
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA28  28
ELSE out:(NSTR)#                       Simply flush the buffer          AA28  29
#                                                                       AA28  30
IF(LB>0) DO I=1,LB; out:(1)#           Op bot blank lines               AA28  31
#                                                                       AA28  32
RETURN#                                                                 AA28  33
END#                                                                    AA28  34
systemheader:(AA29)#                   Put dir and data into buffer     AA29   1
######################################################################  AA29   2
#                                                                    #  AA29   3
#                             AA29   DIR:  (CF23 IN CIFIO)           #  AA29   4
#                                                                    #  AA29   5
######################################################################  AA29   6
SUBROUTINE AA29(LR,STRG,MCHR,MHEX,CHR,HEX,NCHR)#                        AA29   7
include:(AACOMN)#                                                       AA29   8
#                                                                       AA29   9
INTEGER I,ICHR,IPAK,J,K,N,M,MHEX#                                       AA29  10
INTEGER CHR(*),HEX(*)#                                                  AA29  11
INTEGER MCHR,NCHR,NPAK#                                                 AA29  12
INTEGER LR#                            Logical record number            AA29  13
INTEGER TYPE(500)#                     Data types                       AA29  14
REAL FM,H(3),Q#                                                         AA29  15
#                                                                       AA29  16
string:(CHRS,80)#                                                       AA29  17
string:(STRG,6)#                                                        AA29  18
realdata:(FMT,[40413.,80413.,120413.])#                                 AA29  19
datastuff:#                                                             AA29  20
#                                                                       AA29  21
readwpkt:(1,LR,NPAK,IPAK,0)#           Read directory packet            AA29  22
IF(IPAK>0)#                            If data present                  AA29  23
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA29  24
#                                                                       AA29  25
#    PROCESS DIRECTORY PACKET                                           AA29  26
#    ------------------------                                           AA29  27
#                                                                       AA29  28
put:('loop_',5,1); M=0; K=0#           Output loop command              AA29  29
DO I=1,NPAK#                           Loop over directory packet       AA29  30
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA29  31
N=NINT(QX(IPAK+I))#                    Get id num as integer            AA29  32
TYPE(I)=1#                             Store default format as number   AA29  33
IF(MHEX>0)#                            Test for packed words            AA29  34
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA29  35
DO J=1,MHEX; IF(N==HEX(J)) BREAK#      Exit if match found              AA29  36
IF(J<=MHEX) TYPE(I)=2#                 Store format as hexadecimal      AA29  37
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA29  38
IF(MCHR>0)#                            Test for char strings            AA29  39
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA29  40
DO J=1,MCHR; IF(N==CHR(J)) BREAK#      Exit if match found              AA29  41
IF(J<=MCHR) TYPE(I)=-N#                Store flag as char string        AA29  42
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA29  43
IF(N==M) NEXT#                         Skip identical numbers           AA29  44
K=K+1;  M=N#                           Count and save id number         AA29  45
IF(MOD(K-1,6)==0) put:('     ',5,-4)#  Insert offset                    AA29  46
ncodefld:(QX,IPAK+I,CHRS,40443.,1)#    Format id number                 AA29  47
put:(STRG//CHRS(1^4),10,-12)#          Add data name to buffer          AA29  48
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA29  49
put:(' ',NCHR)#                        Flush final buffer               AA29  50
ICHR=0#                                Reset character pointer          AA29  51
#                                                                       AA29  52
#    PROCESS DATA PACKETS                                               AA29  53
#    --------------------                                               AA29  54
#                                                                       AA29  55
REPEAT#                                Loop over all data sets          AA29  56
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA29  57
readwpkt:(1,LR,NPAK,IPAK,0)#           Read directory packet            AA29  58
IF(IPAK<=0) BREAK#                     Exit from loop                   AA29  59
IF(STRG(2^5)=='refl')#                 ***** test if reflection hkl**   AA29  60
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA29  61
gethkl:(IPAK+1,H);          N=2#       Extract hkl indices              AA29  62
ncodefld:(H,1,CHRS,FMT,3)#             Format hkl indices               AA29  63
put:(''''//CHRS(1^12)//'''',14,-14)#   Add hkl indices                  AA29  64
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA29  65
ELSE N=1#                              Process all words                AA29  66
#                                                                       AA29  67
DO I=N,NPAK#                           Loop over packet items           AA29  68
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA29  69
IF(TYPE(I)==1)#                        Test if number expected          AA29  70
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA29  71
ifvo:(QX(IPAK+I)) put:(' -.4+21',7,-7)# Test if void flag               AA29  72
ELSE#                                  If not a void number             AA29  73
$(#                                    4>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA29  74
Q=ABS(QX(IPAK+I))#                     Store absolute value             AA29  75
IF(Q< 999.9&ABS(Q-FLOAT(NINT(Q)))<0.000001)$# Test if small integer     AA29  76
                           FM=50513.#  Format integer                   AA29  77
ELSE IF(Q<9999.9&ABS(Q-FLOAT(NINT(Q)))<0.000001)$# Test if integer      AA29  78
                           FM=60613.#  Format integer                   AA29  79
ELSE IF(Q<10000.&Q>99.999) FM=101032.# Format xxxx.xxx                  AA29  80
ELSE IF(Q<100.&Q>0.99999)  FM=101052.# Format xx.xxxxx                  AA29  81
ELSE IF(Q<1.&Q>0.0099999)  FM=101072.# Format .xxxxxxx                  AA29  82
ELSE                       FM=131371.# Scientific notation              AA29  83
ncodefld:(QX,IPAK+I,CHRS, FM,1)#       Scientific notation              AA29  84
J=NINT(FM)/10000;  put:(CHRS,J,-J)#    Add to output buffer             AA29  85
$)#                                    4<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA29  86
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA29  87
ELSE IF(TYPE(I)==2)#                   Test if hexadecimal format       AA29  88
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA29  89
ncodefld:(QX,IPAK+I,CHRS,80889.,1)#    Hexidecimal notation             AA29  90
put:(' Z'//CHRS(1^8),10,-10)#          Add to output buffer             AA29  91
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA29  92
ELSE#                                  Must be character data           AA29  93
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA29  94
movertoc:(QX(IPAK+I),1,CHRS,ICHR+1,mxchwd:,0)# Store char string        AA29  95
ICHR=ICHR+mxchwd:#                     Incr the char string pointer     AA29  96
IF(TYPE(I+1)==TYPE(I)) NEXT#           Skip if next word the same       AA29  97
DO J=ICHR,2,-1; IF(CHRS(J^J)!=' ') BREAK# Find trailing blank           AA29  98
DO K=1,J; IF(CHRS(K^K)=='''') BREAK#   Test for imbedded apostrophe     AA29  99
IF(K>J) put:(' '''//CHRS(1^J)//'''',J+3,-J-3)# Add character string     AA29 100
ELSE    put:(' "'//CHRS(1^J)//'"',J+3,-J-3)# Add character string       AA29 101
ICHR=0#                                Reset character pointer          AA29 102
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA29 103
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA29 104
put:(' ',NCHR)#                        Flush out last buffer            AA29 105
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA29 106
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA29 107
#                                                                       AA29 108
RETURN#                                                                 AA29 109
END#                                                                    AA29 110
systemheader:(AA50)#                   Open an xtal file                AA50   1
#####################################################################   AA50   2
##                                                                  #   AA50   3
##                        AA50 (used in open: macros)               #   AA50   4
##                                                                  #   AA50   5
#####################################################################   AA50   6
SUBROUTINE AA50(NDEV,KEY,NREC,NF)#     S.r. hall mar 89                 AA50   7
include:(AACOMN)#                                                       AA50   8
INTEGER K,KEY,NREC,LREC,NDEV#                                           AA50   9
LOGICAL TEST#                                                           AA50  10
string:(FN,60); string:(FF,60); string:(NF,*)#                          AA50  11
chardata:(A20," Attempt to read non-existent file")#                    AA50  12
datastuff:#                                                             AA50  13
#-----------------------------------------------------------------      AA50  14
#  KEY < 0 TO RETURN UNIT ATTACHED TO FILE NF IN NDEV                   AA50  15
#  KEY = 0 TO RETURN 0/1 IN NREC IF UNIT NDEV NOT/YES ASSIGNED          AA50  16
#  KEY = 1 TO OPEN NDEV FOR BINARY FILE  ) NREC = 0 SEQUENTIAL          AA50  17
#  KEY = 2 TO OPEN NDEV FOR BINARY FILE  ) NREC > 0 DIRECT              AA50  18
#-----------------------------------------------------------------      AA50  19
IF(KEY<0)#                             Find unit assigned to file       AA50  20
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA50  21
INQUIRE(FILE=NF,OPENED=TEST,NUMBER=K)# Is named file open?              AA50  22
IF(TEST) NDEV=K;  ELSE NDEV=0#         Return unit number in ndev       AA50  23
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA50  24
#                                                                       AA50  25
ELSE#                                                                   AA50  26
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA50  27
FF=' ';    FN=' '#                     Blank out previous buffers       AA50  28
IF(NF(1^1)==' ')#                      Is file name supplied?           AA50  29
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA50  30
DO K=6,1,-1; IF(COMPID(K^K)!=' ') BREAK# Find 1st non-blank of compid   AA50  31
FF=filename:(COMPID(1^K),FILEXT(NDEV))# Construct the filename          AA50  32
DO K=60,1,-1; IF(FF(K^K)!=' ') BREAK#  Find last non-blank character    AA50  33
ifsel:(IBM,SIE)#                                                        AA50  34
upcase:(FF,FN,K)#                      Ebcdic  to upper case            AA50  35
ifsel:#                                                                 AA50  36
locase:(FF,FN,K)#                      Ascii   to lower case            AA50  37
endsel:#                                                                AA50  38
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA50  39
ELSE FN=NF#                            Transfer supplied filename       AA50  40
FILENM(NDEV)=FN#                       Save filename for later use      AA50  41
#                                                                       AA50  42
IF(KEY==0)#                            Test for existance of file       AA50  43
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA50  44
INQUIRE(FILE=FN,EXIST=TEST)#           Inquire if named file exists     AA50  45
IF(TEST) NREC=yes:;   ELSE NREC=no:#   Set flag to pass back            AA50  46
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA50  47
#                                                                       AA50  48
ELSE IF(KEY==1)#                       ******** text file ***********   AA50  49
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA50  50
IF(NREC>0)#                            ******** direct access           AA50  51
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA50  52
OPEN(UNIT=NDEV,FILE=FN,STATUS='UNKNOWN',# Open dir acc formatted file   AA50  53
ACCESS='DIRECT',FORM='FORMATTED',RECL=NREC)# Format recl in bytes       AA50  54
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA50  55
ELSE#                                  ******** sequential access       AA50  56
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 7  AA50  57
ifsel:(VMS)#                                                            AA50  58
OPEN(UNIT=NDEV,FILE=FN,STATUS='UNKNOWN',FORM='FORMATTED',#              AA50  59
ACCESS='SEQUENTIAL',CARRIAGECONTROL='LIST')# Formatted sequ file        AA50  60
ifsel:#                                                                 AA50  61
OPEN(UNIT=NDEV,FILE=FN,STATUS='UNKNOWN',# Open formatted sequ file      AA50  62
ACCESS='SEQUENTIAL',FORM='FORMATTED')# Open formatted sequ file         AA50  63
endsel:#                                                                AA50  64
REWIND(UNIT=NDEV)#                     Start seq file at record 1       AA50  65
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 7  AA50  66
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA50  67
#                                                                       AA50  68
ELSE IF(KEY>=2)#                       ********* binary file ********   AA50  69
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 8  AA50  70
IF(KEY==2)#                            For 'read' binary files          AA50  71
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 9  AA50  72
INQUIRE(FILE=FN,EXIST=TEST)#           Inquire if named file exists     AA50  73
IF(!TEST)#                             If file does not exist           AA50  74
$(#                                    3>>>>>>>>>>>>>>>>>>>>>>>>>>>> 10 AA50  75
movechar:(A20,1,CHROT,1,NA20,0)#       Insert error message             AA50  76
movechar:(FN,1,CHROT,37,60,0)#         Insert file name                 AA50  77
writeline:(0,0,0,2,3)#                 Print the message                AA50  78
iquit:(AA5001)#                        The job must die                 AA50  79
$)#                                    3<<<<<<<<<<<<<<<<<<<<<<<<<<<< 10 AA50  80
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 9  AA50  81
ifsel:(VMS,UNXSNY,UNXDEC,UNXULT,UNXSGI)#                                AA50  82
LREC=NREC/mxchwd:#                     Request record length in words   AA50  83
ifsel:#                                                                 AA50  84
LREC=NREC#                             Request record length in bytes   AA50  85
endsel:#                                                                AA50  86
IF(NREC>0)#                            ******** direct access           AA50  87
OPEN(UNIT=NDEV,FILE=FN,STATUS='UNKNOWN',# Open dir acc binary file      AA50  88
ACCESS='DIRECT',FORM='UNFORMATTED',RECL=LREC)# Rec in words/bytes       AA50  89
ELSE#                                  ******** sequential access       AA50  90
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 11 AA50  91
OPEN(UNIT=NDEV,FILE=FN,STATUS='UNKNOWN',# Open sequ binary file         AA50  92
FORM='UNFORMATTED')#                   Open sequ binary file            AA50  93
REWIND(UNIT=NDEV)#                     Start seq file at record 1       AA50  94
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 11 AA50  95
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 8  AA50  96
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA50  97
#                                                                       AA50  98
RETURN#                                                                 AA50  99
END#                                                                    AA50 100
systemheader:(AA51)#                   Real-word string mover           AA51   1
####################################################################    AA51   2
##                                                                 #    AA51   3
##                         AA51 (used in movereal:)                #    AA51   4
##                                                                 #    AA51   5
####################################################################    AA51   6
SUBROUTINE AA51(FROM,F,TO,T,NWORD,KEY)##                                AA51   7
#                                        Hall, stewart 1978             AA51   8
INTEGER  N,M,NWORD,KEY,F,T,K#                                           AA51   9
INTEGER FROM(1),TO(1)#                                                  AA51  10
#-----------------------------------------------------------------      AA51  11
#  KEY = 0 WHEN ORIGIN AND TARGET ARRAYS DIFFERENT                      AA51  12
#  KEY = 1 WHEN ORIGIN AND TARGET ARRAYS THE SAME                       AA51  13
#  KEY = 2 TO FIX ORIGIN ARRAY AT FIRST WORD                            AA51  14
#-----------------------------------------------------------------      AA51  15
#                                                                       AA51  16
IF(!((KEY==1)&(F==T)))#                If same array & origin           AA51  17
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA51  18
IF(KEY==2)#                            Move word 1 of from to all       AA51  19
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA51  20
N=T+NWORD-1;  M=FROM(F)#               Set last word moved              AA51  21
DO K=T,N; TO(K)=M#                     Fill with same word              AA51  22
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA51  23
#                                                                       AA51  24
ELSE IF((KEY==0)\(F>T))#               If diff array or from > to       AA51  25
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3  AA51  26
M=F;    N=T+NWORD-1#                   Set starting pointers            AA51  27
DO K=T,N#                              Loop over nwords                 AA51  28
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  AA51  29
TO(K)=FROM(M)#                         Move single word                 AA51  30
M=M+1#                                 Increment from/to pointers       AA51  31
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  AA51  32
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 3  AA51  33
#                                                                       AA51  34
ELSE#                                  Assume its the same array        AA51  35
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5  AA51  36
M=F+NWORD-1;    N=T+NWORD-1#           Set starting pointers            AA51  37
DO K=N,T,-1#                           Loop over nwords                 AA51  38
$(#                                    2>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6  AA51  39
TO(K)=FROM(M)#                         Move single word                 AA51  40
M=M-1#                                 Decrement from/to pointers       AA51  41
$)#                                    2<<<<<<<<<<<<<<<<<<<<<<<<<<<< 6  AA51  42
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 5  AA51  43
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA51  44
RETURN#                                                                 AA51  45
END#                                                                    AA51  46
systemheader:(AA52)#                   Packed-word mover                AA52   1
####################################################################    AA52   2
##                                                                 #    AA52   3
##                           AA52 (used in movepakwd:)             #    AA52   4
##                                                                 #    AA52   5
####################################################################    AA52   6
SUBROUTINE AA52(FROM,TO)#                                               AA52   7
INTEGER FROM(1),TO(1)#                                                  AA52   8
TO(1)=FROM(1)#                         Transfer as integer              AA52   9
RETURN#                                                                 AA52  10
END#                                                                    AA52  11
systemheader:(AA53)#                   Packed-word comparator           AA53   1
####################################################################    AA53   2
##                                                                 #    AA53   3
##                           AA53 (used in compakwd:)              #    AA53   4
##                                                                 #    AA53   5
####################################################################    AA53   6
SUBROUTINE AA53(I,J,K)#                                                 AA53   7
INTEGER I,J,K#                                                          AA53   8
K=I-J#                                 Get difference in value          AA53   9
RETURN#                                                                 AA53  10
END#                                                                    AA53  11
systemheader:(AA54)#                   Standard line reader             AA54   1
####################################################################    AA54   2
##                                                                 #    AA54   3
##                           AA54 (used in linein:)                #    AA54   4
##                                                                 #    AA54   5
####################################################################    AA54   6
SUBROUTINE AA54(DEV,LINE,NLEN,EOF)#    Used in linein:                  AA54   7
INTEGER DEV,NLEN,EOF#                                                   AA54   8
CHARACTER*(*) LINE#                                                     AA54   9
ifsel:(SIE)#                           Siemens is special               AA54  10
CHARACTER BUF*(mxchim:,V)#             Blank fill truncated lines       AA54  11
ifsel:#                                                                 AA54  12
CHARACTER BUF*mxchim:#                                                  AA54  13
endsel:#                                                                AA54  14
EOF=0;    NLEN=mxchim:;    LINE=' '#   Reset end file flag              AA54  15
READ(DEV,'(a)',END=100) BUF#           Read an input line               AA54  16
DO NLEN=mxchim:,1,-1#                  Reverse loop along line          AA54  17
IF(BUF(NLEN^NLEN)!=' ') BREAK#         Exit on first non-blank          AA54  18
IF(NLEN>0) LINE=BUF(1^NLEN)#           Transfer buffer to line          AA54  19
NLEN=NLEN+1#                           Point to trailing blank          AA54  20
RETURN#                                Back to caller                   AA54  21
100 EOF=1#                             End of file detected             AA54  22
RETURN#                                                                 AA54  23
END#                                                                    AA54  24
systemheader:(AA55)#                   Move character string            AA55   1
####################################################################    AA55   2
##                                                                 #    AA55   3
##                           AA55 (used in movechar:)              #    AA55   4
##                                                                 #    AA55   5
####################################################################    AA55   6
SUBROUTINE AA55(C,N,D,M,L,K)#                                           AA55   7
INTEGER I,J,K,L,M,N#                                                    AA55   8
ifsel:(MAC,VMS)#                                                        AA55   9
LOGICAL*1 C(*),D(*)#                                                    AA55  10
ifsel:#                                                                 AA55  11
CHARACTER*(*) C,D#                                                      AA55  12
endsel:#                                                                AA55  13
ifsel:(MAC,VMS)#                                                        AA55  14
IF(K==0)           DO J=0,L-1; D(M+J)=C(N+J)## Transfer chars           AA55  15
ELSE IF(C(N)==' ') DO J=0,L-1; D(M+J)=' '#  ## 'blank fill' mode        AA55  16
ELSE               DO J=0,L-1; D(M+J)=C(N)# ## 'char fill' mode         AA55  17
ifsel:#                                                                 AA55  18
J=L-1#                                                                  AA55  19
IF(K==0)             D(M^M+J)=C(N^N+J)## Transfer string                AA55  20
ELSE IF(C(N^N)==' ') D(M^M+J)=' '#    ## If in 'blank fill' mode        AA55  21
ELSE DO I=0,J;       D(M+I^M+I)=C(N^N)## 'char fill' mode               AA55  22
endsel:#                                                                AA55  23
RETURN#                                                                 AA55  24
END#                                                                    AA55  25
systemheader:(AA56)#                   Move character to real           AA56   1
####################################################################    AA56   2
##                                                                 #    AA56   3
##                           AA56 (used in movector:)              #    AA56   4
##                                                                 #    AA56   5
####################################################################    AA56   6
SUBROUTINE AA56(C,N,D,M,L,K)#                                           AA56   7
INTEGER J,K,L,M,N#                                                      AA56   8
ifsel:(MAC,VMS)#                                                        AA56   9
LOGICAL*1 C(*),D(*)#                                                    AA56  10
ifsel:(SLPC,MSNT)#                                                      AA56  11
CHARACTER*(*) C#                                                        AA56  12
INTEGER D(*),ICHR,J1,I#                                                 AA56  13
ifsel:#                                                                 AA56  14
CHARACTER*(*) C,D#                                                      AA56  15
endsel:#                                                                AA56  16
ifsel:(MAC,VMS)#                                                        AA56  17
IF(K==0)           DO J=0,L-1; D(M+J)=C(N+J)## Transfer chars           AA56  18
ELSE IF(C(N)==' ') DO J=0,L-1; D(M+J)=' '#  ## 'blank fill' mode        AA56  19
ifsel:(SLPC,MSNT)#                                                      AA56  20
I=ICHAR(C(N^N))#                                                        AA56  21
DO ICHR=1,L#                                                            AA56  22
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA56  23
IF(K==0) I=ICHAR(C(ICHR+N-1^ICHR+N-1))#                                 AA56  24
J=(ICHR+M-2)/mxchwd:+1#                                                 AA56  25
J1=MOD(ICHR+M-2,mxchwd:)*mxbtch:#                                       AA56  26
intpak:(I,D(J),J1,mxbtch:)#                                             AA56  27
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA56  28
ifsel:#                                                                 AA56  29
J=L-1#                                                                  AA56  30
IF(K==0)             D(M^M+J)=C(N^N+J)## Transfer string                AA56  31
ELSE IF(C(N^N)==' ') D(M^M+J)=' '#    ## If in 'blank fill' mode        AA56  32
endsel:#                                                                AA56  33
RETURN#                                                                 AA56  34
END#                                                                    AA56  35
systemheader:(AA57)#                   Move real to character           AA57   1
####################################################################    AA57   2
##                                                                 #    AA57   3
##                           AA57 (used in movertoc:)              #    AA57   4
##                                                                 #    AA57   5
####################################################################    AA57   6
SUBROUTINE AA57(C,N,D,M,L,K)#                                           AA57   7
INTEGER K,L,M,N#                                                        AA57   8
ifsel:(MAC,VMS)#                                                        AA57   9
LOGICAL*1 C(*),D(*)#                                                    AA57  10
ifsel:(SLPC,MSNT)#                                                      AA57  11
INTEGER C(*),ICHR,I,J,J1#                                               AA57  12
CHARACTER*(*) D#                                                        AA57  13
ifsel:#                                                                 AA57  14
CHARACTER*(*) C,D#                                                      AA57  15
endsel:#                                                                AA57  16
ifsel:(MAC,VMS)#                                                        AA57  17
INTEGER I#                                                              AA57  18
DO I=0,L-1; D(M+I)=C(N+I)#             Transfer chars                   AA57  19
ifsel:(SLPC,MSNT)#                                                      AA57  20
DO ICHR=1,L#                                                            AA57  21
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA57  22
J=(ICHR+N-2)/mxchwd:+1#                                                 AA57  23
J1=MOD(ICHR+N-2,mxchwd:)*mxbtch:#                                       AA57  24
intunpak:(C(J),I,J1,mxbtch:)#                                           AA57  25
J=ICHR+M-1#                                                             AA57  26
D(ICHR+M-1^ICHR+M-1)=CHAR(I)#                                           AA57  27
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA57  28
ifsel:#                                                                 AA57  29
D(M^M+L-1)=C(N^N+L-1)#                 Transfer string                  AA57  30
endsel:#                                                                AA57  31
RETURN#                                                                 AA57  32
END#                                                                    AA57  33
systemheader:(AA58)#                   Change to upper/lower case       AA58   1
####################################################################    AA58   2
##                                                                 #    AA58   3
##                           AA58 (used in upcase:/locase:)        #    AA58   4
##                                                                 #    AA58   5
####################################################################    AA58   6
SUBROUTINE AA58(FROM,TO,LIM,KEY)#                                       AA58   7
INTEGER KEY,I,J,LIM#                   Key=0 l->u; =1 u->l              AA58   8
string:(FROM,*); string:(TO,*)#                                         AA58   9
chardata:(CAP,'ABCDEFGHIJKLMNOPQRSTUVWXYZ')#                            AA58  10
chardata:(LOW,'abcdefghijklmnopqrstuvwxyz')#                            AA58  11
datastuff:#                                                             AA58  12
IF(KEY==0)#                            Test lc -> uc conversion         AA58  13
DO I=1,LIM#                            Loop over char string            AA58  14
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  AA58  15
J=INDEX(LOW,FROM(I^I))#                Get lower case index             AA58  16
IF(J>0) TO(I^I)=CAP(J^J)#              Convert to upper case            AA58  17
ELSE    TO(I^I)=FROM(I^I)#             No conversion required           AA58  18
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  AA58  19
ELSE#                                  Test uc -> lc conversion         AA58  20
DO I=1,LIM#                            Loop over char string            AA58  21
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  AA58  22
J=INDEX(CAP,FROM(I^I))#                Get upper case index             AA58  23
IF(J>0) TO(I^I)=LOW(J^J)#              Convert to lower case            AA58  24
ELSE    TO(I^I)=FROM(I^I)#             No conversion required           AA58  25
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  AA58  26
RETURN#                                                                 AA58  27
END#                                                                    AA58  28
#                                                                       AA58  29
######################################################################  AA58  30
##                                                                  ##  AA58  31
##    M A C H I N E    S P E C I F I C    S U B R O U T I N E S     ##  AA58  32
##    ---------------------------------------------------------     ##  AA58  33
##  The following subroutines depend on specific compiler library   ##  AA58  34
##  routines. They provide the elapsed CPU time for the job, and    ##  AA58  35
##  the wallclock time and date.                                    ##  AA58  36
##                                                                  ##  AA58  37
######################################################################  AA58  38
#                                                                       AA58  39
ifsel:(UNXHP,UNXIBM,UNXLNX)## HPUX f77, IBM AIX xlf, Linux f2c+gc       AA58  40
systemheader:(UNXC)#                                                    UNXC   1
extrude:('datim.c')#                                                    UNXC   2
/*#                                                                     UNXC   3
flagon:(R)#                            Prevent tidying                          
*/                                                                              
/* The following C routines are callable from FORTRAN and provide               
 * access to Unix CPU time, wallclock time and date utilities.                  
 * The routines emulate the f77 library functions ETIME and FDATE, which        
 * are available on most versions of Unix - except HP (coming in 9.0) an        
 * IBM's AIX...                                                                 
 * The code has been tested and runs on the following:                          
 *   HP 9000 Series 700 under HPUX 8.07                                         
 *   IBM RS/6000 under AIX 3.1                                                  
 *   DEC 5000 Series under Ultrix 4.2                                           
 *   SGI 4D25 under Irix 3.3                                                    
 *   Sun SPARCstation under SunOS 4.1.1 (Note: the value returned by eti        
 *       must be ignored as it is incorrect: the correct value of the CP        
 *       time is given by the sum of the two array elements passed to et        
 *                                                                              
 *       This problem arises because the return value is always promoted        
 *       a float to a double. Different architectures handle this in dif        
 *       ways.                                                                  
 *                                                                              
 * This code should be applicable for most versions of Unix.                    
*/                                                                              
                                                                                
/* Elapsed CPU time routine for FORTRAN etime.                                  
 * This version tries to be correct about getting clock ticks.                  
 * Alternate entries are provided: ETIME and etime_ in case the                 
 * FORTRAN code is compiled with -U or +ppu, or the f77 compiler automat        
 * appends underscores to externals.                                            
*/                                                                              
/* Original etime code by Bob Montgomery, HP */                                 
                                                                                
#include <unistd.h>                                                             
#include <sys/times.h>                                                          
                                                                                
static long ticks = 0;                                                          
                                                                                
float                                                                           
etime(tarray)                                                                   
float *tarray;                                                                  
{                                                                               
   struct tms buffer;                                                           
                                                                                
   (void) times(&buffer);                                                       
   if (ticks == 0) {                                                            
      ticks = sysconf(_SC_CLK_TCK);                                             
   }                                                                            
   tarray[0] = (double)(buffer.tms_utime)/ticks;                                
   tarray[1] = (double)(buffer.tms_stime)/ticks;                                
   return (tarray[0] + tarray[1]);                                              
}                                                                               
                                                                                
float                                                                           
ETIME(tarray)                                                                   
float *tarray;                                                                  
{                                                                               
   return(etime(tarray));                                                       
}                                                                               
                                                                                
float                                                                           
etime_(tarray)                                                                  
float *tarray;                                                                  
{                                                                               
   return(etime(tarray));                                                       
}                                                                               
                                                                                
                                                                                
/* Date and wallclock time routine for FORTRAN fdate.                           
 * Alternate entries are provided: FDATE and fdate_ in case the                 
 * FORTRAN code is compiled with -U or +ppu, or the compiler automatical        
 * appends underscores to externals.                                            
*/                                                                              
/* Mark Favas */                                                                
                                                                                
#include <time.h>                                                               
#include <string.h>                                                             
                                                                                
void                                                                            
fdate(s)                                                                        
char *s;                                                                        
{                                                                               
   char *t;                                                                     
   time_t tloc;                                                                 
   size_t count = 24;                                                           
                                                                                
   (void) time(&tloc);                                                          
   t = ctime(&tloc);                                                            
   (void) strncpy(s,t,count);                                                   
}                                                                               
                                                                                
void                                                                            
fdate_(s)                                                                       
char *s;                                                                        
{                                                                               
   void fdate();                                                                
   fdate(s);                                                                    
}                                                                               
                                                                                
void                                                                            
FDATE(s)                                                                        
char *s;                                                                        
{                                                                               
   void fdate();                                                                
   fdate(s);                                                                    
}                                                                               
endext:#                                                                        
#############################################################                   
extrude:('lnblnk.c')#                                                  U        
                                                                                
/* The following C routine is callable from FORTRAN and provides                
 * a LNBLNK(string) function (i.e. last non blank of string) which is           
 * currently not available in the LINUX ftoc f77 fortran emmulator or fo        
 * Timo and Doug June 95                                                        
*/                                                                              
#include <ctype.h>                                                              
                                                                                
int lnblnk_(char *s, int len)                                                   
{                                                                               
	s += len - 1;                                                                  
	while (isspace(*s--)) len--;                                                   
	return (len);                                                                  
}                                                                               
                                                                                
int lnblnk(char *s, int len)                                                    
{                                                                               
        return (lnblnk_(s,len));                                                
}                                                                               
                                                                                
int LNBLNK(char *s, int len)                                                    
{                                                                               
        return (lnblnk_(s,len));                                                
}                                                                               
endext:#                                                                        
                                                                                
flagoff:(R)#                                                                    
endsel:#                                                                UNXC 138
####################################################################### UNXC 139
ifsel:(UNXLNX)## Linux                                                  UNXC 140
systemheader:(UNXLIN)#                                                  UNXL   1
extrude:('bitws.c')#                                                    UNXL   2
/*#                                                                     UNXL   3
flagon:(R)#                            Prevent tidying                          
*/                                                                              
/* The following C routines are callable from FORTRAN and provide               
 * access to Unix bitwise functions.                                            
 * The routines emulate the f77 library functions IAND,ISHFT and IEOR.          
 * James Hester July 94                                                         
*/                                                                              
                                                                                
/*C Code to implement fortran functions IAND, ISHFT and IEOR*/                  
                                                                                
int                                                                             
iand_(first,second)                                                             
int *first,*second;    /*fortran passes pointers to variables*/                 
   {                                                                            
    return(*first&*second);                                                     
   }                                                                            
                                                                                
int                                                                             
ieor_(first,second)                                                             
int *first,*second;    /*fortran passes pointers to variables*/                 
   {                                                                            
    return((*first|*second)&~(*first&*second));                                 
   }                                                                            
                                                                                
int                                                                             
ishft_(first,nshfts)                                                            
int *first,*nshfts;   /*fortran passes pointers to variables*/                  
     {                                                                          
     if(*nshfts>=0)                                                             
     {                                                                          
      return(*first<<*nshfts);                                                  
     }                                                                          
     else                                                                       
     {                                                                          
      return(*first>>-(*nshfts));                                               
     }                                                                          
     }                                                                          
endext:#                                                                        
flagoff:(R)#                                                                    
endsel:#                                                                UNXL  43
######################################################################  UNXL  44
ifsel:(UNXCVX)## Convex Unix BSD 4.3 f77 compiler                       UNXL  45
systemheader:(UNXCVX)#                                                  UNXC   1
#---------------------------------------------------------------------- UNXC   2
SUBROUTINE AA70(TTIM)#                 Used in getcpus:                 UNXC   3
REAL ETIME#                            External function                UNXC   4
REAL TTIM,ETIM(2)#                                                      UNXC   5
TTIM=ETIME(ETIM)#                      Get total, elapsed & system      UNXC   6
RETURN#                                                                 UNXC   7
END#                                                                    UNXC   8
#---------------------------------------------------------------------- UNXC   9
SUBROUTINE AA71(CLOCK)#                Used in gettime:                 UNXC  10
INTEGER IA(3)#                                                          UNXC  11
CHARACTER*8 CLOCK#                                                      UNXC  12
CALL ITIME(IA)#                        Get time in hh,mm,ss             UNXC  13
WRITE(CLOCK,'(I2,1H:,I2,1H:,I2)') IA#  Format as hh:mm:ss               UNXC  14
RETURN#                                                                 UNXC  15
END#                                                                    UNXC  16
#---------------------------------------------------------------------- UNXC  17
SUBROUTINE AA72(DATUM)#                Used in getdate:                 UNXC  18
CHARACTER DATUM*8,C*24#                                                 UNXC  19
CALL FDATE(C)#                         Get 'thu nov 24 18:22:48 1986'   UNXC  20
DATUM=C(9^10)//'-'//C(5^7)//C(23^24)#  Store as 'dd-mmmyy'              UNXC  21
RETURN#                                                                 UNXC  22
END#                                                                    UNXC  23
#---------------------------------------------------------------------- UNXC  24
SUBROUTINE AA73(INT,REL,NST,NBT)#      Used in intpak:                  UNXC  25
INTEGER INT,REL,NST,NBT,I#                                              UNXC  26
I=JIAND(JNOT(JISHFT(-1,NBT)),JISHFT(REL,-NST))# Get the positive inte   UNXC  27
REL=JIEOR(REL,JISHFT(JIEOR(INT,I),NST))# Pack slice into real           UNXC  28
RETURN#                                                                 UNXC  29
END#                                                                    UNXC  30
#---------------------------------------------------------------------- UNXC  31
SUBROUTINE AA74(REL,INT,NST,NBT)#      Used in intunpak:                UNXC  32
INTEGER INT,REL,NST,NBT#                                                UNXC  33
INT=JIAND(JNOT(JISHFT(-1,NBT)),JISHFT(REL,-NST))# Get the positive in   UNXC  34
RETURN#                                                                 UNXC  35
END#                                                                    UNXC  36
#                                                                       UNXC  37
####################################################################### UNXC  38
ifsel:(UNX,MSNT)#                      Generic unix routines            UNXC  39
systemheader:(UNX/NT)#                                                  UNX/   1
SUBROUTINE AA70(TTIM)#                 Used in getcpus:                 UNX/   2
EXTERNAL ETIME#                                                         UNX/   3
REAL ETIME#                                                             UNX/   4
REAL TTIM#                                                              UNX/   5
REAL ETIM(2)#                                                           UNX/   6
TTIM=ETIME(ETIM)#                      Get total, elapsed & system      UNX/   7
TTIM=ETIM(1)+ETIM(2)#                  Most portable way to do it       UNX/   8
RETURN#                                                                 UNX/   9
END#                                                                    UNX/  10
#---------------------------------------------------------------------- UNX/  11
SUBROUTINE AA71(CLOCK)#                Used in gettime:                 UNX/  12
EXTERNAL FDATE#                                                         UNX/  13
CHARACTER*8 CLOCK#                                                      UNX/  14
CHARACTER*24 CDATE#                                                     UNX/  15
CALL FDATE(CDATE)#                     As "mon aug 31 18:22:48 1992"    UNX/  16
CLOCK=CDATE(12^19)#                    Extract hh:mm:ss field           UNX/  17
RETURN#                                                                 UNX/  18
END#                                                                    UNX/  19
#---------------------------------------------------------------------- UNX/  20
SUBROUTINE AA72(DATUM)#                Used in getdate:                 UNX/  21
EXTERNAL FDATE#                                                         UNX/  22
CHARACTER*8 DATUM#                                                      UNX/  23
CHARACTER*24 CDATE#                                                     UNX/  24
CALL FDATE(CDATE)#                     As "mon aug 31 18:22:48 1992"    UNX/  25
DATUM(1^3)=CDATE(9^10)//'-'#           Get "dd-"                        UNX/  26
DATUM(4^6)=CDATE(5^7)#                 Get "mmm"                        UNX/  27
DATUM(7^8)=CDATE(23^24)#               Get "yy"                         UNX/  28
RETURN#                                                                 UNX/  29
END#                                                                    UNX/  30
#---------------------------------------------------------------------- UNX/  31
SUBROUTINE AA73(INT,REL,NST,NBT)#      Used in intpak:                  UNX/  32
INTEGER INT,REL,NST,NBT,I#                                              UNX/  33
IF(NBT==mxbtwd:) $(REL=INT; RETURN $)# Mainly for some strange f77's    UNX/  34
I=IAND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get positive integer        UNX/  35
REL=IEOR(REL,ISHFT(IEOR(INT,I),NST))#  Pack slice into real             UNX/  36
RETURN#                                                                 UNX/  37
END#                                                                    UNX/  38
#---------------------------------------------------------------------- UNX/  39
SUBROUTINE AA74(REL,INT,NST,NBT)#      Used in intunpak:                UNX/  40
INTEGER INT,REL,NST,NBT#                                                UNX/  41
IF(NBT==mxbtwd:) $(INT=REL; RETURN $)# Mainly for some strange f77's    UNX/  42
INT=IAND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get positive integer      UNX/  43
RETURN#                                                                 UNX/  44
END#                                                                    UNX/  45
#                                                                       UNX/  46
####################################################################### UNX/  47
ifsel:(VMS)## DEC Vax VMS compiler                                      UNX/  48
systemheader:(VMS   )#                                                  VMS    1
#---------------------------------------------------------------------- VMS    2
SUBROUTINE AA70(ETIM)#                 Used in getcpus:                 VMS    3
INTEGER CALLIST(4)#                                                     VMS    4
INTEGER CPUT#                                                           VMS    5
SAVE ICPUT#                                                             VMS    6
REAL TTIM,ETIM#                                                         VMS    7
intdata:(ICPUT,0);   datastuff:#                                        VMS    8
CALLIST(1) = '4070004'X#               Set up calling sequence          VMS    9
CALLIST(2) = %LOC(CPUT)#               For the system call to           VMS   10
CALLIST(3) = 0#                        Getjpi.                          VMS   11
CALLIST(4) = 0#                                                         VMS   12
CALL SYS$$GETJPI(,,,CALLIST,,,)#       Get job/process information      VMS   13
IF(ICPUT == 0)  ICPUT = CPUT#                                           VMS   14
ETIM = FLOAT(CPUT-ICPUT)*0.01#         Time returned from getjpi is     VMS   15
RETURN#                                                                 VMS   16
END#                                                                    VMS   17
#---------------------------------------------------------------------- VMS   18
SUBROUTINE AA71(TYM)#                  Used in gettime:                 VMS   19
CHARACTER TYM*8#                                                        VMS   20
CALL TIME(TYM)#                                                         VMS   21
RETURN#                                                                 VMS   22
END#                                                                    VMS   23
#---------------------------------------------------------------------- VMS   24
SUBROUTINE AA72(DATUM)#                Used in getdate:                 VMS   25
CHARACTER*8 DATUM#                                                      VMS   26
CHARACTER*9 VDATE#                                                      VMS   27
CALL DATE(VDATE)#                      Get as "dd-mmm-yy"               VMS   28
DATUM(1^6)=VDATE(1^6)#                 Get "dd-mmm"                     VMS   29
DATUM(7^8)=VDATE(8^9)#                 Get "yy"                         VMS   30
RETURN#                                                                 VMS   31
END#                                                                    VMS   32
#---------------------------------------------------------------------- VMS   33
SUBROUTINE AA73(INT,REL,NST,NBT)#      Used in intpak:                  VMS   34
INTEGER INT,REL,NST,NBT,I,NNST#                                         VMS   35
I=IAND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get the positive integer    VMS   36
REL=IEOR(REL,ISHFT(IEOR(INT,I),NST))#  Pack slice into real             VMS   37
RETURN#                                                                 VMS   38
END#                                                                    VMS   39
#---------------------------------------------------------------------- VMS   40
SUBROUTINE AA74(REL,INT,NST,NBT)#      Used in intunpak:                VMS   41
INTEGER INT,REL,NST,NBT#                                                VMS   42
INT=IAND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get the positive intege   VMS   43
RETURN#                                                                 VMS   44
END#                                                                    VMS   45
#---------------------------------------------------------------------- VMS   46
SUBROUTINE AA75#                       Essentially vms localstart:      VMS   47
include:(AACOMN)#                      Require xtalhome variable        VMS   48
#                                                                       VMS   49
string:(TEMP,256)#                     Dummy string                     VMS   50
LOGICAL STATUS#                        Boolean test for variable exis   VMS   51
INTEGER SYS$$TRNLNM#                   External to evaluate system ca   VMS   52
INTEGER JPLIST4(4)#                    Standard 4 byte word             VMS   53
INTEGER*2 JPLIST2(8),LTEMP#            Short word equivalent            VMS   54
EQUIVALENCE (JPLIST2,JPLIST4)#                                          VMS   55
flagon:(R)#                                                                     
            INCLUDE '($LNMDEF)/LIST'                                            
flagoff:(R)#                                                                    
#                                                                       VMS   59
TEMP=' ';  XTALHOME=' '#               Initialise as null               VMS   60
JPLIST2(1)=LEN(TEMP)#                  Get length of temp string?       VMS   61
JPLIST2(2)=LNM$$_STRING#               Lnm function ?                   VMS   62
JPLIST4(2)=%LOC(TEMP)#                 Lnm function ?                   VMS   63
JPLIST4(3)=%LOC(LTEMP)#                Lnm function ?                   VMS   64
JPLIST4(4)=0#                          Set null                         VMS   65
STATUS=SYS$$TRNLNM( ,'LNM$PROCESS','XTALHOME', ,JPLIST4)# Test enviro   VMS   66
IF(STATUS)XTALHOME=TEMP(1^LTEMP)#      Environment variable exists      VMS   67
RETURN#                                                                 VMS   68
END#                                                                    VMS   69
#---------------------------------------------------------------------- VMS   70
INTEGER FUNCTION LNBLNK(STRG)#         Essentially vms localstart:      VMS   71
#                                                                       VMS   72
string:(STRG,256)#                                                      VMS   73
INTEGER I#                                                              VMS   74
DO I=256,2,-1#                                                          VMS   75
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  VMS   76
IF(STRG(I^I)!=' ') BREAK#                                               VMS   77
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  VMS   78
LNBLNK=I#                                                               VMS   79
RETURN#                                                                 VMS   80
END#                                                                    VMS   81
#                                                                       VMS   82
####################################################################### VMS   83
ifsel:(LHPC)## Lahey f77 compiler                                       VMS   84
systemheader:(LHPC  )#                                                  LHPC   1
#---------------------------------------------------------------------- LHPC   2
SUBROUTINE AA70(ETIM)#                 Used in getcpus:                 LHPC   3
INTEGER FIRST,SECS#                                                     LHPC   4
SAVE FIRST#                                                             LHPC   5
REAL ETIM#                                                              LHPC   6
DATA FIRST/-1/#                                                         LHPC   7
CALL TIMER(SECS)#                      Get time in seconds              LHPC   8
IF(FIRST<0)    FIRST=SECS/100#         Initiate timer                   LHPC   9
IF(FIRST>SECS) FIRST=FIRST-86400#      Allow for midnight               LHPC  10
ETIM=FLOAT(SECS/100-FIRST)#            Get elapsed time in secs         LHPC  11
END#                                                                    LHPC  12
#---------------------------------------------------------------------- LHPC  13
SUBROUTINE AA71(CLOCK)#                Used in gettime:                 LHPC  14
CHARACTER CLOCK*8,TIM*11#                                               LHPC  15
CALL TIME(TIM)#                        Get time in hh:mm:ss             LHPC  16
CLOCK=TIM(1^8)#                                                         LHPC  17
END#                                                                    LHPC  18
#---------------------------------------------------------------------- LHPC  19
SUBROUTINE AA72(DATUM)#                Used in getdate:                 LHPC  20
CHARACTER*8 DATUM#                                                      LHPC  21
CALL DATE(DATUM)#                      Get date as mm, dd, yy           LHPC  22
END#                                                                    LHPC  23
#---------------------------------------------------------------------- LHPC  24
SUBROUTINE AA73(INT,REL,NST,NBT)#      Used in intpak:                  LHPC  25
INTEGER INT,REL,NST,NBT,I,J#                                            LHPC  26
J=NBT-32#                                                               LHPC  27
I=ISHFT(ISHFT(REL,-J-NST),J)#                                           LHPC  28
REL=IEOR(REL,ISHFT(IEOR(INT,I),NST))#  Put integer into real            LHPC  29
END#                                                                    LHPC  30
#---------------------------------------------------------------------- LHPC  31
SUBROUTINE AA74(REL,INT,NST,NBT)#      Used in intunpak:                LHPC  32
INTEGER INT,REL,NST,NBT,J#                                              LHPC  33
J=NBT-32#                                                               LHPC  34
INT=ISHFT(ISHFT(REL,-J-NST),J)#        Get integer from real            LHPC  35
END#                                                                    LHPC  36
#                                                                       LHPC  37
####################################################################### LHPC  38
ifsel:(IBM)## IBM non-unix compiler                                     LHPC  39
systemheader:(IBM   )#                                                  IBM    1
#---------------------------------------------------------------------- IBM    2
SUBROUTINE AA70(ETIM)#                                                  IBM    3
REAL ETIM#                                                              IBM    4
DOUBLE PRECISION CPUX0,CPUX#                                            IBM    5
INTEGER IRC,FIRST#                                                      IBM    6
SAVE FIRST,CPUX0#                                                       IBM    7
DATA FIRST/0/#                                                          IBM    8
CALL CPUTIME(CPUX,IRC)#                Get the cpu time                 IBM    9
IF(FIRST==0)#                          For the first entry              IBM   10
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  IBM   11
FIRST=1;  CPUX0=CPUX#                  Store initial time               IBM   12
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  IBM   13
ETIM=(CPUX-CPUX0)*1.0D-06#             Get elapsed cpu seconds          IBM   14
RETURN#                                                                 IBM   15
END#                                                                    IBM   16
#---------------------------------------------------------------------- IBM   17
SUBROUTINE AA71(TYM)#                  Wall clock time                  IBM   18
INTEGER IA(8)#                                                          IBM   19
CHARACTER*8 TYM#                                                        IBM   20
CALL DATIM(IA)#                        Get date and time                IBM   21
WRITE(TYM,'(I2,1H:,I2,1H:,I2)') IA(5),IA(4),IA(3)#                      IBM   22
RETURN#                                                                 IBM   23
END#                                                                    IBM   24
#---------------------------------------------------------------------- IBM   25
SUBROUTINE AA72(DATUM)#                Date as dd-mmmyy                 IBM   26
INTEGER IA(8),J#                                                        IBM   27
CHARACTER*8 DATUM#                                                      IBM   28
chardata:(M,'JanFebMarAprMayJunJulAugSepOctNovDec')#                    IBM   29
datastuff:#                                                             IBM   30
CALL DATIM(IA);  J=IA(7)*3#            Get date as integers             IBM   31
WRITE(DATUM,'(i2,1h-,A3,i2)')IA(6),M(J-2^J),IA(8)-1900#                 IBM   32
RETURN#                                                                 IBM   33
END#                                                                    IBM   34
#---------------------------------------------------------------------- IBM   35
SUBROUTINE AA73(INT,REL,NST,NBT)#      Int,real,start,nbits             IBM   36
INTEGER I,INT,MSKI,MSKR,NBT,NST,REL#                                    IBM   37
MSKI=NOT(ISHFT(-1,NBT))#               Source mask                      IBM   38
MSKR=NOT(ISHFT(MSKI,NST))#             Target mask                      IBM   39
REL=IOR(IAND(MSKR,REL),ISHFT(IAND(MSKI,INT),NST))# Pack slice           IBM   40
RETURN#                                                                 IBM   41
END#                                                                    IBM   42
#---------------------------------------------------------------------- IBM   43
SUBROUTINE AA74(REL,INT,NST,NBT)#      Real,int,start,nbits             IBM   44
INTEGER INT,REL,NST,NBT#                                                IBM   45
INT=IAND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get positive integer      IBM   46
RETURN#                                                                 IBM   47
END#                                                                    IBM   48
#                                                                       IBM   49
####################################################################### IBM   50
ifsel:(SIE)## Siemens bs2000 v7.5 /for1                                 IBM   51
systemheader:(SIE   )#                                                  SIE    1
#--------------------------------------------------------------------   SIE    2
SUBROUTINE AA70(ETIM)#                 Elapsed  total time              SIE    3
REAL TTIM,ETIM#                                                         SIE    4
INTEGER H,M,S,ZL,FLAG#                                                  SIE    5
SAVE FLAG,TTIM#                                                         SIE    6
CHARACTER*45 SCRATCH#                                                   SIE    7
DATA FLAG/0/#                                                           SIE    8
CALL GEPRT(H,M,S,ZL,SCRATCH)#          Get elapsed proc. time           SIE    9
ETIM=3600.*H+60.*M+S+0.0001*ZL#        Get total time                   SIE   10
IF(FLAG==0)#                           Test for first entry             SIE   11
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SIE   12
FLAG=1;  TTIM=ETIM#                    Store initial time               SIE   13
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SIE   14
ETIM=ETIM-TTIM#                        Get elapsed time                 SIE   15
RETURN#                                                                 SIE   16
END#                                                                    SIE   17
#--------------------------------------------------------------------   SIE   18
SUBROUTINE AA71(CLOCK)#                Wall clock time                  SIE   19
CHARACTER H*2,M*2,S*2,SCRATCH*6#                                        SIE   20
CHARACTER*8 CLOCK#                                                      SIE   21
CALL GETOD(H,M,S,SCRATCH)#             Get elapsed time of day          SIE   22
CLOCK=H//':'//M//':'//S#               Format as hh:mm:ss               SIE   23
RETURN#                                                                 SIE   24
END#                                                                    SIE   25
#--------------------------------------------------------------------   SIE   26
SUBROUTINE AA72(DATUM)#                Date as dd-mmmyy                 SIE   27
INTEGER I,J#                                                            SIE   28
CHARACTER I1,I2,I3,I4*3,DATUM*8,SCRATCH*12#                             SIE   29
chardata:(MTHS,'JanFebMarAprMayJunJulAugSepOctNovDec')#                 SIE   30
chardata:(ICNT,'0123456789')#                                           SIE   31
datastuff:#                                                             SIE   32
CALL GDATE(I1,I2,I3,I4,SCRATCH)#       Get date as int m/d/y            SIE   33
I=INDEX(ICNT(2^10),I1(1^1))#           Get left month digit             SIE   34
J=INDEX(ICNT,I1(2^2))#                 Get right month digit            SIE   35
IF(J>0) I=10*I+J-1#                    Build number                     SIE   36
I=3*I-2#                               Point to month string            SIE   37
DATUM(4^6)=MTHS(I^I+2)#                Get month string                 SIE   38
DATUM(1^2)=I2#                         Get dd                           SIE   39
DATUM(3^3)='-'#                        Add hyphen                       SIE   40
DATUM(7^8)=I3#                         Get yy                           SIE   41
RETURN#                                                                 SIE   42
END#                                                                    SIE   43
#--------------------------------------------------------------------   SIE   44
SUBROUTINE AA73(INT,REL,NST,NBT)#      Int,real,start,nbits             SIE   45
INTEGER INT,REL,NST,NBT,I,J#                                            SIE   46
J=32-NBT#                                                               SIE   47
I=ISRL(ISLL(REL,J-NST),J)#             Set mask of slice                SIE   48
REL=IXOR(REL,ISLL(IXOR(INT,I),NST))#   Pack slice into real             SIE   49
RETURN#                                                                 SIE   50
END#                                                                    SIE   51
#--------------------------------------------------------------------   SIE   52
SUBROUTINE AA74(REL,INT,NST,NBT)#      Real,int,start,nbits             SIE   53
INTEGER INT,REL,NST,NBT,J#                                              SIE   54
J=32-NBT#                                                               SIE   55
INT=ISRL(ISLL(REL,J-NST),J)#           Unpack int from real             SIE   56
RETURN#                                                                 SIE   57
END#                                                                    SIE   58
#                                                                       SIE   59
####################################################################### SIE   60
ifsel:(CRAY)## CRAY non-unix COS compiler                               SIE   61
systemheader:(CRAY  )#                                                  CRAY   1
#---------------------------------------------------------------------  CRAY   2
SUBROUTINE AA70(ETIM)#                 Elapsed cpu time                 CRAY   3
REAL ETIM#                                                              CRAY   4
CALL SECOND(ETIM)#                     Elapsed cpu time in seconds      CRAY   5
RETURN#                                                                 CRAY   6
END#                                                                    CRAY   7
#---------------------------------------------------------------------  CRAY   8
SUBROUTINE AA71(TIME)#                 Wall clock time hh:mm:ss         CRAY   9
CHARACTER*8 TIME#                                                       CRAY  10
CALL CLOCK(TIME)#                      Get time as string               CRAY  11
RETURN#                                                                 CRAY  12
END#                                                                    CRAY  13
#---------------------------------------------------------------------  CRAY  14
SUBROUTINE AA72(DATUM)#                Date as dd/mm/yy                 CRAY  15
INTEGER I,J#                                                            CRAY  16
CHARACTER*8 DATUM,DAT#                                                  CRAY  17
chardata:(MTHS,'JanFebMarAprMayJunJulAugSepOctNovDec')#                 CRAY  18
chardata:(ICNT,'0123456789')#                                           CRAY  19
datastuff:#                                                             CRAY  20
CALL DATE(DAT)#                        Get date as  dd/mm/yy            CRAY  21
I=INDEX(ICNT(2^10),DAT(4^4))#          Get left month digit             CRAY  22
J=INDEX(ICNT,DAT(5^5))#                Get right month digit            CRAY  23
IF(J>0) I=10*I+J-1#                    Build number                     CRAY  24
I=3*I-2#                               Point to month string            CRAY  25
DATUM(4^6)=MTHS(I^I+2)#                Get month string                 CRAY  26
DATUM(1^2)=DAT(1^2)#                   Get dd                           CRAY  27
DATUM(3^3)='-'#                        Add hyphen                       CRAY  28
DATUM(7^8)=DAT(7^8)#                   Get yy                           CRAY  29
RETURN#                                                                 CRAY  30
END#                                                                    CRAY  31
#---------------------------------------------------------------------  CRAY  32
SUBROUTINE AA73(INT,REL,NST,NBT)#      Int,real,start,nbits             CRAY  33
INTEGER INT,REL,NST,NBT,I#                                              CRAY  34
I=SHIFT(MASK(NBT),NST+NBT)#            Get positive integer             CRAY  35
REL=(SHIFT(INT,NST)&I)\(REL&!I)#       Pack slice into real             CRAY  36
RETURN#                                                                 CRAY  37
END#                                                                    CRAY  38
#---------------------------------------------------------------------  CRAY  39
SUBROUTINE AA74(REL,INT,NST,NBT)#      Real,int,start,nbits             CRAY  40
INTEGER INT,REL,NST,NBT#                                                CRAY  41
INT=SHIFT(MASK(NBT),NBT)&SHIFTR(REL,NST)# Get positive integer          CRAY  42
RETURN#                                                                 CRAY  43
END#                                                                    CRAY  44
#                                                                       CRAY  45
####################################################################### CRAY  46
ifsel:(MAC)## Macintosh Language Systems f77                            CRAY  47
systemheader:(MAC   )#                                                  MAC    1
#--------------------------------------------------------------------   MAC    2
SUBROUTINE AA70(TTIM)#                 Used in getcpus:                 MAC    3
REAL TTIM,OTIM#                                                         MAC    4
INTEGER INI#                                                            MAC    5
SAVE INI,OTIM#                                                          MAC    6
DATA INI /0/#                                                           MAC    7
IF(INI==0)#                                                             MAC    8
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  MAC    9
INI=1;  OTIM=SECNDS(0.0)#              Initial time in seconds          MAC   10
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  MAC   11
TTIM=SECNDS(OTIM)#                     Get total, elapsed & system      MAC   12
RETURN#                                                                 MAC   13
END#                                                                    MAC   14
#---------------------------------------------------------------------- MAC   15
SUBROUTINE AA71(CLOCK)#                Used in gettime:                 MAC   16
CHARACTER*8 CLOCK#                                                      MAC   17
CALL TIME(CLOCK)#                      Get time in hh,mm,ss             MAC   18
RETURN#                                                                 MAC   19
END#                                                                    MAC   20
#---------------------------------------------------------------------- MAC   21
SUBROUTINE AA72(DATUM)#                Used in getdate:                 MAC   22
CHARACTER*8 DATUM#                                                      MAC   23
CHARACTER*9 DAT#                                                        MAC   24
CALL DATE(DAT)#                        Get date as 11-apr-92            MAC   25
DATUM(1^6)=DAT(1^6); DATUM(7^8)=DAT(8^9)# Get as 11-apr92               MAC   26
RETURN#                                                                 MAC   27
END#                                                                    MAC   28
#---------------------------------------------------------------------- MAC   29
SUBROUTINE AA73(INT,REL,NST,NBT)#      Used in intpak:                  MAC   30
INTEGER INT,REL,NST,NBT,I,NNST#                                         MAC   31
I=IAND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get the positive integer    MAC   32
REL=IEOR(REL,ISHFT(IEOR(INT,I),NST))#  Pack slice into real             MAC   33
RETURN#                                                                 MAC   34
END#                                                                    MAC   35
#---------------------------------------------------------------------- MAC   36
SUBROUTINE AA74(REL,INT,NST,NBT)#      Used in intunpak:                MAC   37
INTEGER INT,REL,NST,NBT#                                                MAC   38
INT=IAND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get the positive intege   MAC   39
RETURN#                                                                 MAC   40
END#                                                                    MAC   41
#                                                                       MAC   42
####################################################################### MAC   43
ifsel:(SLPC)## Salford ftn77/x86 compiler                               MAC   44
systemheader:(SLPC  )#                                                  SLPC   1
#---------------------------------------------------------------------  SLPC   2
SUBROUTINE AA70(ETIM)#                 Used in getcpus:                 SLPC   3
REAL ETIM,FIRST,SECS#                                                   SLPC   4
DATA FIRST/-1.0/#                                                       SLPC   5
CALL CLOCK@(SECS)#                     Get time in seconds              SLPC   6
IF(FIRST<0.0)  FIRST=SECS#             Initiate timer                   SLPC   7
IF(FIRST>SECS) FIRST=FIRST-86400.0#    Allow for midnight               SLPC   8
ETIM=SECS-FIRST#                       Get elapsed time in secs         SLPC   9
END#                                                                    SLPC  10
#---------------------------------------------------------------------  SLPC  11
SUBROUTINE AA71(CLOCK)#                Used in gettime:                 SLPC  12
string:(CLOCK,*); string:(TIME@,8)#                                     SLPC  13
CLOCK=TIME@()#                         Get time in hh:mm:ss             SLPC  14
END#                                                                    SLPC  15
#---------------------------------------------------------------------  SLPC  16
SUBROUTINE AA72(DATUM)#                Used in getdate:                 SLPC  17
INTEGER I,J,MONTH#                                                      SLPC  18
string:(DATUM,8)#                                                       SLPC  19
string:(EDATE@,8)#                                                      SLPC  20
string:(TEMP,8)#                                                        SLPC  21
chardata:(DIGITS,'0123456789 ')#                                        SLPC  22
chardata:(MTHS,'JanFebMarAprMayJunJulAugSepOctNovDec')#                 SLPC  23
datastuff:#                                                             SLPC  24
TEMP=EDATE@()#                         Get date as dd/mm/yy             SLPC  25
MONTH=0#                                                                SLPC  26
DO I=1,2#                                                               SLPC  27
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC  28
J=MOD(INDEX(DIGITS,TEMP(I+3^I+3))-1,10)#                                SLPC  29
MONTH=MONTH*10+J#                                                       SLPC  30
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC  31
TEMP(3^3)=' '#                                                          SLPC  32
TEMP(4^6)=MTHS(MONTH*3-2^MONTH*3)#                                      SLPC  33
DATUM=TEMP#                                                             SLPC  34
RETURN#                                                                 SLPC  35
END#                                                                    SLPC  36
#---------------------------------------------------------------------  SLPC  37
SUBROUTINE AA73(INT,REL,NST,NBT)#      Used in intpak:                  SLPC  38
## Put nbt bits from INT into REL starting at bit NST                   SLPC  39
INTEGER INT,REL,NST,NBT,MSKI,MSKR#                                      SLPC  40
IF(NBT==mxbtwd:) REL=INT#                                               SLPC  41
ELSE#                                                                   SLPC  42
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC  43
MSKI=NOT(SHFT(-1,-NBT))#               Build integer mask               SLPC  44
MSKR=NOT(SHFT(MSKI,-NST))#             Build real mask                  SLPC  45
REL=IOR(IAND(MSKR,REL),SHFT(IAND(MSKI,INT),-NST))#                      SLPC  46
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC  47
RETURN#                                                                 SLPC  48
END#                                                                    SLPC  49
#---------------------------------------------------------------------  SLPC  50
SUBROUTINE AA74(REL,INT,NST,NBT)#                                       SLPC  51
## Get nbt bits from REL starting at bit NST and create INT             SLPC  52
INTEGER INT,REL,NST,NBT#                                                SLPC  53
IF(NBT==mxbtwd:) INT=REL#                                               SLPC  54
ELSE INT=IAND(NOT(SHFT(-1,-NBT)),SHFT(REL,NST))#                        SLPC  55
RETURN#                                                                 SLPC  56
END#                                                                    SLPC  57
systemheader:(SLPCXS)#                 Xwindows subroutines for slpc    SLPC   1
macro:(maxs:,5000)## <<<<<<<<<<< current limit for display sites.       SLPC   2
macro:(plotpts:,1000)#                 Length of plot array             SLPC   3
macro:(segstep:,7)#                                                     SLPC   4
extrude:(XCOMN)#                                                        SLPC   5
INTEGER*4 CURPTR#                      Current open segment pointer     SLPC   6
INTEGER*2 COLI#                        Fill area colour index           SLPC   7
INTEGER*2 IX(plotpts:)#                X-array for plotting             SLPC   8
INTEGER*2 IY(plotpts:)#                Y-array for plotting             SLPC   9
INTEGER*2 PLCOLI#                      Polyline colour index            SLPC  10
INTEGER*2 PMCOLI#                      Polymarker colour index          SLPC  11
INTEGER*2 SEGSTOP#                     End of segment array             SLPC  12
INTEGER*2 STYPE#                       Screen type                      SLPC  13
INTEGER*2 ZSEG(arith:(segstep:,*,maxs:))# Segment information           SLPC  14
##ZSEG(SEGPTR)                         Segment number                   SLPC  15
##ZSEG(SEGPTR+1)                       Detectability (1/0 = yes/no)     SLPC  16
##ZSEG(SEGPTR+2)                       Polygon handle                   SLPC  17
##ZSEG(SEGPTR+3)                       Low  ix                          SLPC  18
##ZSEG(SEGPTR+4)                       High ix                          SLPC  19
##ZSEG(SEGPTR+5)                       Low  iy                          SLPC  20
##ZSEG(SEGPTR+6)                       High iy                          SLPC  21
REAL      CHSIZE#                      Character size                   SLPC  22
REAL      LWIDTH#                      Line width                       SLPC  23
REAL      MSZSF#                       Marker size scale factor         SLPC  24
REAL      XWIND#                       Pixels in x direction            SLPC  25
REAL      YWIND#                       Pixels in y direction            SLPC  26
COMMON/XSLCOMI/ CURPTR#                                                 SLPC  27
COMMON/XSLCOM2/ COLI,IX,IY,PLCOLI,PMCOLI,SEGSTOP,STYPE,ZSEG#            SLPC  28
COMMON/XSLCOMF/ CHSIZE,LWIDTH,MSZSF,XWIND,YWIND#                        SLPC  29
endext:#                                                                SLPC  30
#####################################################################   SLPC  31
#                                                                  ##   SLPC  32
#        XDEFC                   SET COLOUR REPRESENTATION         ##   SLPC  33
#                                                                  ##   SLPC  34
#####################################################################   SLPC  35
SUBROUTINE XDEFC(I1,R1,R2,R3)#                                          SLPC  36
include:(XCOMN)#                                                        SLPC  37
INTEGER I,I1#                                                           SLPC  38
INTEGER*2 CI,COLOUR#                                                    SLPC  39
REAL R1,R2,R3,RCOL(3)#                                                  SLPC  40
CI=I1#                                                                  SLPC  41
RCOL(1)=R1#                            Red                              SLPC  42
RCOL(2)=R2#                            Green                            SLPC  43
RCOL(3)=R3#                            Blue                             SLPC  44
COLOUR=0#                                                               SLPC  45
DO I=1,3#                                                               SLPC  46
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC  47
COLOUR=COLOUR*2#                                                        SLPC  48
IF     (RCOL(I)>0.83) COLOUR=COLOUR+9# Intense                          SLPC  49
ELSE IF(RCOL(I)>0.50) COLOUR=COLOUR+1# Normal                           SLPC  50
ELSE IF(RCOL(I)>0.16) COLOUR=COLOUR+8# Weak                             SLPC  51
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC  52
CALL SET_PALETTE@(CI,COLOUR)#                                           SLPC  53
RETURN#                                                                 SLPC  54
END#                                                                    SLPC  55
#####################################################################   SLPC  56
#                                                                  ##   SLPC  57
#        XFILL                   FILL AREA                         ##   SLPC  58
#                                                                  ##   SLPC  59
#####################################################################   SLPC  60
SUBROUTINE XFILL(I1,PX,PY)#                                             SLPC  61
INTEGER I,I1#                                                           SLPC  62
INTEGER*2 ERR,NPT,LX,LY,HX,HY#                                          SLPC  63
REAL PX(*),PY(*)#                                                       SLPC  64
include:(XCOMN)#                                                        SLPC  65
IF(I1>plotpts:) iquit:(AA9900)#                                         SLPC  66
NPT=I1#                                                                 SLPC  67
LX=640#                                                                 SLPC  68
HX=0#                                                                   SLPC  69
LY=640#                                                                 SLPC  70
HY=0#                                                                   SLPC  71
DO I=1,I1#                                                              SLPC  72
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC  73
IX(I)=PX(I)*XWIND#                                                      SLPC  74
IY(I)=(1.0-PY(I))*YWIND#                                                SLPC  75
IF(LX>IX(I)) LX=IX(I)#                                                  SLPC  76
IF(HX<IX(I)) HX=IX(I)#                                                  SLPC  77
IF(LY>IY(I)) LY=IY(I)#                                                  SLPC  78
IF(HY<IY(I)) HY=IY(I)#                                                  SLPC  79
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC  80
IF(CURPTR>0)#                          Update segment limits            SLPC  81
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  SLPC  82
IF(LX<ZSEG(CURPTR+3)) ZSEG(CURPTR+3)=LX#                                SLPC  83
IF(HX>ZSEG(CURPTR+4)) ZSEG(CURPTR+4)=HX#                                SLPC  84
IF(LY<ZSEG(CURPTR+5)) ZSEG(CURPTR+5)=LY#                                SLPC  85
IF(HY>ZSEG(CURPTR+6)) ZSEG(CURPTR+6)=HY#                                SLPC  86
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  SLPC  87
CALL CREATE_POLYGON@(IX,IY,NPT,ZSEG(CURPTR+2),ERR)#                     SLPC  88
IF(ERR!=0) iquit:(AA9910)#                                              SLPC  89
CALL FILL_POLYGON@(ZSEG(CURPTR+2),COLI,ERR)#                            SLPC  90
IF(ERR!=0) iquit:(AA9910)#                                              SLPC  91
IF(CURPTR==0) CALL DELETE_POLYGON_DEFINITION@(ZSEG(CURPTR+2),ERR)#      SLPC  92
IF(ERR!=0) iquit:(AA9910)#                                              SLPC  93
RETURN#                                                                 SLPC  94
END#                                                                    SLPC  95
#####################################################################   SLPC  96
#                                                                  ##   SLPC  97
#        XFINIS                  CLOSE WORKSTATION                 ##   SLPC  98
#                                                                  ##   SLPC  99
#####################################################################   SLPC 100
SUBROUTINE XFINIS()#                                                    SLPC 101
include:(XCOMN)#                                                        SLPC 102
INTEGER SEGPTR#                                                         SLPC 103
INTEGER*2 ERR#                                                          SLPC 104
DO SEGPTR=1,SEGSTOP,segstep:#                                           SLPC 105
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 106
IF(ZSEG(SEGPTR+2)!=0) $#                                                SLPC 107
CALL DELETE_POLYGON_DEFINITION@(ZSEG(SEGPTR+2),ERR)#                    SLPC 108
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 109
SEGSTOP=0#                                                              SLPC 110
CALL TEXT_MODE@#                                                        SLPC 111
RETURN#                                                                 SLPC 112
END#                                                                    SLPC 113
#####################################################################   SLPC 114
#                                                                  ##   SLPC 115
#        XFRAME                  START NEW FRAME                   ##   SLPC 116
#                                                                  ##   SLPC 117
#####################################################################   SLPC 118
SUBROUTINE XFRAME(I1)#                                                  SLPC 119
INTEGER I1#                                                             SLPC 120
INTEGER*2 M1,M2,M3#                                                     SLPC 121
CALL SET_TEXT_ATTRIBUTE@(1,1.0,0.0,0.0)#                                SLPC 122
REPEAT#                                                                 SLPC 123
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 124
CALL DRAW_TEXT@('Click a mouse button to continue',200,3,14)#           SLPC 125
CALL GET_MOUSE_POSITION@(M1,M2,M3)#                                     SLPC 126
IF(M3!=0) BREAK#                                                        SLPC 127
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 128
CALL CLEAR_SCREEN@#                    Start new plot frame             SLPC 129
RETURN#                                                                 SLPC 130
END#                                                                    SLPC 131
#####################################################################   SLPC 132
#                                                                  ##   SLPC 133
#        XGETMC                  GET NUMBER OF COLOURS AVAILABLE   ##   SLPC 134
#                                                                  ##   SLPC 135
#####################################################################   SLPC 136
SUBROUTINE XGETMC(I1)#                                                  SLPC 137
include:(XCOMN)#                                                        SLPC 138
INTEGER I1#                                                             SLPC 139
I1=14#                                                                  SLPC 140
RETURN#                                                                 SLPC 141
END#                                                                    SLPC 142
#####################################################################   SLPC 143
#                                                                  ##   SLPC 144
#        XGETSG                  REQUEST PICKED SEGMENT            ##   SLPC 145
#                                                                  ##   SLPC 146
#####################################################################   SLPC 147
SUBROUTINE XGETSG(I1)#                                                  SLPC 148
INTEGER I1,SEGPTR#                                                      SLPC 149
INTEGER*2 BSTAT,IH,IV,N#                                                SLPC 150
REAL BEGIN,END#                                                         SLPC 151
include:(XCOMN)#                                                        SLPC 152
CALL DISPLAY_MOUSE_CURSOR@#                                             SLPC 153
BSTAT=0#                                                                SLPC 154
REPEAT#                                                                 SLPC 155
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 156
CALL GET_MOUSE_POSITION@(IH,IV,BSTAT)#                                  SLPC 157
IF(MOD(BSTAT,2)!=0) BREAK#                                              SLPC 158
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 159
N=-1#                                                                   SLPC 160
DO SEGPTR=1,SEGSTOP,segstep:#                                           SLPC 161
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  SLPC 162
IF(ZSEG(SEGPTR+1)!=1) $(N=0; NEXT$)#                                    SLPC 163
IF(IH<ZSEG(SEGPTR+3)) NEXT#                                             SLPC 164
IF(IH>ZSEG(SEGPTR+4)) NEXT#                                             SLPC 165
IF(IV<ZSEG(SEGPTR+5)) NEXT#                                             SLPC 166
IF(IV>ZSEG(SEGPTR+6)) NEXT#                                             SLPC 167
N=1#                                                                    SLPC 168
BREAK#                                                                  SLPC 169
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  SLPC 170
IF(N==1) I1=ZSEG(SEGPTR)#                                               SLPC 171
ELSE     I1=0#                                                          SLPC 172
CALL HIDE_MOUSE_CURSOR@#                                                SLPC 173
CALL CLOCK@(BEGIN)#                                                     SLPC 174
REPEAT#                                Delay 0.2 second                 SLPC 175
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4  SLPC 176
CALL CLOCK@(END)#                                                       SLPC 177
IF(END-BEGIN>0.2) BREAK#                                                SLPC 178
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 4  SLPC 179
RETURN#                                                                 SLPC 180
END#                                                                    SLPC 181
#####################################################################   SLPC 182
#                                                                  ##   SLPC 183
#        XGETST                  REQUEST STRING                    ##   SLPC 184
#                                                                  ##   SLPC 185
#####################################################################   SLPC 186
SUBROUTINE XGETST(NCH,STR)#                                             SLPC 187
INTEGER NCH#                                                            SLPC 188
INTEGER*2 IC#                                                           SLPC 189
string:(STR,*)#                                                         SLPC 190
include:(XCOMN)#                                                        SLPC 191
NCH=0#                                                                  SLPC 192
REPEAT#                                                                 SLPC 193
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 194
CALL GET_KEY@(IC)#                                                      SLPC 195
IF((IC==13)&(NCH>0)) BREAK#            Enter key, must have 1 char      SLPC 196
NCH=NCH+1#                                                              SLPC 197
STR(NCH^NCH)=CHAR(IC)#                                                  SLPC 198
IF(NCH>=8) BREAK#                      8 chars maximum                  SLPC 199
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 200
RETURN#                                                                 SLPC 201
END#                                                                    SLPC 202
#####################################################################   SLPC 203
#                                                                  ##   SLPC 204
#        XGETXY                  REQUEST LOCATOR POSITION          ##   SLPC 205
#                                                                  ##   SLPC 206
#####################################################################   SLPC 207
SUBROUTINE XGETXY(R1,R2)#                                               SLPC 208
INTEGER*2 IH,IV,BSTAT#                                                  SLPC 209
REAL    R1,R2#                                                          SLPC 210
REAL BEGIN,END#                                                         SLPC 211
include:(XCOMN)#                                                        SLPC 212
CALL DISPLAY_MOUSE_CURSOR@#                                             SLPC 213
BSTAT=0#                                                                SLPC 214
REPEAT#                                                                 SLPC 215
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 216
CALL GET_MOUSE_POSITION@(IH,IV,BSTAT)#                                  SLPC 217
IF(MOD(BSTAT,2)!=0) BREAK#                                              SLPC 218
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 219
R1=REAL(IH)/XWIND#                                                      SLPC 220
R2=1.0-REAL(IV)/YWIND#                                                  SLPC 221
CALL HIDE_MOUSE_CURSOR@#                                                SLPC 222
CALL CLOCK@(BEGIN)#                                                     SLPC 223
REPEAT#                                Delay 0.2 second                 SLPC 224
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  SLPC 225
CALL CLOCK@(END)#                                                       SLPC 226
IF(END-BEGIN>0.2) BREAK#                                                SLPC 227
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  SLPC 228
RETURN#                                                                 SLPC 229
END#                                                                    SLPC 230
#####################################################################   SLPC 231
#                                                                  ##   SLPC 232
#        XLINES                  DRAW POLYLINE                     ##   SLPC 233
#                                                                  ##   SLPC 234
#####################################################################   SLPC 235
SUBROUTINE XLINES(I1,PX,PY,I2)#                                         SLPC 236
INTEGER I,I1,I2,NP#                                                     SLPC 237
REAL    PX(*),PY(*)#                                                    SLPC 238
include:(XCOMN)#                                                        SLPC 239
IF(I1>plotpts:) iquit:(AA9900)#                                         SLPC 240
DO I=1,I1#                                                              SLPC 241
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 242
IX(I)=PX(I)*XWIND#                                                      SLPC 243
IY(I)=(1.0-PY(I))*YWIND#                                                SLPC 244
IF((CURPTR>0)&(I1>1))#                 Update segment limits            SLPC 245
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  SLPC 246
IF(IX(I)<ZSEG(CURPTR+3)) ZSEG(CURPTR+3)=IX(I)#                          SLPC 247
IF(IX(I)>ZSEG(CURPTR+4)) ZSEG(CURPTR+4)=IX(I)#                          SLPC 248
IF(IY(I)<ZSEG(CURPTR+5)) ZSEG(CURPTR+5)=IY(I)#                          SLPC 249
IF(IY(I)>ZSEG(CURPTR+6)) ZSEG(CURPTR+6)=IY(I)#                          SLPC 250
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  SLPC 251
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 252
NP=I1#                                                                  SLPC 253
IF(I1>1) CALL POLYLINE@(IX,IY,NP,PLCOLI)#                               SLPC 254
ELSE     CALL SET_PIXEL@(IX(1),IY(1),PLCOLI)#                           SLPC 255
RETURN#                                                                 SLPC 256
END#                                                                    SLPC 257
#####################################################################   SLPC 258
#                                                                  ##   SLPC 259
#        XMARK                   DRAW POLYMARKER                   ##   SLPC 260
#                                                                  ##   SLPC 261
#####################################################################   SLPC 262
SUBROUTINE XMARK(I1,PX,PY)#                                             SLPC 263
INTEGER I,I1,CX,CY#                                                     SLPC 264
INTEGER*2 IA,IB#                                                        SLPC 265
REAL    PX(*),PY(*)#                                                    SLPC 266
include:(XCOMN)#                                                        SLPC 267
IB=MSZSF*YWIND#                                                         SLPC 268
IF(STYPE==3) IA=IB#                                                     SLPC 269
ELSE IA=MSZSF*XWIND#                                                    SLPC 270
DO I=1,I1#                                                              SLPC 271
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 272
CX=PX(I)*XWIND#                                                         SLPC 273
CY=(1.0-PY(I))*YWIND#                                                   SLPC 274
CALL ELLIPSE@(CX,CY,IA,IB,PMCOLI)#                                      SLPC 275
IF(CURPTR>0)#                          Update segment limits            SLPC 276
$(#                                    1>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  SLPC 277
IF((CX-IA)<ZSEG(CURPTR+3)) ZSEG(CURPTR+3)=CX-IA#                        SLPC 278
IF((CX+IA)>ZSEG(CURPTR+4)) ZSEG(CURPTR+4)=CX+IA#                        SLPC 279
IF((CY-IB)<ZSEG(CURPTR+5)) ZSEG(CURPTR+5)=CY-IB#                        SLPC 280
IF((CY+IB)>ZSEG(CURPTR+6)) ZSEG(CURPTR+6)=CY+IB#                        SLPC 281
$)#                                    1<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  SLPC 282
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 283
RETURN#                                                                 SLPC 284
END#                                                                    SLPC 285
#####################################################################   SLPC 286
#                                                                  ##   SLPC 287
#        XSCLOS                  CLOSE SEGMENT                     ##   SLPC 288
#                                                                  ##   SLPC 289
#####################################################################   SLPC 290
SUBROUTINE XSCLOS()#                                                    SLPC 291
include:(XCOMN)#                                                        SLPC 292
CURPTR=0#                                                               SLPC 293
RETURN#                                                                 SLPC 294
END#                                                                    SLPC 295
#####################################################################   SLPC 296
#                                                                  ##   SLPC 297
#        XSDEL                   DELETE SEGMENT                    ##   SLPC 298
#                                                                  ##   SLPC 299
#####################################################################   SLPC 300
SUBROUTINE XSDEL(I1)#                                                   SLPC 301
INTEGER I,I1#                                                           SLPC 302
INTEGER*2 IERR#                                                         SLPC 303
include:(XCOMN)#                                                        SLPC 304
DO CURPTR=1,SEGSTOP,segstep:#                                           SLPC 305
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 306
IF(ZSEG(CURPTR)==I1) BREAK#                                             SLPC 307
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 308
IF(ZSEG(CURPTR)!=I1) iquit:(AA9920)#                                    SLPC 309
IF(ZSEG(CURPTR+2)!=0)#                                                  SLPC 310
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  SLPC 311
CALL DELETE_POLYGON_DEFINITION@(ZSEG(CURPTR+2),IERR)#                   SLPC 312
IF(IERR!=0) iquit:(AA9910)#                                             SLPC 313
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  SLPC 314
DO I=CURPTR,SEGSTOP-segstep:; ZSEG(I)=ZSEG(I+segstep:)#                 SLPC 315
SEGSTOP=SEGSTOP-segstep:#                                               SLPC 316
CURPTR=0#                                                               SLPC 317
RETURN#                                                                 SLPC 318
END#                                                                    SLPC 319
#####################################################################   SLPC 320
#                                                                  ##   SLPC 321
#        XSETFC                  SET FILL AREA COLOUR INDEX        ##   SLPC 322
#                                                                  ##   SLPC 323
#####################################################################   SLPC 324
SUBROUTINE XSETFC(I1)#                                                  SLPC 325
INTEGER I1#                                                             SLPC 326
include:(XCOMN)#                                                        SLPC 327
COLI=I1#                                                                SLPC 328
RETURN#                                                                 SLPC 329
END#                                                                    SLPC 330
#####################################################################   SLPC 331
#                                                                  ##   SLPC 332
#        XSETFS                  DEFINE FILL STYLE                 ##   SLPC 333
#                                                                  ##   SLPC 334
#####################################################################   SLPC 335
SUBROUTINE XSETFS(I1)#                                                  SLPC 336
INTEGER I1#                                                             SLPC 337
include:(XCOMN)#                                                        SLPC 338
RETURN#                                                                 SLPC 339
END#                                                                    SLPC 340
#####################################################################   SLPC 341
#                                                                  ##   SLPC 342
#        XSETLC                  SET POLYLINE COLOUR               ##   SLPC 343
#                                                                  ##   SLPC 344
#####################################################################   SLPC 345
SUBROUTINE XSETLC(I1)#                                                  SLPC 346
INTEGER I1#                                                             SLPC 347
include:(XCOMN)#                                                        SLPC 348
PLCOLI=I1#                                                              SLPC 349
RETURN#                                                                 SLPC 350
END#                                                                    SLPC 351
#####################################################################   SLPC 352
#                                                                  ##   SLPC 353
#        XSETLS                  DEFINE LINE STYLE                 ##   SLPC 354
#                                                                  ##   SLPC 355
#####################################################################   SLPC 356
SUBROUTINE XSETLS(I1)#                                                  SLPC 357
INTEGER I1#                                                             SLPC 358
include:(XCOMN)#                                                        SLPC 359
RETURN#                                                                 SLPC 360
END#                                                                    SLPC 361
#####################################################################   SLPC 362
#                                                                  ##   SLPC 363
#        XSETLW                  SET LINE WIDTH                    ##   SLPC 364
#                                                                  ##   SLPC 365
#####################################################################   SLPC 366
SUBROUTINE XSETLW(R1)#                                                  SLPC 367
REAL    R1#                                                             SLPC 368
include:(XCOMN)#                                                        SLPC 369
LWIDTH=R1#                                                              SLPC 370
RETURN#                                                                 SLPC 371
END#                                                                    SLPC 372
#####################################################################   SLPC 373
#                                                                  ##   SLPC 374
#        XSETMC                  SET POLYMARKER COLOUR             ##   SLPC 375
#                                                                  ##   SLPC 376
#####################################################################   SLPC 377
SUBROUTINE XSETMC(I1)#                                                  SLPC 378
INTEGER I1#                                                             SLPC 379
include:(XCOMN)#                                                        SLPC 380
PMCOLI=I1#                                                              SLPC 381
RETURN#                                                                 SLPC 382
END#                                                                    SLPC 383
#####################################################################   SLPC 384
#                                                                  ##   SLPC 385
#        XSETMS                  SET MARKER SIZE SCALE FACTOR      ##   SLPC 386
#                                                                  ##   SLPC 387
#####################################################################   SLPC 388
SUBROUTINE XSETMS(R1)#                                                  SLPC 389
REAL    R1#                                                             SLPC 390
include:(XCOMN)#                                                        SLPC 391
MSZSF=R1#                                                               SLPC 392
RETURN#                                                                 SLPC 393
END#                                                                    SLPC 394
#####################################################################   SLPC 395
#                                                                  ##   SLPC 396
#        XSMAKE                  CREATE SEGMENT                    ##   SLPC 397
#                                                                  ##   SLPC 398
#####################################################################   SLPC 399
SUBROUTINE XSMAKE(I1)#                                                  SLPC 400
INTEGER I1#                                                             SLPC 401
include:(XCOMN)#                                                        SLPC 402
SEGSTOP=SEGSTOP+segstep:#                                               SLPC 403
CURPTR=SEGSTOP-decr:(segstep:)#                                         SLPC 404
ZSEG(CURPTR)=I1#                                                        SLPC 405
ZSEG(CURPTR+1)=0#                                                       SLPC 406
ZSEG(CURPTR+2)=0#                                                       SLPC 407
ZSEG(CURPTR+3)=INTS(XWIND-1)#                                           SLPC 408
ZSEG(CURPTR+4)=0#                                                       SLPC 409
ZSEG(CURPTR+5)=INTS(YWIND-1)#                                           SLPC 410
ZSEG(CURPTR+6)=0#                                                       SLPC 411
RETURN#                                                                 SLPC 412
END#                                                                    SLPC 413
#####################################################################   SLPC 414
#                                                                  ##   SLPC 415
#        XSSETD                  CHANGE DETECTABILITY STATUS       ##   SLPC 416
#                                                                  ##   SLPC 417
#####################################################################   SLPC 418
SUBROUTINE XSSETD(I1,I2)#                                               SLPC 419
include:(XCOMN)#                                                        SLPC 420
INTEGER I1,I2,SEGPTR#                                                   SLPC 421
DO SEGPTR=1,SEGSTOP,segstep:#                                           SLPC 422
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  SLPC 423
IF(ZSEG(SEGPTR)==I1) BREAK#                                             SLPC 424
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  SLPC 425
IF(ZSEG(SEGPTR)!=I1) iquit:(AA9920)#                                    SLPC 426
ZSEG(SEGPTR+1)=I2#                                                      SLPC 427
RETURN#                                                                 SLPC 428
END#                                                                    SLPC 429
#####################################################################   SLPC 430
#                                                                  ##   SLPC 431
#        XSTART                  OPEN XWINDOWS                     ##   SLPC 432
#                                                                  ##   SLPC 433
#####################################################################   SLPC 434
SUBROUTINE XSTART(R1,R2,I1)#                                            SLPC 435
INTEGER I1#                                                             SLPC 436
INTEGER*2 LX,LY,HX,HY#                                                  SLPC 437
LOGICAL INSTAL#                                                         SLPC 438
REAL R1,R2#                                                             SLPC 439
include:(XCOMN)#                                                        SLPC 440
SEGSTOP=0#                                                              SLPC 441
CURPTR=0#                                                               SLPC 442
CHSIZE=1.0#                                                             SLPC 443
XWIND=640.0#                                                            SLPC 444
CALL SCREEN_TYPE@(STYPE)#                                               SLPC 445
IF(STYPE==2) $(CALL EGA@; YWIND=350.0$)#                                SLPC 446
ELSE IF(STYPE==3)#                                                      SLPC 447
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  SLPC 448
CALL VGA@#                                                              SLPC 449
YWIND=480.0#                                                            SLPC 450
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  SLPC 451
ELSE I1=0#                                                              SLPC 452
CALL MOUSE_SOFT_RESET@(INSTAL)#        Is mouse present?                SLPC 453
IF(!INSTAL) I1=-1#                                                      SLPC 454
LX=0#                                                                   SLPC 455
HX=INTS(XWIND)-1#                                                       SLPC 456
LY=0#                                                                   SLPC 457
HY=INTS(YWIND)-1#                                                       SLPC 458
CALL SET_MOUSE_BOUNDS@(LX,LY,HX,HY)#                                    SLPC 459
RETURN#                                                                 SLPC 460
END#                                                                    SLPC 461
#####################################################################   SLPC 462
#                                                                  ##   SLPC 463
#        XSTDC                   DEFINE STANDARD COLOURS           ##   SLPC 464
#                                                                  ##   SLPC 465
#####################################################################   SLPC 466
SUBROUTINE XSTDC#                                                       SLPC 467
include:(XCOMN)#                                                        SLPC 468
RETURN#                                                                 SLPC 469
END#                                                                    SLPC 470
####################################################################### SLPC 471
ifsel:(MSPC)## Microsoft PC f77                                         SLPC 472
systemheader:(MSPC  )#                                                  MSPC   1
#---------------------------------------------------------------------  MSPC   2
SUBROUTINE AA70(ETIM)#                 Used in getcpus:                 MSPC   3
INTEGER*2 IYR,IMON,IDAY#                                                MSPC   4
INTEGER*2 IHR,IMIN,ISEC,I100TH#                                         MSPC   5
INTEGER JUL,JULO,JYR,JMO,JDA,JHR,JMI#                                   MSPC   6
REAL ETIM,SECO,SEC#                                                     MSPC   7
intdata:(INI,0); SAVE INI,JULO,SECO; datastuff:#                        MSPC   8
IF(INI==0)#                                                             MSPC   9
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  MSPC  10
INI=1#                                 Reset flag                       MSPC  11
CALL GETDAT(IYR,IMON,IDAY)#            Get current date                 MSPC  12
JYR=IYR; JMO=IMON; JDA=IDAY#           Make natural integers            MSPC  13
CALL GETTIM(IHR,IMIN,ISEC,I100TH)#     Get system time                  MSPC  14
JHR=IHR; JMI=IMIN#                     Make natural integers            MSPC  15
SEC=FLOAT(ISEC)+FLOAT(I100TH)/100.000# Get seconds                      MSPC  16
CALL AA701(SECO,JULO,JMO,JDA,JYR,JHR,JMI,SEC)# Julian day & seconds     MSPC  17
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  MSPC  18
CALL GETDAT(IYR,IMON,IDAY)#            Get current date                 MSPC  19
JYR=IYR; JMO=IMON; JDA=IDAY#           Make natural integers            MSPC  20
CALL GETTIM(IHR,IMIN,ISEC,I100TH)#     Get system time                  MSPC  21
JHR=IHR; JMI=IMIN#                     Make natural integers            MSPC  22
SEC=FLOAT(ISEC)+FLOAT(I100TH)/100.000# Get seconds                      MSPC  23
CALL AA701(SEC,JUL,JMO,JDA,JYR,JHR,JMI,SEC)# Julian day & seconds       MSPC  24
ETIM=FLOAT(JUL-JULO)*86400.000+SEC-SECO# Elapsed time                   MSPC  25
RETURN#                                                                 MSPC  26
END#                                                                    MSPC  27
#---------------------------------------------------------------------  MSPC  28
SUBROUTINE AA701(SECS,JUL,MON,DAY,YEAR,HR,MIN,SE)# Julian day & secs    MSPC  29
REAL SECS,SE,SECONDS#                                                   MSPC  30
INTEGER JUL,MON,DAY,YEAR,HR,MIN,J#                                      MSPC  31
INTEGER M,D,Y,C,YA#                                                     MSPC  32
M=MON; D=DAY; Y=YEAR#                  Make local                       MSPC  33
SECONDS=FLOAT(HR)*3600.0+FLOAT(MIN)*60.0+SE# Set seconds                MSPC  34
IF(M>2) M=M-3#                                                          MSPC  35
ELSE#                                                                   MSPC  36
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1  MSPC  37
M=M+9; Y=Y-1#                                                           MSPC  38
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 1  MSPC  39
C=Y/100; YA=Y-(100*C)#                 Split year                       MSPC  40
J=(146097*C)/4+(1461*YA)/4+(153*M+2)/5+D+1721119# Julian day            MSPC  41
IF(SECONDS < 43200.0)#                                                  MSPC  42
$(#                                    0>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2  MSPC  43
J=J-1; SECONDS=SECONDS+43200.0#                                         MSPC  44
$)#                                    0<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2  MSPC  45
ELSE   SECONDS=SECONDS-43200.0#                                         MSPC  46
JUL=J; SECS=SECONDS#                   Set return values                MSPC  47
RETURN#                                                                 MSPC  48
END#                                                                    MSPC  49
#---------------------------------------------------------------------  MSPC  50
SUBROUTINE AA71(CLOCK)#                Used in gettime:                 MSPC  51
CHARACTER*8 CLOCK#                                                      MSPC  52
INTEGER*2 IHR,IMIN,ISEC,I100TH#                                         MSPC  53
CALL GETTIM(IHR,IMIN,ISEC,I100TH)#     Get system time                  MSPC  54
WRITE(CLOCK,'(I2,'':'',I2.2,'':'',I2.2)') IHR,IMIN,ISEC#                MSPC  55
RETURN#                                                                 MSPC  56
END#                                                                    MSPC  57
#---------------------------------------------------------------------  MSPC  58
SUBROUTINE AA72(DATUM)#                Used in getdate:                 MSPC  59
INTEGER J#                                                              MSPC  60
CHARACTER*8 DATUM#                                                      MSPC  61
INTEGER*2 IYR,IMON,IDAY#                                                MSPC  62
chardata:(MTHS,'JanFebMarAprMayJunJulAugSepOctNovDec')#                 MSPC  63
datastuff:#                                                             MSPC  64
CALL GETDAT(IYR,IMON,IDAY); J=3*IMON#  Get date in integer form         MSPC  65
WRITE(DATUM,'(I2,''-'',A3,I2.2)') IDAY,MTHS(J-2^J),IYR-1900#            MSPC  66
RETURN#                                                                 MSPC  67
END#                                                                    MSPC  68
#---------------------------------------------------------------------  MSPC  69
SUBROUTINE AA73(INT,REL,NST,NBT)#      Used in intpak:                  MSPC  70
INTEGER INT,REL,NST,NBT,I#                                              MSPC  71
IF(NBT==mxbtwd:) $(REL=INT; RETURN $)# Mainly for some strange f77's    MSPC  72
I=AND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get positive integer         MSPC  73
REL=XOR(REL,ISHFT(XOR(INT,I),NST))#    Pack slice into real             MSPC  74
RETURN#                                                                 MSPC  75
END#                                                                    MSPC  76
#---------------------------------------------------------------------- MSPC  77
SUBROUTINE AA74(REL,INT,NST,NBT)#      Used in intunpak:                MSPC  78
INTEGER INT,REL,NST,NBT#                                                MSPC  79
IF(NBT==mxbtwd:) $(INT=REL; RETURN $)# Mainly for some strange f77's    MSPC  80
INT=AND(NOT(ISHFT(-1,NBT)),ISHFT(REL,-NST))# Get positive integer       MSPC  81
RETURN#                                                                 MSPC  82
END#                                                                    MSPC  83
####################################################################### MSPC  84
endsel:#                                                                MSPC  85
pmacro:([no:])#                        Purge xtal system macros         MSPC  86
