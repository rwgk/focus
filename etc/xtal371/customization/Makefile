# Linux
ARCH=LNX
FFLAGS=-static -O2

# Tru64 5.1
#ARCH=DEC
#FFLAGS=-static -nocpp -O2

# IRIX 6.5
#ARCH=SGI
#FFLAGS=-static -nocpp -O2 -woff 2290 -OPT:Olimit=0

F77=f77
LINK=f77
LDFLAGS=
LIBS=
RPP=rfpp.x
XTAL_EXEC=xtal.x

SHELL=/bin/sh
CP=/bin/cp
MV=/bin/mv
RM=/bin/rm -f

R_OBJECTS=\
aa.o\
ab.o\
ad.o\
ap.o\
ar.o\
at.o\
ax.o\
ay.o\
az.o\
bn.o\
bt.o\
bu.o\
by.o\
cb.o\
cf.o\
cg.o\
ci.o\
cl.o\
cn.o\
cp.o\
cr.o\
cu.o\
dd.o\
di.o\
fb.o\
fc.o\
fe.o\
fr.o\
fs.o\
ge.o\
gs.o\
gt.o\
lc.o\
lf.o\
ls.o\
mh.o\
ml.o\
mp.o\
nc.o\
nm.o\
or.o\
pb.o\
pe.o\
pn.o\
pp.o\
rb.o\
re.o\
rf.o\
rs.o\
rw.o\
sh.o\
si.o\
sl.o\
sp.o\
sr.o\
sx.o\
vu.o\
xt.o

F_OBJECTS=\
ciftbx.o\
hashfunc.o\
clearfp.o

OBJECTS=$(R_OBJECTS) $(F_OBJECTS)

.SUFFIXES:
.SUFFIXES: .o .r .f

.f.o:
	$(F77) $(FFLAGS) -c $<

.r.o:
	$(CP) $< RFPRAT; $(RPP) > /dev/null
	@$(MV) RFPFTN RFPFTN.f
	$(F77) $(FFLAGS) -c RFPFTN.f
	@$(MV) RFPFTN.o $@
	@$(RM) RFPRAT RFPFTN.f *COMN

$(XTAL_EXEC): $(OBJECTS)
	$(LINK) $(LDFLAGS) -o $@ $(OBJECTS) $(LIBS)
	$(CP) $(XTAL_EXEC) ../bin

$(R_OBJECTS): $(RPP) XMACRO

XMACRO: xmacro.r
	sed "s/^\(macro:(compiler:,UNX\).*$$/\1$(ARCH))#/" xmacro.r > XMACRO

$(RPP): rfpunx.f
	f77 -O -o $(RPP) rfpunx.f

clean:
	$(RM) XMACRO $(OBJECTS)
	$(RM) $(RPP) RFPRAT RFPLST RFPFTN RFPFTN.f RFPFTN.o *COMN
