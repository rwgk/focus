CC      = cc
CCFLAGS = -O

all: gsas_raw gsas_fwhm read_phh read_refnnp

gsas_raw : gsas_raw.c
	$(CC) $(CCFLAGS) -o gsas_raw gsas_raw.c

gsas_fwhm : gsas_fwhm.c
	$(CC) $(CCFLAGS) -o gsas_fwhm gsas_fwhm.c -lm

read_phh : read_phh.f
	f77 -u -O -o read_phh read_phh.f

read_refnnp : read_refnnp.f
	f77 -u -O -o read_refnnp read_refnnp.f

clean :
	rm -f gsas_raw gsas_fwhm read_phh read_refnnp
