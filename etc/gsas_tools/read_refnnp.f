c
c Tool to convert EXPNAM.REFnnP files (reflection files)
c                      to ascii files
c
c usage: link or copy the EXPNAM.REFnnP file you want to convert
c        to "gsas.REFnnP", then type read_refnnp.
c        Redirection of the output is recommended.
c
c        Besides converting gsas.REFnnP to an ascii file,
c        read_refnnp also writes a new direct access
c        file "gsas.REFnnP_new", with all of the data
c        items 9-13 (Fosq, esd_Fosq, FoTsq, Fcsq, FcTsq)
c        set to 1.
c        This is very useful for starting a LeBail extraction:
c          - Set up the experiment file as usual
c          - powpref
c          - 1 cycle genles
c          - copy EXPNAM.REFnnP to gsas.REFnnP
c          - read_refnnp
c          - copy gsas.REFnnP_new to EXPNAM.REFnnP
c          - continue with genles
c        This procedure is necessary after each use of
c        powpref.
c
c Caveat: Sometimes there are bogous records at the end
c         of the file. However, since gsas knows how many
c         records to read this should not hurt.
c
      program read_refnnp

      integer    i, irec
      integer    iurnp, iornp, rlrnp
      integer    iunew, ionew

      real       data(18)


      iurnp = 10
      iunew = 11
      rlrnp = 18

      open (unit = iurnp, file = 'gsas.REFnnP',
     &      form = 'unformatted', access = 'direct', recl = rlrnp,
     &      status = 'old', err=30)
      goto 35

30    write(6, '(1x, a)')
     &  'Cannot open GSAS REFnnP File "gsas.REFnnP"'
      goto 99

35    continue

      open (unit = iunew, file = 'gsas.REFnnP_new',
     &      form = 'unformatted', access = 'direct', recl = rlrnp,
     &      status = 'unknown', err=40)
      goto 45

40    write(6, '(1x, a)')
     &  'Cannot open GSAS REFnnP File "gsas.REFnnP_new"'
      goto 99

45    continue

      write(6, '(6a)')
     &  '#',
     &  '  H   K   L Mul Icod',
     &  '      Prfo  D-space   Lambda',
     &  '      Fosq  esd_Fosq',
     &  '     FoTsq      Fcsq     FcTsq  Phas',
     &  '     Trans      Extc    Proflp       TOF'

      irec = 0

50    continue
      irec = irec + 1

      read(iurnp, rec = irec, iostat = iornp, err = 90)
     &  (data(i), i = 1, rlrnp)

      if (iornp .eq. 0) then
        write(6, '(4(1x, i3), 1x, i4,
     &             1x, f9.4, 1x, f8.5, 1x, f8.5,
     &             1x, g9.4, 1x, g9.4,
     &             1x, g9.4, 1x, g9.4, 1x, g9.4, 1x, f5.1,
     &             1x, f9.4, 1x, f9.4, 1x, g9.4, 1x, g9.4)')
     &    (data(i), i = 1, rlrnp)

        data( 9) = 1.
        data(10) = 1.
        data(11) = 1.
        data(12) = 1.
        data(13) = 1.

        write(iunew, rec = irec, iostat = ionew, err = 95)
     &    (data(i), i = 1, rlrnp)

        goto 50
      endif

      goto 99


90    write(6, '(1x, a)')
     &  'Error reading GSAS REFnnP File "gsas.REFnnP"'
      goto 99

95    write(6, '(1x, a)')
     &  'Error writing GSAS REFnnP File "gsas.REFnnP_new"'

      close(iurnp)
      close(iunew)

99    continue
      end
