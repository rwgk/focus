###############################################################
#
# XTAL subprogram: PREABS: Pre absorption correction Crystal Shape
#
#       Copyright (C) 2000, The Xtal System, The University of
#             Western Australia, xtal@crystal.uwa.edu.au.
#  Distributed under the GNU General Public Licence as published by
#  the Free Software Foundation, in the hope that it will be useful
#  but WITHOUT ANY WARRANTY. See the GNU General Public License
#  for more details.
#
###############################################################

proc MainWin {}  {
   wm withdraw .
   set w [toplevel .preabs]
   wm title   $w "Xtal: Tk interface to PREABS"
   wm minsize $w 24 20
   wm aspect  $w 480 400 480 400 ; # between 1.2 and 1.2 :-)
   xtal $w.main ;   # defaults loaded from preferred resources files
   grid $w.main -row 0 -column 0 -sticky news
   grid rowconfigure $w 0 -weight 1
   grid columnconfigure $w 0 -weight 1
}

MainWin
