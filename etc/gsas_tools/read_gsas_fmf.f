      program read_gsas_fmf

      integer    i
      integer    iufmf, rlfmf, iofmf
      character  fnfmf*60
      integer    iuasc
      character  fnasc*60

      character  phase*66, name*66, maptyp*4
      real       cell(7)
      integer    nxyzi(3), nxyzo(3), nxyzt(3), msect, nrho
      real       rmax, rmin, srho

      integer    isect
      integer    maxrho
      parameter (maxrho = 10000)
      real       rho(maxrho), romx, romn


      write(6, '(1x, a)')
     &  'Enter input file name of GSAS Fourier Map File:'
      read(5, '(a)', err = 21, end = 21) fnfmf
      write(6, '(1x, a)')
     &  'Enter record length of GSAS Fourier Map File:'
      read(5, *,     err = 22, end = 22) rlfmf
      write(6, '(1x, a)')
     &  'Enter output file name:'
      read(5, '(a)', err = 23, end = 23) fnasc
      goto 30

21    write(6, '(1x, a)')
     &  'Error reading GSAS FMF file name from unit 5'
      goto 9999
22    write(6, '(1x, a)')
     &  'Error reading GSAS FMF record length from unit 5'
      goto 9999
23    write(6, '(1x, a)')
     &  'Error reading output file name from unit 5'
      goto 9999

30    continue
      iufmf = 10
      iuasc = 11

      open (unit = iufmf, file = fnfmf,
     &      form = 'unformated', access = 'direct', recl = rlfmf,
     &      status = 'old', err = 31)

      open (unit = iuasc, file = fnasc,
     &      form = 'formated',
     &      status = 'unknown', err = 32)
      goto 50

31    write(6, '(1x, a)') 'Cannot open GSAS Fourier Map File'
      goto 9999
32    write(6, '(1x, a)') 'Cannot open output file'
      goto 9999

50    continue

      read(iufmf, rec = 1, iostat = iofmf, err = 190)
     &  phase, name, maptyp, (cell(i), i = 1, 7)

      write(11, '(1x, a)') phase
      write(11, '(1x, a)') name
      write(11, '(1x, a)') maptyp
      write(11, '(7(1x, f9.5))') (cell(i), i = 1, 7)

      read(iufmf, rec = 2, iostat = iofmf, err = 190)
     &  (nxyzi(i), i = 1, 3),
     &  (nxyzo(i), i = 1, 3),
     &  (nxyzt(i), i = 1, 3),
     &  msect, nrho, rmax, rmin, srho

      write(11, '(3(1x, i4))') (nxyzi(i), i = 1, 3)
      write(11, '(3(1x, i4))') (nxyzo(i), i = 1, 3)
      write(11, '(3(1x, i4))') (nxyzt(i), i = 1, 3)
      write(11, '(2(1x, i4))') msect, nrho
      write(11, '(3(1x, g10.4))') rmax, rmin, srho


      if      (msect .eq. 1) then
	write(11, '(1x, a)') 'order: 2 1 0  #  z y x  fast medium slow'
      else if (msect .eq. 2) then
	write(11, '(1x, a)') 'order: 2 0 1  #  z x y  fast medium slow'
      else if (msect .eq. 3) then
	write(11, '(1x, a)') 'order: 0 1 2  #  x y z  fast medium slow'
      else
	write(6, '(1x, a)') 'Error: Illegal msect'
	goto 9999
      endif

      if (nrho .gt. maxrho) then
	write(6, '(1x, a)')
     &    'Error: maxrho too small: recompile with bigger maxrho'
	goto 9999
      endif

      do 150 isect = 1, nxyzt(3)
	read(iufmf, rec = 2 + isect, iostat = iofmf, err = 190)
     &    (rho(i), i = 1, nrho), romx, romn

	do 140 i = 1, nrho
	  write(11, '(1x, g10.4)') rho(i)
140     continue

c       write(11, '(1x, a, g10.4, g10.4)') '> ', romx, romn
150   continue

      goto 9999

190   write(6, '(1x, a)') 'Error reading GSAS Fourier Map File'
      goto 9999


9999  continue

      end
