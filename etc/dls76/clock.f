c(XRS82:CLOCKIRX.F)
c
c ----------------------------------------------------------------------
c     If you need to make changes to this code to meet the
c     requirements of your compiler and/or operating-system:
c
c     PLEASE: send it in!
c
c     We will try to have a (more) compatible master copy.
c
c     "crgk"-comments = changes by Ralf Grosse Kunstleve,
c                       ETH Zurich, Jan/Feb 1993
c ----------------------------------------------------------------------


      subroutine xrsidate(month, day, year)
      integer month, day, year

      call idate(month, day, year)
      year = mod(year, 100)

      return
      end


      subroutine xrsdate(str)
      character*9 str

      integer month, day, year
      character MonName(12)*3
      data MonName / 'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
     &               'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC' /

      call xrsidate(month, day, year)

      write(str, '(i2.2, a1, a3, a1, i2.2)')
     &  day, '-', MonName(month), '-', year

      return
      end


      subroutine xrstime(str)
      character*8 str

      call time(str)

      return
      end
