###############################################################
#
# XTAL subprogram: PIG: Portable Interactive molecular Graphics
#
#       Copyright (C) 2000, The Xtal System, The University of
#             Western Australia, xtal@crystal.uwa.edu.au.
#  Distributed under the GNU General Public Licence as published by
#  the Free Software Foundation, in the hope that it will be useful
#  but WITHOUT ANY WARRANTY. See the GNU General Public License
#  for more details.
#
###############################################################
# This tcl script is sourced from the Xtal3.7 binary
# It DOES NOT RUN the Xtal PLOTX program stand-alone!
# This file should be located in the Xtal auxilliary file directory
# pointed to by the XTALHOME environment variable

proc MainWin {}  {
   wm withdraw .
   set w [toplevel .plotx]
   wm title   $w "Xtal: Tk interface to PLOTX"
   wm minsize $w 24 24
   wm aspect  $w 400 400 400 400 ; # between 1.0 and 1.0 :-)
   xtal $w.main  
   grid $w.main -row 0 -column 0 -sticky news
   grid rowconfigure $w 0 -weight 1
   grid columnconfigure $w 0 -weight 1
}

MainWin
