c
c Tool to convert EXPNAM.Phh files (histogram files)
c                   to ascii files
c
c usage: link or copy the EXPNAM.Phh file you want to convert
c        to "gsas.Phh", then type read_phh.
c        Redirection of the output is recommended.
c
c Caveat: Sometimes there are bogous records at the end
c         of the file. Delete them with your editor.
c
      program read_phh

      integer    iuphh, rlphh, iophh, irec

      integer*4    idata(128)
      real*4                 data(128)
      equivalence (idata(1), data(1))

      integer  i, j

      integer*4  ICODE, IOVLP
      real*4     T, YO, YC, YI, YB, YW, CW


      iuphh = 10
      rlphh = 128

      open (unit = iuphh, file = 'gsas.Phh',
     &      form = 'unformatted', access = 'direct', recl = rlphh,
     &      status = 'old', err=92)

      write(6, '(3a)')
     & '# ',
     & 'ICODE      T           YO           YC           YI',
     & '           YB           YW           CW             IOVLP'

      irec = 1

50    continue
        read(iuphh, rec = irec, iostat = iophh, err = 59)
     &    (idata(j), j = 1, 128)
	if (iophh .ne. 0) goto 59

	do 55 i = 1, 126, 9
          ICODE = idata(i + 0)
          T     =  data(i + 1)
          YO    =  data(i + 2)
          YC    =  data(i + 3)
          YI    =  data(i + 4)
          YB    =  data(i + 5)
          YW    =  data(i + 6)
          CW    =  data(i + 7)
          IOVLP = idata(i + 8)

          write(6, '(1x, i6, 1x, g12.6, 1x, g12.6,
     &               1x, g12.6, 1x, g12.6, 1x, g12.6,
     &               1x, g12.6, 1x, g12.6, 1x, i11)')
     &      ICODE, T, YO, YC, YI, YB, YW, CW, IOVLP

55      continue

        irec = irec + 1
	goto 50

59    close (iuphh)
      goto 99


92    write(6, '(1x, a)') 'Cannot open GSAS Phh File "gsas.Phh"'
      goto 99


99    continue
      end
