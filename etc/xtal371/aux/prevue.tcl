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

# Don't try and run this with tclsh or wish - it won't work at all.
# It is read from the XTAL program PREVUE when run in the standard
# manner. 


#  The 'Return Control To Xtal' bindings ...
#  Note that these bindings ARE NOT IMMEDIATE, in the sense that
#  control is not returned to RATMAC source immediately -  just
#  the next time control reverts back to the xtal tklib xgetsg_ eventloop.
#  (which should happen quite quickly for the most part)
#
#  The format here is: {XtalBinding window level segmentnumber }
#  where the three arguments provide the ratmac xgetsg_ code with
#  some measure of selective processing.
proc GotTheString      {} {XtalBinding .pig 1 1 }


proc MainWin {} {
   wm withdraw .
   set w [toplevel .prevue]
   wm title   $w "Xtal: Tk interface to PREVUE"
   wm minsize $w 24 24
   wm aspect  $w 400 400 400 400 ; # between 1.0 and 1.0 :-)
   xtal $w.main ;
   grid $w.main -row 0 -column 0 -sticky news
   grid rowconfigure $w 0 -weight 1
   grid columnconfigure $w 0 -weight 1
}


# configure for reading/entering new atom labels
set stringReq(DLabel) "Enter text then hit return."  
set stringReq(ALabel)  "" 
set stringReq(AString) "" 
set stringReq(Alength)  0
set stringReq(Alenmax)  8

proc RequestString { } {
   global stringReq

   set old [focus]
   set w [ toplevel .getstring -borderwidth 10 ]
   wm title  $w "String Required..."
   label  $w.title -text  " $stringReq(ALabel) "
   entry  $w.ep1   -relief sunken  -width " $stringReq(Alenmax)"\
                          -textvariable stringReq(AString)

   pack $w.title $w.ep1
   bind $w.ep1 <Return> StringFinished 

   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w.ep1           ;  # get mouse focus
   catch {grab $w.ep1 }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
# effectively modal, but reverting to the main eventloop for processing
# this permits any updates to take effect immediately
}

proc StringFinished { } {
   destroy .getstring
   GotTheString
}


MainWin
