      program conv_refnnx

      integer    i, irec
      integer    iurnx, rlrnx, iornx, linec
      character  buf*80, fnrnx*60, rwflag*1

      real*4       data(36)
      integer*4             idata(36)
      equivalence (data(1), idata(1))

      character  rwkey*12
      data       rwkey / '*A*S*C*I*I* '/


      irec = 0
      iurnx = 10
      rwflag = 'r'

      linec = 1
      read(5, '(a)', err = 90, end = 99) buf

          i = index(buf, rwkey)
      if (i .eq. 1 .or. i .eq. 2) then
        fnrnx = buf(i + len(rwkey): )
        rwflag = 'w'
      else
        fnrnx = buf
      endif

          i = index(fnrnx, '.REF')
      if (i .eq. 0) goto 91
      if (index('0123456789', fnrnx(i + 4: i + 4)) .eq. 0) goto 91
      if (index('0123456789', fnrnx(i + 5: i + 5)) .eq. 0) goto 91
          i =   index('PSFM', fnrnx(i + 6: i + 6))
      if (i .eq. 0) goto 91

      if (i .eq. 1) rlrnx = 18
      if (i .eq. 2) rlrnx = 36
      if (i .eq. 3) rlrnx = 21
      if (i .eq. 4) rlrnx = 22

      if (rwflag .eq. 'r') then
        open (unit = iurnx, file = fnrnx,
     &        form = 'unformatted', access = 'direct', recl = rlrnx,
     &        organization = 'relative',
     &        status = 'old',     err=92)

        write(6, '(1x, 2a)') rwkey, fnrnx
      else
        open (unit = iurnx, file = fnrnx,
     &        form = 'unformatted', access = 'direct', recl = rlrnx,
     &        organization = 'relative',
     &        status = 'unknown', err=92)
      endif

50    continue
        irec = irec + 1

        if (rwflag .eq. 'r') then

          read(iurnx, rec = irec, iostat = iornx, err = 99)
     &      (idata(i), i = 1, 5), (data(i), i = 6, rlrnx)
          if (iornx .ne. 0) goto 99

          write(6, '(4(1x, i3), 1x, i4)')
     &      (idata(i), i = 1, 5)

          do 60 i = 6, rlrnx
            write(6, '(1x, g13.7)') data(i)
60        continue

        else

          linec = linec + 1
          read(5, *, err = 91, end = 99)
     &      (idata(i), i = 1, 5)

          do 70 i = 6, rlrnx
            linec = linec + 1
            read(5, *, err = 91, end = 93) data(i)
70        continue

          write(iurnx, rec = irec, err = 94)
     &      (idata(i), i = 1, 5), (data(i), i = 6, rlrnx)

        endif

      goto 50


90    write(6, '(1x, a)')
     &  'Error reading GSAS REFnnP File Name from unit 5'
      goto 99

91    continue
      if (rwflag .eq. 'r') then
        write(6, '(1x, a)') 'File name error'
        write(6, '(1x, a)')
     &    'Possible extensions: .REFnnX: X = {P, S, F, M}'
      else
        write(6, '(1x, a, i6)')
     &    'Error reading ASCII File at line ', linec
      endif
      goto 99

92    write(6, '(1x, a)') 'Cannot open GSAS REFnnX File'
      goto 99

93    write(6, '(1x, a)') 'Incomplete ASCII File'
      goto 99

94    write(6, '(1x, a)') 'Error writing GSAS REFnnP File'
      goto 99

99    continue
      close(iurnx)

      end
