        PROGRAM fixrec80

        CHARACTER*80    INNAME,OUTNAME
        CHARACTER*80    buf

        DATA IUIN/10/,IUOUT/11/

        ACCEPT '(A)',INNAME
        OPEN (IUIN,FILE=INNAME,FORM='FORMATTED',ACCESS='SEQUENTIAL',
     &        STATUS='OLD',READONLY)

        ACCEPT '(A)',OUTNAME
        OPEN(IUOUT,FILE=OUTNAME,STATUS='UNKNOWN',ACCESS='SEQUENTIAL',
     &       RECL=80,RECORDTYPE='FIXED',FORM='FORMATTED')

10      continue
        read(IUIN, '(a)', err = 80, end = 90) buf
        write(IUOUT, '(a)') buf
        goto 10

80      continue
        write(6, '(1x, a, a)') 'Error reading input file ', INNAME

90      continue
        end
