###############################################################
#
# XTAL subprogram: POWGEN: Powder Pattern Generator
#
#       Copyright (C) 2000, The Xtal System, The University of
#             Western Australia, xtal@crystal.uwa.edu.au.
#  Distributed under the GNU General Public Licence as published by
#  the Free Software Foundation, in the hope that it will be useful
#  but WITHOUT ANY WARRANTY. See the GNU General Public License
#  for more details.
#
###############################################################

# The following procs are used for testing standalone in "wish"
# they should be overridden from within when running with tklib.
#
if [string match *wish* [info nameofexecutable] ] {
   proc XtalBinding {top level id } { }
   proc xtal {args } { eval { canvas } $args }
}


#  The 'Return Control To Xtal' bindings ...
#  Note that these bindings ARE NOT IMMEDIATE, in the sense that
#  control is not returned to RATMAC source immediately -  just
#  the next time control reverts back to the xtal tklib xgetsg_ eventloop.
#  (which should happen quite quickly for the most part)
#
#  The format here is: {XtalBinding window level segmentnumber }
#  where the three arguments provide the ratmac xgetsg_ code with
#  some measure of selective processing.
#
#     bindings to main page
proc NextGraphDown      {} {XtalBinding .powgen 0 1 }
proc NextGraphRight     {} {XtalBinding .powgen 0 2 }
proc NextGraphUp        {} {XtalBinding .powgen 0 3 }
proc NextGraphLeft      {} {XtalBinding .powgen 0 4 }
proc NextGraphSequ      {} {XtalBinding .powgen 0 5 }
proc NewGraphTitle      {} {XtalBinding .powgen 0 6 }
#     bindings to file pull down menu button
proc PagePreview        {} {XtalBinding .powgen 1 2 }
proc PageDumpPPP        {} {XtalBinding .powgen 1 3 }
proc PageSetupUpdate    {} {XtalBinding .powgen 1 4 }
proc BlockArrangeUpdate {} {XtalBinding .powgen 1 5 }
#     bindings to the edit menubar button
proc HklBarUpdate       {} {XtalBinding .powgen 2 3 }
#     bindings to the plot menubar button
proc PlotStyleUpdate    {} {XtalBinding .powgen 3 1 }  ;# not supported  yet
proc PlotRangeUpdate    {} {XtalBinding .powgen 3 2 } 
#     bindings to the Recalc menubar button
proc BackGroundUpdate   {} {XtalBinding .powgen 4 1 } 
proc PeakShapeUpdate    {} {XtalBinding .powgen 4 2 } 
proc PeakShapeRefresh   {} {XtalBinding .powgen 4 3 } 
proc ScaleFactorUpdate  {} {XtalBinding .powgen 4 4 } 
proc ScaleFactorRefresh {} {XtalBinding .powgen 4 5 } 
proc OverallDispUpdate  {} {XtalBinding .powgen 4 6 } 
proc OverallDispRefresh {} {XtalBinding .powgen 4 7 } 
proc ZeroOffsetUpdate   {} {XtalBinding .powgen 4 8 } ;# not supported yet
proc PrefOrientUpdate   {} {XtalBinding .powgen 4 9 } ;# not supported  yet
#     bindings to non-modal legend window
proc LegendWinUpdate    {} {XtalBinding .legendW 0 1 }
proc LegendWinDone      {} {XtalBinding .legendW 0 2 }
proc LegendWinApply     {} {XtalBinding .legendW 0 3 }
proc LegendWinCancel    {} {XtalBinding .legendW 0 4 }
#
#  Internal Global variables 
#
set horizmag  1.0 
set vertmag   1.0 
#

proc MainWin {}  {
   wm withdraw .
   set w [toplevel .powgen]
   wm title   $w "Xtal: Tk interface to POWGEN"
   wm minsize $w 24 16
   wm aspect  $w 33 20 35 20 ; # between 1.65 and 1.75

   #set up a frame for menubar
   frame $w.mb -relief raised -borderwidth 3
   menubutton $w.mb.button1 -text "File"    -relief flat -menu $w.mb.button1.m
   menubutton $w.mb.button2 -text "Edit"    -relief flat -menu $w.mb.button2.m
   menubutton $w.mb.button3 -text "Plot"    -relief flat -menu $w.mb.button3.m
   menubutton $w.mb.button4 -text "Recalc"  -relief flat -menu $w.mb.button4.m
   menubutton $w.mb.button5 -text "Help"    -relief flat -menu $w.mb.button5.m 
   
   menu $w.mb.button1.m
   menu $w.mb.button2.m
   menu $w.mb.button3.m
   menu $w.mb.button4.m
   menu $w.mb.button5.m

   $w.mb.button1.m add command -label "Page Setup"   -command { PageSetup }
   $w.mb.button1.m add command -label "Page Preview" -command { PagePreview }
   $w.mb.button1.m add command -label "Page Dump"    -command { PageDump }
   $w.mb.button1.m add command -label "Arrange Graphs" -command {ArrangeBlocks }
#   .mb.button1.m add command -label "New..." -command {NewFile}
#   .mb.button1.m add command -label "Load ..." -command {LoadFile}
#   .mb.button1.m add command -label "Append..." -command {AppendFile}
#   .mb.button1.m add command -label "Save" -command {SaveFile}
#   .mb.button1.m add command -label "Save As..." -command {SaveAsFile}
   $w.mb.button1.m add command -label "Quit"         -command { QuitWin }

   $w.mb.button2.m add command -label "Grid lines"      -command {  }
   $w.mb.button2.m add command -label "Axes attributes" -command {  }
   $w.mb.button2.m add command -label "hkl bars"        -command {Hklbars}

   
   $w.mb.button3.m add command -label "Plot Style"   -command { PlotStyle }
   $w.mb.button3.m add command -label "Plot Range"   -command { PlotRange }
 

   $w.mb.button4.m add command -label "Background"     -command { BackGround }
   $w.mb.button4.m add command -label "Peak shape"     -command { PeakShape }
   $w.mb.button4.m add command -label "Scale factors"  -command { ScaleFactor }
   $w.mb.button4.m add command -label "2Theta offsets" -command { ZeroOffset }
   $w.mb.button4.m add command -label "Temperature Factor" -command {OverallDisp}

#   .mb.button4.m add command -label "Preferred Orient" -command {  }
#   .mb.button4.m add command -label "Atom params"      -command {  }
#   .mb.button4.m add command -label "Add pattern?"     -command {  }


   $w.mb.button5.m add command -label "Help Me!"         -command {ExHelp }


   #Now pack everything together
   pack $w.mb.button1 $w.mb.button2 $w.mb.button3 $w.mb.button4 -side left -padx 4
   pack $w.mb.button5  -side right -padx 4


   xtal $w.legend 
   xtal $w.graph -yscrollcommand [list $w.vscroll set ] \
                 -xscrollcommand [list $w.hscroll set ] 
   xtal $w.abscissa  
   xtal $w.ordinate 

   scrollbar $w.vscroll -command [list $w.graph yview]

   scrollbar $w.hscroll -command [list $w.graph xview]

   button  $w.xsmall -text "narrow"  -padx 40 \
           -command [list  horizResize +1 ] 
   button  $w.xlarge -text "wide"  -padx 41 \
           -command [list  horizResize -1 ] 
   button  $w.ysmall -text "\n\nv\n\n\n^\n\n" \
           -command [list  vertResize +1 ] 
   button  $w.ylarge -text "\n\n^\n\n\nv\n\n" \
           -command [list  vertResize -1 ] 

   button  $w.ndown  -text "v" -command NextGraphDown
   button  $w.nright -text ">" -command NextGraphRight
   button  $w.nup    -text "^" -command NextGraphUp
   button  $w.nleft  -text "<" -command NextGraphLeft
   button  $w.nsequ  -text "+" -command NextGraphSequ

   frame $w.an
   label $w.an.1 -text  Graph: -padx 0
   entry $w.an.number -width 2 -relief sunken -state disabled  \
         -textvariable GraphNumber
   label $w.an.2 -text  Title: -padx 0
   entry $w.an.title -width 40 -relief sunken \
         -textvariable GraphTitle 
   bind $w.an.title <Return> NewGraphTitle 

   button $w.legtitle -text Traces -padx 0 -command { LegendWin }

   pack $w.an.1 $w.an.number $w.an.2 -side  left
   pack $w.an.title  -side  left -fill x -expand true


   grid $w.mb  -row 0 -column 0 -rowspan 1 -columnspan 8  -sticky news
   grid $w.an  -row 1 -column 0 -rowspan 1 -columnspan 7 -pady 5 -sticky news

   grid $w.legtitle -row 1 -column 7 -rowspan 1 -columnspan 1 -sticky news
   grid $w.legend   -row 2 -column 7 -rowspan 6 -sticky news
   grid $w.graph    -row 2 -column 3 -rowspan 3 -columnspan 3 -sticky news

   grid $w.ordinate -row 2 -column 2 -rowspan 3 -columnspan 1 -sticky news
   grid $w.vscroll  -row 2 -column 1 -rowspan 3 -columnspan 1 -sticky news
   grid $w.ylarge   -row 2 -column 0 -rowspan 1 -columnspan 1 -sticky news
   grid $w.ysmall   -row 4 -column 0 -rowspan 1 -columnspan 1 -sticky news

   grid $w.abscissa  -row 5 -column 3 -rowspan 1 -columnspan 3 -sticky news
   grid $w.hscroll  -row 6 -column 3 -rowspan 1 -columnspan 3 -sticky news
   grid $w.xsmall   -row 7 -column 3 -rowspan 1 -columnspan 1 -sticky news
   grid $w.xlarge   -row 7 -column 5 -rowspan 1 -columnspan 1 -sticky news

   grid $w.nup     -row 5 -column 1 -rowspan 1 -columnspan 1 -sticky news
   grid $w.nleft   -row 6 -column 0 -rowspan 1 -columnspan 1 -sticky news
   grid $w.nsequ   -row 6 -column 1 -rowspan 1 -columnspan 1 -sticky news
   grid $w.nright  -row 6 -column 2 -rowspan 1 -columnspan 1 -sticky news
   grid $w.ndown   -row 7 -column 1 -rowspan 1 -columnspan 1 -sticky news

   grid rowconfigure $w 3 -weight  1
   grid columnconfigure $w 4 -weight  1

   # trap window destruction from the window manager
   wm protocol $w WM_DELETE_WINDOW {QuitWin}
}

proc QuitWin {} {
   set w [ toplevel .quit -borderwidth 10 ]

   label $w.quest -bitmap questhead -padx 2 ;  #use built in question head icon
   label $w.lab -text  "OK to quit?"  -padx 0
   frame $w.ok -borderwidth 2 -relief sunken

# No need to set a binding on this because the destruction of 
# all canvases by virtue of destruction of . ensures the 
# C API xtalSegment flag is set to -1  (signalling termination)
   button $w.ok.b -text OK  -command "destroy $w ; destroy . "
   pack $w.ok.b
   button $w.cancel -text cancel \
        -command "  destroy $w "
   pack $w.quest $w.lab -side top
   pack $w.ok $w.cancel -side left -padx 5 -pady 5
   
   focus $w         ;  # get mouse focus
   grab $w          ;  # grab the keyboard also
   tkwait window $w ;  # wait for window to be destroyed
   # destruction of this window should release the grab
}

#############################################################
#
#  General utility functions
#  -------------------------
#
#############################################################

proc BuildPop {button pop range  varname } {
   upvar #0 $varname  var
   menu $pop  -tearoff false
   set row 0
   foreach ptype $range {
        $pop add radio -hidemargin false -variable $varname \
            -label $ptype -value $row
        incr row
   }

   bind $button <ButtonPress-1> "ExGenPopup $button $pop \$$varname "
   # Reorder bindtags so Menu bindings fire first 
   # this ensures that the radio variable is updated before calling 
   # ExGenPopup
   bindtags $pop [list Menu $pop all ]
}

proc ExGenPopup { buttn  pop  val } {
   set w2   [winfo reqwidth  $pop ] 
   set h2   [winfo reqheight $pop ]
   set kids  [$pop index last ]
   set xr   [ winfo rootx $buttn ]
   set yr   [ winfo rooty $buttn ]
   set xn   [expr round ($xr + 0.5 * $w2) ] 
   set yn   [expr $yr + round ($h2 / ( $kids + 1 )/ 2.) ]
   catch { wm deiconify $pop } ;# if it does(nt) exist already
   tk_popup $pop  $xn $yn  [expr int( $val) ]
}


set randomSeed [pid]
proc ExHelp {  } {
   global randomSeed
   set randomSeed [expr ($randomSeed*9301 +49297) % 233280]
   set num [expr int(($randomSeed/double(233280)) * 3) ]

   set text0 "You got this far.\n You must know what you're doing!"
   set text1 "Its obvious really"
   set text2 "Ask Brian."
   set text3 "You're asking me?"
   set text4 "Do I Look like I care?"
   set text [list $text0 $text1 $text2 $text3 $text4]

   set w [ toplevel .help  -borderwidth 10 ]
   label $w.lab -text [lindex $text $num] -padx 0
   frame $w.ok -borderwidth 2 -relief sunken
   button $w.ok.b -text OK -command "destroy $w "
   pack $w.ok.b
   pack $w.lab $w.ok -padx 5 -pady 5 -side top
   awaitDestruction $w
}

proc awaitDestruction {w } {
   set old [focus]
   catch {tkwait visibility $w };  # wait for window to be destroyed
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
   tkwait window $w ;  # wait for window to be destroyed
   # destruction of this window should release the grab
   focus $old
}

###################################################################
# the user can expand or contract the graph horizontally
# by invoking this function
proc horizResize {fac } { 
   global horizmag
   global vertmag

   set horizmag  [expr $horizmag * pow(0.9,$fac) ]
   if {$horizmag <1.0 } {set horizmag  1.0 }
   set frac [ .powgen.graph xview ]
   set cent [expr ([lindex $frac 0 ] + [lindex $frac 1 ]) /2. ]

   set wid  [ .powgen.graph cget -width ]
   set hit  [ .powgen.graph cget -height ]
   set nwid [ expr $horizmag * $wid ]
   set nhit [ expr $vertmag  * $hit ] 
   set region  [list 0 0 $nwid $nhit ]

   .powgen.graph configure -scrollregion $region
   .powgen.graph xview moveto [expr $cent - $wid/$nwid/2. ]
}

# the user can expand or contract the graph vertically
# by invoking this function
proc vertResize {fac } { 
   global horizmag
   global vertmag

   set vertmag   [expr $vertmag * pow(0.9,$fac) ]
   if {$vertmag < 1.0 } {set vertmag  1.0 }
   set frac [ .powgen.graph yview ]
   set cent [expr ([lindex $frac 0 ] + [lindex $frac 1 ]) /2. ]

   set wid  [ .powgen.graph cget -width ]
   set hit  [ .powgen.graph cget -height ]
   set nwid [ expr $horizmag * $wid ]
   set nhit [ expr $vertmag  * $hit ] 
   set region  [list 0 0 $nwid $nhit ]

   .powgen.graph configure -scrollregion $region
   .powgen.graph yview moveto [expr $cent - $hit/$nhit/2. ]
}



# template settings
set applyToPhase(Phase)     [list Current "All Phases"]
#  dummy Text entry variables
# default settings
set applyToPhase(DPhase)         0 ; # current
# Actual settings
set applyToPhase(APhase)         $applyToPhase(DPhase)
# currrent settings
set applyToPhase(CPhase)         $applyToPhase(APhase)

proc ApplyToPhaseConfig {w mode} {
   global applyToPhase

   switch -exact -- $mode {
      init {
          set applyToPhase(CPhase)    $applyToPhase(APhase)
      }
      graph {
      }
      default {
      }
   }

   #  set the current button mode
   set mode       [expr int($applyToPhase(CPhase)) ]
   $w.tapplyto configure -relief raised \
              -text [lindex $applyToPhase(Phase)  $mode]
}



#############################################################
#
#  The rest of this file just builds a whole series of menus 
#  creates their associated global variables with default values
#  and registers extra callback routines to invoke menu changes.
#  -------------------------
#
#############################################################


set graphicAttributes(lineStyles) [list none solid dashed dotted "dash dot" "dash 3dot" ]
set graphicAttributes(lineThickness) [list 0  1 2 3 4 5 6 7 8 9 10 ]
set graphicAttributes(markStyles) [list none "hollow circle" ]



set legendSettings(Tphase) 0 
set legendSettings(Traces) [list ] ; # an empty list 

#  set default values
set legendSettings(DtInvoke)   1;   # is trace/curve invoked ? yes
set legendSettings(DlStyle)    1;   # solid
set legendSettings(DlThick)    0;   # 0 thickness is fastest rendering
set legendSettings(DlMark)     0;   # there aren't any - yet ...
set legendSettings(Dcolor)     1;   # Red , hopefully ...
set legendSettings(Dactive)    0;   # Y Obs,sig, back,Ycal,delta,ycal1 ...
set legendSettings(DxOffset)    0;   # Y Obs,sig, back,Ycal,delta,ycal1 ...
set legendSettings(DyOffset)    0;   # Y Obs,sig, back,Ycal,delta,ycal1 ...

#  set actual values
set legendSettings(AtInvoke)   $legendSettings(DtInvoke)
set legendSettings(AlStyle)    $legendSettings(DlStyle)
set legendSettings(AlThick)    $legendSettings(DlThick)
set legendSettings(AlMark)     $legendSettings(DlMark)
set legendSettings(Acolor)     $legendSettings(Dcolor)
set legendSettings(Aactive)    $legendSettings(Dactive)    
set legendSettings(AxOffset)   $legendSettings(DxOffset)    
set legendSettings(AyOffset)   $legendSettings(DyOffset)    

#  set current values
set legendSettings(CtInvoke)   $legendSettings(AtInvoke)
set legendSettings(ClStyle)    $legendSettings(AlStyle)
set legendSettings(ClThick)    $legendSettings(AlThick)
set legendSettings(ClMark)     $legendSettings(AlMark)
set legendSettings(Ccolor)     $legendSettings(Acolor)
set legendSettings(Cactive)    $legendSettings(Aactive)    
set legendSettings(CxOffset)   $legendSettings(AxOffset)    
set legendSettings(CyOffset)   $legendSettings(AyOffset)    


proc LegendWin { } {
   global applyTo
   global legendSettings
   global graphicAttributes

   if { [winfo exists .legendW] } {
        set w .legendW
        if  [ winfo ismapped $w ] {
            wm withdraw  $w
        } else { 
            ApplyToGraphConfig $w init ;
            LegendWinUpdate;  # fortran callback
            LegendConfig       $w init ;
            wm deiconify $w
        }
   } else {
      set w [ toplevel .legendW -borderwidth 10 ]
      wm title  $w "Legend"

     set a [frame $w.fa]
     set b [frame $w.fb  -highlightthickness 1 -highlightbackground Red ]
     set c [frame $w.fc  -highlightthickness 1 -highlightbackground Red ]
     set d [frame $w.fd  -highlightthickness 1 -highlightbackground Red ]
     set e [ frame $w.fe  -highlightthickness 1 -highlightbackground Red ]
     grid $a $b $c  -sticky n
     grid $d -  x   -sticky w
     grid $e -  x   -sticky w

     listbox $w.phlist  \
             -xscrollcommand [list $w.xscroll set ] \
             -yscrollcommand [list $w.yscroll set ] 
     scrollbar $w.xscroll -orient horizontal \
              -command [list $w.phlist xview ]
     scrollbar $w.yscroll -orient vertical \
              -command [list $w.phlist yview ]

     entry  $w.phase -text "phase"  -width 8 -relief sunken \
              -textvariable legendSettings(Tphase)


     grid $w.phase     -         -in $a -sticky news
     grid $w.phlist  $w.yscroll  -in $a -sticky news
     grid $w.xscroll     x       -in $a -sticky news
            

     checkbutton $w.invoked -text "Invoke Trace" \
                            -variable legendSettings(CtInvoke)
     label  $w.lstylab   -text "Line Style" 
     button $w.lstyle    -relief raised -pady 0 -underline 0 
     label  $w.lthicklab -text "Line Thickness" 
     button $w.lthick    -relief raised -pady 0 -underline 0 
     label  $w.lmarklab  -text "Markers " 
     button $w.lmark     -relief raised -pady 0 -underline 0 
     label  $w.loffset   -text "Y Offset %graph " 
#     label  $w.lyoff     -text "%graph" 
     entry  $w.entyoff   -width 8 -relief sunken \
                         -textvariable legendSettings(TyOffset)
#     entry  $w.entxoff   
#     label  $w.lxoff     -text "deg " 


     grid $w.invoked    -in $b -sticky news
     grid $w.lstylab    -in $b -sticky news
     grid $w.lstyle     -in $b -sticky news
     grid $w.lthicklab  -in $b -sticky news
     grid $w.lthick     -in $b -sticky news
     grid $w.lmarklab   -in $b -sticky news
     grid $w.lmark      -in $b -sticky news
     grid $w.loffset    -in $b -sticky news
#     grid $w.lyoff      -in $b -sticky news
     grid $w.entyoff    -in $b -sticky news


     label  $w.collab -text "Trace colour" 
     canvas $w.colors -width 180 -height 200
     canvas $w.colsel -width 80 -height 20

     grid $w.collab    -in $c -sticky news
     grid $w.colors    -in $c -sticky news
     grid $w.colsel  -row 1 -column 2 -in $w -sticky n


     label  $w.gnumlab  -text "Current Graph\#"
     entry  $w.gnum     -width 2 -relief sunken \
                         -textvariable applyTo(Tgnum)
     label  $w.gxplab   -text "X Position"
     entry  $w.gxnum     -width 2 -relief sunken \
                         -textvariable applyTo(Tgxpos)
     label  $w.gyplab   -text "Y Position"
     entry  $w.gynum     -width 2 -relief sunken \
                         -textvariable applyTo(Tgypos)
     label  $w.tapply   -text "Apply To:"
     button $w.tapplyto  -relief raised -pady 0 -underline 0 

     grid  $w.gnumlab  $w.gnum  $w.gxplab  $w.gxnum  -in $d -sticky w
     grid      x         x      $w.gyplab  $w.gynum  -in $d -sticky w
     grid  $w.tapply   $w.tapplyto    -in $d   -sticky w



     button $w.done    -text Done  \
           -command "wm withdraw  $w"
     button $w.apply   -text Apply   \
           -command "LegendConfig $w commit ; \
                     ApplyToGraphConfig $w commit ;\
                     LegendWinApply "
     button $w.default -text Default  \
           -command "LegendConfig $w default "
     button $w.cancel  -text Cancel  \
           -command "wm withdraw  $w"


     grid  $w.done $w.apply $w.default $w.cancel -in $e -sticky s


      BuildPop $w.lstyle  $w.pop1  $graphicAttributes(lineStyles) \
                            legendSettings(ClStyle)
      bind $w.pop1 <ButtonRelease-1> "LegendConfig $w style "

      BuildPop $w.lthick  $w.pop2  $graphicAttributes(lineThickness) \
                            legendSettings(ClThick)
      bind $w.pop2 <ButtonRelease-1> "LegendConfig $w thickness "

      BuildPop $w.lmark  $w.pop3  $graphicAttributes(markStyles) \
                            legendSettings(ClMark)
      bind $w.pop3 <ButtonRelease-1> "LegendConfig $w mark "

      BuildPop $w.tapplyto  $w.pop4  $applyTo(Graph)  applyTo(CGraph)
      bind $w.pop4 <ButtonRelease-1> "ApplyToGraphConfig $w update "


      bind $w.phase <Return> "LegendConfig $w relabel"


      bind $w.phlist <ButtonRelease-1> \
        "set legendSettings(Aactive) \[lindex \[ $w.phlist curselection\] 0 \];\
          LegendWinUpdate "
      bindtags $w.phlist [list Listbox $w.phlist all ]

      set wid [ expr [ $w.colors cget -width] / 8]
      set hit [ expr [ $w.colors cget -height] / 9]
      set h1 2 
      set idx -1 
      for {set i 0} {$i<9} {incr i} {
         set w1 2 
         for {set j 0} {$j < 8} {incr j} {
            incr idx 1
            set col [ GetXtalColorIndex $idx ] 
            $w.colors create rect $w1 $h1 \
                  [expr $w1+$wid ] [expr $h1+$hit ] \
                  -fill  $col -outline black -tag "a$idx" 
            $w.colors bind "a$idx"  <ButtonRelease-1> \
              "set legendSettings(Ccolor) $idx ; LegendConfig $w colour"
            incr w1 $wid
         }
         if {$idx <20} {set idx 20}
         incr h1 $hit
      }

      # non-immediate fortran update
      LegendWinUpdate;  # set flag to let fortran know its invoked
      LegendConfig       $w init ;
      ApplyToGraphConfig $w init ;
   }

}

proc LegendConfig {w mode} {
   global legendSettings
   global graphicAttributes
   global applyTo

   switch -exact -- $mode {
      init {
         set legendSettings(CtInvoke)   $legendSettings(AtInvoke)
         set legendSettings(ClStyle)    $legendSettings(AlStyle)
         set legendSettings(ClThick)    $legendSettings(AlThick)
         set legendSettings(ClMark)     $legendSettings(AlMark)
         set legendSettings(Ccolor)     $legendSettings(Acolor)
         set legendSettings(Cactive)    $legendSettings(Aactive)    
         set legendSettings(CxOffset)   $legendSettings(AxOffset)    
         set legendSettings(CyOffset)   $legendSettings(AyOffset)    

         $w.phlist delete 0 end ;       # delete originals
         eval { $w.phlist insert end } $legendSettings(Traces)
      }
      commit {
   
     set legendSettings(CyOffset) [format "%e" [expr $legendSettings(TyOffset)]]

         set legendSettings(AtInvoke)   $legendSettings(CtInvoke)
         set legendSettings(AlStyle)    $legendSettings(ClStyle)
         set legendSettings(AlThick)    $legendSettings(ClThick)
         set legendSettings(AlMark)     $legendSettings(ClMark)
         set legendSettings(Acolor)     $legendSettings(Ccolor)
         set legendSettings(Aactive)    $legendSettings(Cactive)    
         set legendSettings(AxOffset)   $legendSettings(CxOffset)    
         set legendSettings(AyOffset)   $legendSettings(CyOffset)    
         set  legendSettings(Traces)  [
             lreplace $legendSettings(Traces) $legendSettings(Aactive) \
                 $legendSettings(Aactive)  $legendSettings(Tphase) ]
         $w.phlist delete $legendSettings(Aactive) 
         $w.phlist insert $legendSettings(Aactive) $legendSettings(Tphase) 
      }
      default {
         set legendSettings(CtInvoke)   $legendSettings(DtInvoke)
         set legendSettings(ClStyle)    $legendSettings(DlStyle)
         set legendSettings(ClThick)    $legendSettings(DlThick)
         set legendSettings(ClMark)     $legendSettings(DlMark)
         set legendSettings(Ccolor)     $legendSettings(Dcolor)
         set legendSettings(Cactive)    $legendSettings(Dactive)    
         set legendSettings(CxOffset)   $legendSettings(DxOffset)    
         set legendSettings(CyOffset)   $legendSettings(DyOffset)    
      }
      fortran {
         # RATMAC code makes a call to LegendConfig $w init
         set legendSettings(CtInvoke)   $legendSettings(AtInvoke)
         set legendSettings(ClStyle)    $legendSettings(AlStyle)
         set legendSettings(ClThick)    $legendSettings(AlThick)
         set legendSettings(ClMark)     $legendSettings(AlMark)
         set legendSettings(Ccolor)     $legendSettings(Acolor)
         set legendSettings(Cactive)    $legendSettings(Aactive)    
         set legendSettings(CxOffset)   $legendSettings(AxOffset)    
         set legendSettings(CyOffset)   $legendSettings(AyOffset)    
         if {! [winfo exists $w.phlist] } { return }  
      }
      relabel {

      }
      colour {

      }
      style {

      }
      thickness {

      }
      mark {

      }

   }

   $w.lstyle  configure -relief raised \
       -text [ lindex $graphicAttributes(lineStyles) $legendSettings(ClStyle) ]
   $w.lthick  configure -relief raised \
       -text [ lindex $graphicAttributes(lineThickness) \
                  [expr int($legendSettings(ClThick)) ]  ]
   $w.lmark  configure -relief raised \
       -text [ lindex $graphicAttributes(markStyles) $legendSettings(ClMark)  ]

   set  legendSettings(Tphase) \
       [lindex $legendSettings(Traces) $legendSettings(Cactive)]

   set legendSettings(TyOffset) [format "%.4f" [expr $legendSettings(CyOffset)]]

   set  col [ GetXtalColorIndex $legendSettings(Ccolor) ] 
   $w.colsel delete all
   $w.colsel create rect 0 0  [ $w.colors cget -width] [$w.colors cget -height]\
           -fill $col -outline black -tag 1
}






# template settings
set pageSettings(Types)    [list A3 A4 A5 "US Letter" "US Legal" "US executive" arbitrary]    
set pageSettings(Widths)   [list 11.69 8.27 5.83 8.5 8.5 7.25 ]
set pageSettings(Heights)  [list 16.54 11.69 8.27 11.0 14.0 10.5 ]
set pageSettings(Orient)   [list landscape portrait ]
set pageSettings(Units)    [list inch pt cm mm]
set pageSettings(Scales)   [list 1.0 72.0 2.541 25.41]
#
# Default settings (all in inches)
set pageSettings(Dtype)         1 ; #A4
set pageSettings(Dorientation)  0 ; #landscape
set pageSettings(Dunits)        0 ; #inches
set pageSettings(Dscale)   [lindex $pageSettings(Scales) $pageSettings(Dunits)]
set pageSettings(Dleft)         0.5;# inches
set pageSettings(Dright)        0.5
set pageSettings(Dtop)          0.5
set pageSettings(Dbottom)       0.5
set pageSettings(Dheight)  [lindex $pageSettings(Heights) $pageSettings(Dtype) ]
set pageSettings(Dwidth)   [lindex $pageSettings(Widths)  $pageSettings(Dtype) ]
# dummy text/string  variables
set pageSettings(Twidth)     0    
set pageSettings(Theight)     0    
set pageSettings(Tleft)     0    
set pageSettings(Tright)    0    
set pageSettings(Ttop)      0    
set pageSettings(Tbottom)   0    
#
# Applied settings (all in inches )
# initialize actual (existing) settings
set pageSettings(Atype)         $pageSettings(Dtype)
set pageSettings(Aorientation)  $pageSettings(Dorientation)
set pageSettings(Aunits)        $pageSettings(Dunits)
set pageSettings(Ascale)        $pageSettings(Dscale)
set pageSettings(Aleft)         $pageSettings(Dleft)
set pageSettings(Aright)        $pageSettings(Dright)
set pageSettings(Atop)          $pageSettings(Dtop)
set pageSettings(Abottom)       $pageSettings(Dbottom)
set pageSettings(Aheight)       $pageSettings(Dheight)
set pageSettings(Awidth)        $pageSettings(Dwidth)
#
set pageSettings(Ctype)         $pageSettings(Atype)
set pageSettings(Corientation)  $pageSettings(Aorientation)
set pageSettings(Cunits)        $pageSettings(Aunits)
set pageSettings(Cscale)        $pageSettings(Ascale)
set pageSettings(Cleft)         $pageSettings(Aleft)
set pageSettings(Cright)        $pageSettings(Aright)
set pageSettings(Ctop)          $pageSettings(Atop)
set pageSettings(Cbottom)       $pageSettings(Abottom)
set pageSettings(Cheight)       $pageSettings(Aheight)
set pageSettings(Cwidth)        $pageSettings(Awidth)

set updateFlag 0
proc PageSetup {} {
   global pageSettings
   global updateFlag
   set updateFlag 0

   if { [winfo exists .pagesetup ] } {
      set w .pagesetup
      PageConfig $w init  ;# copy Actual (A) back to current (C) 
   } else {
      set w [ toplevel .pagesetup -borderwidth 10 ]
      wm title  $w "Page Setup"
   
      label  $w.typelab   -text "Page Type"   
      button $w.pagetype  -relief raised -pady 0 -underline 0 


      label  $w.orientlab -text "Orientation" 
      button $w.oriented  -relief raised  -pady 0 -underline 0 
      label  $w.widthlab  -text "Width" ;  
      entry  $w.went      -width 8 -relief sunken \
                          -textvariable pageSettings(Twidth)
      label  $w.heightlab -text "Height" ;  
      label  $w.unitslab  -text "Page Units"   
      button $w.units     -relief raised -pady 0 -underline 0 
      entry  $w.hent      -width 8 -relief sunken \
                          -textvariable pageSettings(Theight)


      label  $w.margins   -text "Margins" -pady 2 
      label  $w.leftlab   -text "Left"   
      entry  $w.lent      -width 8 -relief sunken \
                          -textvariable pageSettings(Tleft)
      label  $w.toplab    -text "Top"   
      entry  $w.tent      -width 8 -relief sunken \
                          -textvariable pageSettings(Ttop)
      label  $w.rightlab  -text "Right" 
      entry  $w.rent      -width 8 -relief sunken \
                          -textvariable pageSettings(Tright)
      label  $w.bottomlab -text "Bottom"   
      entry  $w.bent      -width 8 -relief sunken \
                          -textvariable pageSettings(Tbottom)

      frame  $w.f1 
      button $w.f1.done    -text Done    -pady 2  \
                           -command "destroy $w"
      button $w.f1.apply   -text Apply   -pady 2 \
                           -command "set updateFlag 1 ; PageConfig $w commit"
      button $w.f1.default -text Default -pady 2 \
                           -command "PageConfig $w default"
      button $w.f1.cancel  -text Cancel  -pady 2  \
                           -command "set updateFlag 0 ; destroy $w "
      pack $w.f1.done $w.f1.apply $w.f1.default $w.f1.cancel -side left 
   
      grid   $w.typelab   -row 0 -column 0 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.pagetype  -row 0 -column 1 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.orientlab -row 1 -column 0 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.oriented  -row 1 -column 1 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.widthlab  -row 1 -column 2 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.went      -row 1 -column 3 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.unitslab  -row 2 -column 0 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.units     -row 2 -column 1 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.heightlab -row 2 -column 2 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.hent      -row 2 -column 3 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.margins   -row 3 -column 1 -rowspan 1 -columnspan 2 
      grid   $w.leftlab   -row 4 -column 0 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.lent      -row 4 -column 1 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.toplab    -row 4 -column 2 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.tent      -row 4 -column 3 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.rightlab  -row 5 -column 0 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.rent      -row 5 -column 1 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.bottomlab -row 5 -column 2 -rowspan 1 -columnspan 1 -sticky w
      grid   $w.bent      -row 5 -column 3 -rowspan 1 -columnspan 1 -sticky w
   
      grid   $w.f1        -row 6 -column 0 -rowspan 1 -columnspan 4 -sticky s
   

      BuildPop $w.pagetype  $w.pop1  $pageSettings(Types)  pageSettings(Ctype) 
      bind $w.pop1 <ButtonRelease-1> "PageConfig $w type "

      BuildPop $w.oriented  $w.pop2  $pageSettings(Orient) \
                                    pageSettings(Corientation) 
      bind $w.pop2 <ButtonRelease-1> "PageConfig $w orientation "

      BuildPop $w.units  $w.pop3  $pageSettings(Units) pageSettings(Cunits)
      bind $w.pop3 <ButtonRelease-1> "PageConfig $w units "


      PageConfig $w init  ;# copy Current (C) to Actual (A) 

                          ##### focusNext does not seem to work
      bind $w.lent <Key-Return> "focus \[tk_focusNext \%W\]; PageConfig $w left "
      bind $w.rent <Key-Return> "focus \[tk_focusNext \%W\]; PageConfig $w right "
      bind $w.tent <Key-Return> "focus \[tk_focusNext \%W\]; PageConfig $w top "
      bind $w.bent <Key-Return> "focus \[tk_focusNext \%W\]; PageConfig $w bottom "
      bind $w.went <Key-Return> "focus \[tk_focusNext \%W\]; PageConfig $w width "
      bind $w.hent <Key-Return> "focus \[tk_focusNext \%W\]; PageConfig $w height "

   # end of  .pagesetup doesn't exist already 
   } 

   set old [focus]
   catch {tkwait visibility $w };  # wait for window to be destroyed
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
   tkwait window $w ;  # wait for window to be destroyed
   focus $old
   # destruction of this window should release the grab
   # commit new values to storage

   if { $updateFlag == 1 } { PageSetupUpdate }
}

proc PageConfig {w mode} {
   global pageSettings

   switch -exact -- $mode {
      type {
         if {[llength $pageSettings(Types)]!=[expr $pageSettings(Ctype) +1]} {
            # set proper width and height for this page type
            set v1 [lindex $pageSettings(Widths)  $pageSettings(Ctype) ]
            set v2 [lindex $pageSettings(Heights) $pageSettings(Ctype) ]

            if { $pageSettings(Corientation) == 0 } { #landscape
               set pageSettings(Cwidth)  $v2 
               set pageSettings(Cheight) $v1
            } else {                                  #portrait
               set pageSettings(Cwidth)  $v1 
               set pageSettings(Cheight) $v2
            }
           
         }
         # else we don't care about the width or height

      }
      orientation {  # swap the width and height
         set v1                   $pageSettings(Cwidth) 
         set pageSettings(Cwidth) $pageSettings(Cheight) 
         set pageSettings(Cheight) $v1
      }

      units {
         set pageSettings(Cscale) [lindex $pageSettings(Scales) $pageSettings(Cunits)]
      }

      width {
         scan $pageSettings(Twidth) "%f" lvar
         
         if {$lvar <= 0 || $lvar > 10000.} {

             if {$pageSettings(Ctype) < 6} {
                 # reload default for page type
                 set pageSettings(Cwidth)  [lindex $pagewid $pageSettings(Ctype)]

             } else {
                 # arbitrary, so use current height
                 set pageSettings(Cwidth)  pageSettings(Cheight)  
             }
             # should spawn error message, but ignore for now

         } else {
           set lvar [expr $lvar / $pageSettings(Cscale) ]
           set $pageSettings(Ctype) 6;    #  arbitrary paper width/type
           set pageSettings(Cwidth)  $lvar
         }
      }

      height {
         scan $pageSettings(Theight) "%f" lvar
         if {$lvar <= 0 || $lvar > 10000.} {

             if {$pageSettings(Ctype) < 6} {
                 # reload default for page type
                 set pageSettings(Cheight) [lindex $pagehit $pageSettings(Ctype)]

             } else {
                 # arbitrary, so use current height
                 set pageSettings(Cheight)  pageSettings(Cwidth)  
             }
             # should spawn error message, but ignore for now

         } else {
           set $pageSettings(Ctype)  6;    #  arbitrary paper width/type
           set pageSettings(Cheight) $lvar
         }
       
      }


      left  {
         if { [ scan $pageSettings(Tleft) "%f" lvar ] > 0 } {
            set lvar [expr $lvar / $pageSettings(Cscale) ]
            if { $lvar <= 0 || $lvar >= $pageSettings(Cwidth) } {
                 set pageSettings(Cleft) $pageSettings(Dleft)
            } else {
                 set pageSettings(Cleft) $lvar
            }
         }
      }

      right  {
         if { [ scan $pageSettings(Tright) "%f" lvar ] > 0 } {
            set lvar [expr $lvar / $pageSettings(Cscale) ]
            if { $lvar <= 0 || $lvar >= $pageSettings(Cwidth) } {
                 set pageSettings(Cright) $pageSettings(Dright)
            } else {
                 set pageSettings(Cright) $lvar
            }
         }
      }

      top  {
         if { [ scan $pageSettings(Ttop) "%f" lvar ] > 0 } {
            set lvar [expr $lvar / $pageSettings(Cscale) ]
            if { $lvar <= 0 || $lvar >= $pageSettings(Cheight) } {
                 set pageSettings(Ctop) $pageSettings(Dtop)
            } else {
                 set pageSettings(Ctop) $lvar
            }
         }
      }

      bottom  {
         if { [ scan $pageSettings(Tbottom) "%f" lvar ] > 0 } {
            set lvar [expr $lvar / $pageSettings(Cscale) ]
            if { $lvar <= 0 || $lvar >= $pageSettings(Cheight) } {
                 set pageSettings(Cbottom) $pageSettings(Dbottom)
            } else {
                 set pageSettings(Cbottom) $lvar
            }
         }
      }

      commit {  # commit all changes 
   set scale   $pageSettings(Cscale)
   set pageSettings(Cleft)  [format "%.2f" [expr $pageSettings(Tleft)  /$scale]]
   set pageSettings(Cright) [format "%.2f" [expr $pageSettings(Tright) /$scale]]
   set pageSettings(Ctop)   [format "%.2f" [expr $pageSettings(Ttop)   /$scale]]
 set pageSettings(Cbottom) [format "%.2f" [expr $pageSettings(Tbottom) /$scale]]
 set pageSettings(Cwidth)  [format "%.2f" [expr $pageSettings(Twidth) /$scale]]
 set pageSettings(Cheight) [format "%.2f" [expr $pageSettings(Theight) /$scale]]
         set pageSettings(Atype)         $pageSettings(Ctype)
         set pageSettings(Aorientation)  $pageSettings(Corientation)
         set pageSettings(Aunits)        $pageSettings(Cunits)
         set pageSettings(Ascale)        $pageSettings(Cscale)
         set pageSettings(Aleft)         $pageSettings(Cleft)
         set pageSettings(Aright)        $pageSettings(Cright)
         set pageSettings(Atop)          $pageSettings(Ctop)
         set pageSettings(Abottom)       $pageSettings(Cbottom)
         set pageSettings(Aheight)       $pageSettings(Cheight)
         set pageSettings(Awidth)        $pageSettings(Cwidth)
      }

      init {
         #  load current (modified) settings with defaults
         set pageSettings(Ctype)         $pageSettings(Atype)
         set pageSettings(Corientation)  $pageSettings(Aorientation)
         set pageSettings(Cunits)        $pageSettings(Aunits)
         set pageSettings(Cscale)        $pageSettings(Ascale)
         set pageSettings(Cleft)         $pageSettings(Aleft)
         set pageSettings(Cright)        $pageSettings(Aright)
         set pageSettings(Ctop)          $pageSettings(Atop)
         set pageSettings(Cbottom)       $pageSettings(Abottom)
         set pageSettings(Cheight)       $pageSettings(Aheight)
         set pageSettings(Cwidth)        $pageSettings(Awidth)
      } 

      default {
         #  load current (modified) settings with defaults
         set pageSettings(Ctype)         $pageSettings(Dtype)
         set pageSettings(Corientation)  $pageSettings(Dorientation)
         set pageSettings(Cunits)        $pageSettings(Dunits)
         set pageSettings(Cscale)        $pageSettings(Dscale)
         set pageSettings(Cleft)         $pageSettings(Dleft)
         set pageSettings(Cright)        $pageSettings(Dright)
         set pageSettings(Ctop)          $pageSettings(Dtop)
         set pageSettings(Cbottom)       $pageSettings(Dbottom)
         set pageSettings(Cheight)       $pageSettings(Dheight)
         set pageSettings(Cwidth)        $pageSettings(Dwidth)
      } 

   }
   set Ctype        [expr int($pageSettings(Ctype))]
   set Corientation [expr int($pageSettings(Corientation))]
   set Cunits       [expr int($pageSettings(Cunits))]
   set scale        $pageSettings(Cscale)
   $w.pagetype configure -relief raised \
              -text [lindex $pageSettings(Types)  $Ctype]
   $w.oriented configure -relief raised \
              -text [lindex $pageSettings(Orient) $Corientation]
   $w.units    configure -relief raised \
              -text [lindex $pageSettings(Units)  $Cunits]

   # the following settings are actual numbers in inches
   # Update the displayed text variables
   set pageSettings(Tleft) [format "%.2f" [expr $pageSettings(Cleft)  *$scale]]
   set pageSettings(Tright) [format "%.2f" [expr $pageSettings(Cright) *$scale]]
   set pageSettings(Ttop)  [format "%.2f" [expr $pageSettings(Ctop)   *$scale]]
 set pageSettings(Tbottom) [format "%.2f" [expr $pageSettings(Cbottom) *$scale]]
   set pageSettings(Twidth) [format "%.2f" [expr $pageSettings(Cwidth) *$scale]]
   set pageSettings(Theight) [format "%.2f" [expr $pageSettings(Cheight)*$scale]]
}








set pageDumpCount 0
proc PageDump {  } {
   global pageDumpCount

   set w [ toplevel .pagedump  -borderwidth 10 ]

  label $w.quest -bitmap questhead -padx 2 ;  #use built in question head icon
   if {$pageDumpCount <= 0 } { 
      set text \
"This will create/overwrite a new .ppp plot file\n for the current page setup.\n Do you wish to proceed?" 
   } else {
      set text \
"Appending a new page to the .ppp plot file with \n current page configuration.\n Do you wish to proceed?" 
  }

   label $w.lab -text  $text -padx 0
   frame $w.ok -borderwidth 2 -relief sunken

   button $w.ok.b -text OK \
       -command "incr pageDumpCount ; PageDumpPPP; destroy $w" ; 
   pack $w.ok.b
   button $w.cancel -text cancel -command "  destroy $w "
   pack $w.quest $w.lab -side top
   pack $w.ok $w.cancel -side left -padx 5 -pady 5
   
   awaitDestruction $w
}



# template settings
set applyTo(Graph)         [list Current "All Graphs"]
#  dummy Text entry variables
set applyTo(Tgnum)         0
set applyTo(Tgxpos)        0
set applyTo(Tgypos)        0
# default settings
set applyTo(DGraph)         0 ; # current
set applyTo(DGnum)          1 ; # current
set applyTo(DXpos)          5 ; # current
set applyTo(DYpos)          5 ; # current
# Actual settings
set applyTo(AGraph)         $applyTo(DGraph)
set applyTo(AGnum)          $applyTo(DGnum)
set applyTo(AXpos)          $applyTo(DXpos)
set applyTo(AYpos)          $applyTo(DYpos)
# currrent settings
set applyTo(CGraph)         $applyTo(AGraph)
set applyTo(CGnum)          $applyTo(AGnum)
set applyTo(CXpos)          $applyTo(AXpos)
set applyTo(CYpos)          $applyTo(AYpos)

proc ApplyToGraphConfig {w mode} {
   global applyTo
   global updateFlag

   switch -exact -- $mode {
      init {
          set applyTo(CGraph)         $applyTo(AGraph)
          set applyTo(CGnum)          $applyTo(AGnum)
          set applyTo(CXpos)          $applyTo(AXpos)
          set applyTo(CYpos)          $applyTo(AYpos)
      }
      commit {
          set applyTo(AGraph)         $applyTo(CGraph)
          set applyTo(AGnum)          $applyTo(CGnum)
          set applyTo(AXpos)          $applyTo(CXpos)
          set applyTo(AYpos)          $applyTo(CYpos)
      }
      update {  # no-op as its all validated below
      }
      default {
          set applyTo(CGraph)         $applyTo(DGraph)
          set applyTo(CGnum)          $applyTo(DGnum)
          set applyTo(CXpos)          $applyTo(DXpos)
          set applyTo(CYpos)          $applyTo(DYpos)
      }
   }

#  set the current button mode
   set mode       [expr int($applyTo(CGraph)) ]
   $w.tapplyto configure -relief raised \
              -text [lindex $applyTo(Graph)  $mode]

#  set the text entries to correct values
   if { $applyTo(CGraph) == 1 } { # all graphs 
      set applyTo(Tgnum)       " " 
      set applyTo(Tgxpos)      " "
      set applyTo(Tgypos)      " "

   } else {
      set applyTo(Tgnum)       $applyTo(CGnum)
      set applyTo(Tgxpos)      $applyTo(CXpos) 
      set applyTo(Tgypos)      $applyTo(CYpos)
   }

  $w.gnum   configure -state disabled ; #  can never shift the number
  $w.gxnum  configure -state disabled ; #  can never shift the x coord
  $w.gynum  configure -state disabled ; #  can never shift the y coord

}



# template settings
set hklbSettings(Range)    [list None Selected All ]
set hklbSettings(Iunits)   [list "% of graph" "% of max" F "F^2" Irel ]
set hklbSettings(Yunits)   [list "% of graph" "% of max" F "F^2" Irel ]
set hklbSettings(Xunits)   [list "% of graph" "2theta deg." "d spacing" ]
#  dummy Text entry variables
set hklbSettings(TmImin)         0
set hklbSettings(TmImax)         0
set hklbSettings(TmSize)         0
set hklbSettings(TmYoff)         0
set hklbSettings(TmXoff)         0
set hklbSettings(TlSize)         0
set hklbSettings(TlAngle)        0
set hklbSettings(TlImin)         0
set hklbSettings(TlImax)         0
set hklbSettings(TlXoff)         0
set hklbSettings(TlYoff)         0
#  Default settings
set hklbSettings(Dmarkers)  1; #no Markers
set hklbSettings(DmRange)   1; # markers on All refs
set hklbSettings(DmImin)    -99999.; # minimum intensity
set hklbSettings(DmImax)    9.9e+18 ;# maximum intensity
set hklbSettings(DmSize)    0.02 ;   #% of graph
set hklbSettings(DmIunits)  0. ;
set hklbSettings(DmYunits)  0. ;
set hklbSettings(DmGYunits) 0. ;
set hklbSettings(DmGXunits) 0. ;
set hklbSettings(Dmyoff)    0.05;    # % of graph 
set hklbSettings(Dmxoff)    0.00;    # % of graph 
set hklbSettings(Dlabels)   1;       #labels on active markers
set hklbSettings(DlRange)   1;       # labels on All marked refs
set hklbSettings(DlSize)    12.0;    # Font size
set hklbSettings(DlAngle)   0.0;     # Font angle
set hklbSettings(DlImin)    $hklbSettings(DmImin)
set hklbSettings(DlImax)    $hklbSettings(DmImax)
set hklbSettings(Dlyoff)    0.00; # relative to top of marker 
set hklbSettings(Dlxoff)    0.00; # relative to marker x
#   Set Actual Active values
set hklbSettings(Amarkers)  $hklbSettings(Dmarkers)
set hklbSettings(AmRange)   $hklbSettings(DmRange)   
set hklbSettings(AmImin)    $hklbSettings(DmImin)    
set hklbSettings(AmImax)    $hklbSettings(DmImax)    
set hklbSettings(AmSize)    $hklbSettings(DmSize) 
set hklbSettings(AmIunits)  $hklbSettings(DmIunits)  
set hklbSettings(AmYunits)  $hklbSettings(DmIunits)  
set hklbSettings(AmGYunits) $hklbSettings(DmGYunits)  
set hklbSettings(AmGXunits) $hklbSettings(DmGXunits)  
set hklbSettings(Amyoff)    $hklbSettings(Dmyoff)    
set hklbSettings(Amxoff)    $hklbSettings(Dmxoff)    
set hklbSettings(Alabels)   $hklbSettings(Dlabels)   
set hklbSettings(AlRange)   $hklbSettings(DlRange)   
set hklbSettings(AlSize)    $hklbSettings(DlSize)   
set hklbSettings(AlAngle)   $hklbSettings(DlAngle)   
set hklbSettings(AlImin)    $hklbSettings(DlImin)    
set hklbSettings(AlImax)    $hklbSettings(DlImax)    
set hklbSettings(Alyoff)    $hklbSettings(Dlyoff)    
set hklbSettings(Alxoff)    $hklbSettings(Dlxoff)    
#   Set current values
set hklbSettings(Cmarkers)  $hklbSettings(Amarkers)
set hklbSettings(CmRange)   $hklbSettings(AmRange)   
set hklbSettings(CmImin)    $hklbSettings(AmImin)    
set hklbSettings(CmImax)    $hklbSettings(AmImax)    
set hklbSettings(CmSize)    $hklbSettings(AmSize) 
set hklbSettings(CmIunits)  $hklbSettings(AmIunits)  
set hklbSettings(CmYunits)  $hklbSettings(AmIunits)  
set hklbSettings(CmGYunits) $hklbSettings(AmGYunits)  
set hklbSettings(CmGXunits) $hklbSettings(AmGXunits)  
set hklbSettings(Cmyoff)    $hklbSettings(Amyoff)    
set hklbSettings(Cmxoff)    $hklbSettings(Amxoff)    
set hklbSettings(Clabels)   $hklbSettings(Alabels)   
set hklbSettings(ClRange)   $hklbSettings(AlRange)   
set hklbSettings(ClSize)    $hklbSettings(AlSize)   
set hklbSettings(ClAngle)   $hklbSettings(AlAngle)   
set hklbSettings(ClImin)    $hklbSettings(AlImin)    
set hklbSettings(ClImax)    $hklbSettings(AlImax)    
set hklbSettings(Clyoff)    $hklbSettings(Alyoff)    
set hklbSettings(Clxoff)    $hklbSettings(Alxoff)    

proc Hklbars {} {
   global hklbSettings
   global applyTo
   global updateFlag
   set updateFlag 0

   set old [focus]

   if { [winfo exists .hklbars ] } {
      set $w .hklbars
      ApplyToGraphConfig $w init  ;# copy Actual (A) back to current (C) 
      hklbConfig $w init  ;# copy Actual (A) back to current (C) 
   } else {
      set w [ toplevel .hklbars -borderwidth 10 ]
      wm title  $w "Edit hkl bars"
     
      set a [frame $w.f  ]
      set b [frame $a.f  -highlightthickness 1 -highlightbackground Red ]
      set c [frame $b.f  -highlightthickness 1 -highlightbackground Red ]
      set d [frame $w.f0 -highlightthickness 1 -highlightbackground Red ]
      set e [frame $w.f1 ]
      set f [frame $w.f2 ]
      checkbutton $w.btext -text "Include hkl markers" \
                           -variable hklbSettings(Cmarkers)


      label  $w.bincl  -text "for reflections" 
      button $w.bselref -relief raised -pady 0 -underline 0 

      label  $w.byunits -text "Intensity units" ;  
      button $w.byusel  -relief raised -pady 0 -underline 0 

      label  $w.bymin  -text "I min" ;  
      entry  $w.bynent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TmImin)
      label  $w.bymax  -text "I max" ;  
      entry  $w.byxent      -width 8 -relief sunken \
                           -textvariable hklbSettings(TmImax)

      label  $w.bvunits -text "marker units" ;  
      button $w.bvusel  -relief raised -pady 0 -underline 0 
      label  $w.bvsize  -text "marker size" ;  
      entry  $w.bvsent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TmSize)

      label  $w.byounits -text "Y Offset units" ;  
      button $w.byousel  -relief raised -pady 0 -underline 0 
      label  $w.byoff  -text "Y offset" ;  
      entry  $w.byoent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TmYoff)

      label  $w.bxounits -text "X Offset units" ;  
      button $w.bxousel  -relief raised -pady 0 -underline 0 
      label  $w.bxoff  -text "X offset" ;  
      entry  $w.bxoent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TmXoff)


      checkbutton $w.bars -text "include marker labels"  \
                           -variable hklbSettings(Clabels)


      label  $w.tincl -text "for reflections" 
      button $w.tselref -relief raised -pady 0 -underline 0 

      label  $w.tysize  -text "font size" ;  
      entry  $w.tysent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TlSize)
      label  $w.tyangle   -text "angle" ;  
      entry  $w.tyaent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TlAngle)


      label  $w.tymin  -text "I min" ;  
      entry  $w.tynent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TlImin)
      label  $w.tymax  -text "I max" ;  
      entry  $w.tyxent      -width 8 -relief sunken \
                           -textvariable hklbSettings(TlImax)

      label  $w.tyoff  -text "Y Offset" ;  
      entry  $w.tyoent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TlYoff)
      label  $w.txoff  -text "X Offset" ;  
      entry  $w.txoent      -width 8 -relief sunken \
                          -textvariable hklbSettings(TlXoff)


      label  $w.gnumlab  -text "Current Graph\#"
      entry  $w.gnum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgnum)
      label  $w.gxplab   -text "X position"
      entry  $w.gxnum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgxpos)
      label  $w.gyplab   -text "Y position"
      entry  $w.gynum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgypos)

      label  $w.tapply   -text "Apply to:"
      button $w.tapplyto  -relief raised -pady 0 -underline 0 
      grid  $w.gnumlab  $w.gnum  $w.gxplab  $w.gxnum  -in $d -sticky w
      grid      x         x      $w.gyplab  $w.gynum  -in $d -sticky w
      grid  $w.tapply   $w.tapplyto -in $e   -sticky w


      button $w.done    -text Done    -pady 2  \
                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
             -command "HklBarConfig $w commit ; \
                       ApplyToGraphConfig $w commit ;\
                       HklBarUpdate "
      button $w.default -text Default -pady 2 \
                           -command "HklBarConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command "focus $old ;destroy $w "

      grid  $w.done $w.apply $w.default $w.cancel -in $f -sticky s
   

      grid  $a       -in $w  -sticky w -ipady 2 -ipadx 2
      grid $w.btext  -in $a  -sticky w -pady 2
      grid $b        -in $a  -padx 10 -sticky w -ipady 2 -ipadx 2
      grid $d -in $w -sticky w -pady 6 -ipady 2 -ipadx 2
      grid $e -in $w -sticky w -pady 6
      grid $f -in $w -sticky w -pady 6

      grid  $w.bincl  $w.bselref  $w.byunits  $w.byusel -in $b -sticky news
      grid  $w.bymin  $w.bynent   $w.bymax    $w.byxent -in $b -sticky news
      grid  $w.bvunits $w.bvusel  $w.bvsize   $w.bvsent -in $b -sticky news
      grid  $w.byounits $w.byousel $w.byoff   $w.byoent -in $b -sticky news
      grid  $w.bxounits $w.bxousel $w.bxoff   $w.bxoent -in $b -sticky news
 
      grid  $w.bars   - - -  -in $b -sticky w -pady 2
 
      grid  $c - - - -     -in $b -padx 20 -pady 2 -sticky news
 
      grid  $w.tincl  $w.tselref  $w.tysize  $w.tysent -in $c -sticky w
      grid   x            x       $w.tyangle $w.tyaent -in $c -sticky w
      grid  $w.tymin  $w.tynent   $w.tymax   $w.tyxent -in $c -sticky w
      grid   x            x       $w.tyoff   $w.tyoent -in $c -sticky news
      grid   x            x       $w.txoff   $w.txoent -in $c -sticky news
 
      grid  $w.gnumlab  $w.gnum  $w.gxplab  $w.gxnum  -in $d -sticky w
      grid      x         x      $w.gyplab  $w.gynum  -in $d -sticky w
      grid  $w.tapply   $w.tapplyto -in $e   -sticky w
      grid  $w.done $w.apply $w.default $w.cancel -in $f -sticky s


      BuildPop $w.bselref $w.pop1 $hklbSettings(Range)  hklbSettings(CmRange)
      BuildPop $w.byusel  $w.pop2 $hklbSettings(Iunits) hklbSettings(CmIunits)
      BuildPop $w.bvusel  $w.pop3 $hklbSettings(Yunits) hklbSettings(CmYunits)
      BuildPop $w.byousel $w.pop4 $hklbSettings(Yunits) hklbSettings(CmGYunits)
      BuildPop $w.bxousel $w.pop5 $hklbSettings(Xunits) hklbSettings(CmGXunits)
      bind $w.pop1 <ButtonRelease-1> "HklBarConfig $w mrange "
      bind $w.pop2 <ButtonRelease-1> "HklBarConfig $w iunits "
      bind $w.pop3 <ButtonRelease-1> "HklBarConfig $w munits "
      bind $w.pop4 <ButtonRelease-1> "HklBarConfig $w yoffunits "
      bind $w.pop5 <ButtonRelease-1> "HklBarConfig $w xoffunits "

      BuildPop $w.tselref $w.pop6 $hklbSettings(Range)  hklbSettings(ClRange)
      bind $w.pop6 <ButtonRelease-1> "HklBarConfig $w lrange "

      BuildPop $w.tapplyto  $w.pop7  $applyTo(Graph)  applyTo(CGraph)
      bind $w.pop7 <ButtonRelease-1> "ApplyToGraphConfig $w update "

      HklBarConfig     $w init ;
      ApplyToGraphConfig $w init ;
   
   }


   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
   # continue and sit in the main tcl/tk event loop
}

proc HklBarConfig {w mode} {
   global hklbSettings
   global ApplyTo
   global updateFlag

   switch -exact -- $mode {
      init {
         set hklbSettings(Cmarkers)  $hklbSettings(Amarkers)
         set hklbSettings(CmRange)   $hklbSettings(AmRange)   
         set hklbSettings(CmImin)    $hklbSettings(AmImin)    
         set hklbSettings(CmImax)    $hklbSettings(AmImax)    
         set hklbSettings(CmSize)    $hklbSettings(AmSize) 
         set hklbSettings(CmIunits)  $hklbSettings(AmIunits)  
         set hklbSettings(CmYunits)  $hklbSettings(AmIunits)  
         set hklbSettings(CmGYunits) $hklbSettings(AmGYunits)  
         set hklbSettings(CmGXunits) $hklbSettings(AmGXunits)  
         set hklbSettings(Cmyoff)    $hklbSettings(Amyoff)    
         set hklbSettings(Cmxoff)    $hklbSettings(Amxoff)    
         set hklbSettings(Clabels)   $hklbSettings(Alabels)   
         set hklbSettings(ClRange)   $hklbSettings(AlRange)   
         set hklbSettings(ClSize)    $hklbSettings(AlSize)   
         set hklbSettings(ClAngle)   $hklbSettings(AlAngle)   
         set hklbSettings(ClImin)    $hklbSettings(AlImin)    
         set hklbSettings(ClImax)    $hklbSettings(AlImax)    
         set hklbSettings(Clyoff)    $hklbSettings(Alyoff)    
         set hklbSettings(Clxoff)    $hklbSettings(Alxoff)    
         set hklbSettings(CmIunits)  $hklbSettings(AmIunits)  
         set hklbSettings(CmYunits)  $hklbSettings(AmIunits)  
         set hklbSettings(CmGYunits) $hklbSettings(AmGYunits)  
         set hklbSettings(CmGXunits) $hklbSettings(AmGXunits)  
      }
      commit {        # label hkl markers range

        set hklbSettings(CmImin)   [format "%f" [expr $hklbSettings(TmImin) * 1.] ]
        set hklbSettings(CmImax)   [format "%f" [expr $hklbSettings(TmImax) * 1.] ]
        set hklbSettings(CmSize)   [format "%f" [expr $hklbSettings(TmSize) * 1.] ]
        set hklbSettings(Cmyoff)   [format "%f" [expr $hklbSettings(TmYoff) * 1.] ]
        set hklbSettings(Cmxoff)   [format "%f" [expr $hklbSettings(TmXoff) * 1.] ]
        set hklbSettings(ClSize)   [format "%f" [expr $hklbSettings(TlSize) * 1.] ]
        set hklbSettings(ClAngle)  [format "%f" [expr $hklbSettings(TlAngle)* 1.] ]
        set hklbSettings(ClImin)   [format "%f" [expr $hklbSettings(TlImin) * 1.] ]
        set hklbSettings(ClImax)   [format "%f" [expr $hklbSettings(TlImax) * 1.] ]
        set hklbSettings(Clxoff)   [format "%f" [expr $hklbSettings(TlXoff) * 1.] ]
        set hklbSettings(Clyoff)   [format "%f" [expr $hklbSettings(TlYoff) * 1.] ]

         set hklbSettings(Amarkers)  $hklbSettings(Cmarkers)
         set hklbSettings(AmRange)   $hklbSettings(CmRange)   
         set hklbSettings(AmImin)    $hklbSettings(CmImin)    
         set hklbSettings(AmImax)    $hklbSettings(CmImax)    
         set hklbSettings(AmSize)    $hklbSettings(CmSize) 
         set hklbSettings(AmIunits)  $hklbSettings(CmIunits)  
         set hklbSettings(AmYunits)  $hklbSettings(CmIunits)  
         set hklbSettings(AmGYunits) $hklbSettings(CmGYunits)  
         set hklbSettings(AmGXunits) $hklbSettings(CmGXunits)  
         set hklbSettings(Amyoff)    $hklbSettings(Cmyoff)    
         set hklbSettings(Amxoff)    $hklbSettings(Cmxoff)    
         set hklbSettings(Alabels)   $hklbSettings(Clabels)   
         set hklbSettings(AlRange)   $hklbSettings(ClRange)   
         set hklbSettings(AlSize)    $hklbSettings(ClSize)   
         set hklbSettings(AlAngle)   $hklbSettings(ClAngle)   
         set hklbSettings(AlImin)    $hklbSettings(ClImin)    
         set hklbSettings(AlImax)    $hklbSettings(ClImax)    
         set hklbSettings(Alyoff)    $hklbSettings(Clyoff)    
         set hklbSettings(Alxoff)    $hklbSettings(Clxoff)    

      }
      mrange {        # marker range

      }
      iunits {       # convert intensity units
      }
      munits {
      }
      xoffunits {
      }
      yoffunits {
      }
      lrange {        # label hkl markers range

#         set hklbSettings(ClRange)   $hklbSettings(AlRange)   
      }

      default {
         set hklbSettings(Cmarkers)  $hklbSettings(Dmarkers)
         set hklbSettings(CmRange)   $hklbSettings(DmRange)   
         set hklbSettings(CmImin)    $hklbSettings(DmImin)    
         set hklbSettings(CmImax)    $hklbSettings(DmImax)    
         set hklbSettings(CmSize)    $hklbSettings(DmSize) 
         set hklbSettings(CmIunits)  $hklbSettings(DmIunits)  
         set hklbSettings(CmYunits)  $hklbSettings(DmIunits)  
         set hklbSettings(CmGYunits) $hklbSettings(DmGYunits)  
         set hklbSettings(CmGXunits) $hklbSettings(DmGXunits)  
         set hklbSettings(Cmyoff)    $hklbSettings(Dmyoff)    
         set hklbSettings(Cmxoff)    $hklbSettings(Dmxoff)    
         set hklbSettings(Clabels)   $hklbSettings(Dlabels)   
         set hklbSettings(ClRange)   $hklbSettings(DlRange)   
         set hklbSettings(ClSize)    $hklbSettings(DlSize)   
         set hklbSettings(ClAngle)   $hklbSettings(DlAngle)   
         set hklbSettings(ClImin)    $hklbSettings(DlImin)    
         set hklbSettings(ClImax)    $hklbSettings(DlImax)    
         set hklbSettings(Clyoff)    $hklbSettings(Dlyoff)    
         set hklbSettings(Clxoff)    $hklbSettings(Dlxoff)    
      }
   }

#  configure the popup menus

   set nmode       [expr int( $hklbSettings(CmRange)) ]
   $w.bselref configure -relief raised \
              -text [lindex $hklbSettings(Range)  $nmode]

   set nmode       [expr int($hklbSettings(CmIunits)) ]
   $w.byusel configure -relief raised \
              -text [lindex $hklbSettings(Iunits)  $nmode]

   set nmode       [expr int($hklbSettings(CmYunits)) ]
   $w.bvusel configure -relief raised \
              -text [lindex $hklbSettings(Yunits)  $nmode]

   set nmode       [expr int($hklbSettings(CmGYunits)) ]
   $w.byousel configure -relief raised \
              -text [lindex $hklbSettings(Yunits)  $nmode]

   set nmode       [expr int($hklbSettings(CmGXunits)) ]
   $w.bxousel configure -relief raised \
              -text [lindex $hklbSettings(Xunits)  $nmode]

   set nmode       [expr int( $hklbSettings(ClRange)) ]
   $w.tselref configure -relief raised \
              -text [lindex $hklbSettings(Range)  $nmode]




#  configure the text entries

   set tmp $hklbSettings(CmImin)
   if { abs($tmp) > 999999. }  {
       set hklbSettings(TmImin) [ format "%.2e" $tmp ]
   }  else {
       set hklbSettings(TmImin) [ format "%.2f" $tmp ]
   }
   set tmp $hklbSettings(CmImax)
   if { abs($tmp) > 999999. }  {
       set hklbSettings(TmImax) [ format "%.2e" $tmp ]
   }  else {
       set hklbSettings(TmImax) [ format "%.2f" $tmp]
   }
set hklbSettings(TmSize)   [format "%.4f" [expr $hklbSettings(CmSize) *1. ] ]
set hklbSettings(TmYoff)   [format "%.4f" [expr $hklbSettings(Cmyoff) *1.] ]
set hklbSettings(TmXoff)   [format "%.2f" [expr $hklbSettings(Cmxoff) *1.] ]
set hklbSettings(TlSize)   [format "%.2f" [expr $hklbSettings(ClSize) *1.] ]
set hklbSettings(TlAngle)  [format "%.2f" [expr $hklbSettings(ClAngle)*1.] ]
set hklbSettings(TlImin)   [format "%f" [expr $hklbSettings(ClImin) *1.] ]
   set tmp $hklbSettings(ClImin)
   if { abs($tmp) > 999999. }  {
       set hklbSettings(TlImin) [ format "%.2e" $tmp ]
   }  else {
       set hklbSettings(TlImin) [ format "%.2f" $tmp ]
   }
   set tmp $hklbSettings(ClImax)
   if { abs($tmp) > 999999. }  {
       set hklbSettings(TlImax) [ format "%.2e" $tmp ]
   }  else {
       set hklbSettings(TlImax) [ format "%.2f" $tmp]
   }
set hklbSettings(TlXoff)   [format "%.2f" [expr $hklbSettings(Clxoff) *1.] ]
set hklbSettings(TlYoff)   [format "%.2f" [expr $hklbSettings(Clyoff) *1.] ]
 
      $w.bxoent  configure -state disabled ; #  can never shift the x coord
}







# this is all pretty pointless because only "twotheta-linear" is supported
# on the ratmac side. Maybe someone will fix that ?...
set plotStyle(XStyles) [list "two theta" "d spacing" ]
set plotStyle(YStyles) [list "linear" "logarithmic" ]
set plotStyle(DxStyle) 0
set plotStyle(DyStyle) 0
set plotStyle(AxStyle) $plotStyle(DxStyle) 
set plotStyle(AyStyle) $plotStyle(DyStyle) 
set plotStyle(CxStyle) $plotStyle(AxStyle) 
set plotStyle(CyStyle) $plotStyle(AyStyle) 



proc PlotStyle { } {
   global applyTo
   global plotStyle

   set old [focus]

   if { [winfo exists .plotstyle ] } {
      set $w .plotstyle
      ApplyToGraphConfig $w init  ;# copy Actual (A) back to current (C) 
      PlotStyleConfig    $w init  
   } else {
      set w [ toplevel .plotstyle -borderwidth 10 ]
      wm title  $w "Plot Style"
     
      set a [frame $w.f1  ]
      set b [frame $w.f2  -highlightthickness 1 -highlightbackground Red ]
      set c [frame $w.f3 ]
      set d [frame $w.f4 ]
      set e [frame $w.f5 ]

      grid  $a
      grid  $b
      grid  $c
      grid  $d
      grid  $e


      label  $w.disclaim -text "Only the default is currently supported."
      grid  $w.disclaim -in $a


      label  $w.ylabel  -text  "Y Axis" 
      button $w.ysel   -relief raised -pady 0 -underline 0 

      label  $w.xlabel  -text  "X Axis" 
      button $w.xsel   -relief raised -pady 0 -underline 0 

      grid  $w.ylabel $w.ysel $w.xlabel $w.xsel -in $b
      


      label  $w.gnumlab  -text "Current Graph\#"
      entry  $w.gnum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgnum)
      label  $w.gxplab   -text "X position"
      entry  $w.gxnum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgxpos)
      label  $w.gyplab   -text "Y position"
      entry  $w.gynum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgypos)

      label  $w.tapply   -text "Apply to:"
      button $w.tapplyto  -relief raised -pady 0 -underline 0 


      button $w.done    -text Done    -pady 2  \
                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
                         -command "PlotStyleConfig $w commit ; \
                                   ApplyToGraphConfig $w commit ;\
                                   PlotStyleUpdate "
      button $w.default -text Default -pady 2 \
                           -command "PlotStyleConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command "focus $old ;destroy $w "


      grid  $w.gnumlab  $w.gnum  $w.gxplab  $w.gxnum  -in $c -sticky w
      grid      x         x      $w.gyplab  $w.gynum  -in $c -sticky w
      grid  $w.tapply   $w.tapplyto -in $d   -sticky w

      grid  $w.done $w.apply $w.default $w.cancel -in $e -sticky s


      BuildPop $w.xsel  $w.pop1 $plotStyle(XStyles)  plotStyle(CxStyle)  
      BuildPop $w.ysel  $w.pop2 $plotStyle(YStyles)  plotStyle(CyStyle)  
      bind $w.pop1 <ButtonRelease-1> "PlotStyleConfig $w mrange "
      bind $w.pop2 <ButtonRelease-1> "PlotStyleConfig $w iunits "

      BuildPop $w.tapplyto  $w.pop7  $applyTo(Graph)  applyTo(CGraph)
      bind $w.pop7 <ButtonRelease-1> "ApplyToGraphConfig $w update "

      PlotStyleConfig    $w init  
      ApplyToGraphConfig $w init ;
   }

   awaitDestruction $w
}



proc PlotStyleConfig {w mode } {
   global applyTo
   global plotStyle

   switch -exact -- $mode {
      init {
         set plotStyle(CxStyle)  $plotStyle(AxStyle)  
         set plotStyle(CyStyle)  $plotStyle(AyStyle)  
      }
      commit {
         set plotStyle(AxStyle)  $plotStyle(CxStyle)  
         set plotStyle(AyStyle)  $plotStyle(CyStyle)  
      }
      default {
         set plotStyle(CxStyle)  $plotStyle(DxStyle)  
         set plotStyle(CyStyle)  $plotStyle(DyStyle)  
      }
      mrange {
      }
      iunits {
      }
   }

   set nmode       [expr int($plotStyle(CxStyle)) ]
   $w.xsel configure -relief raised \
              -text [lindex $plotStyle(XStyles) $nmode]
   set nmode       [expr int($plotStyle(CyStyle)) ]
   $w.ysel configure -relief raised \
              -text [lindex $plotStyle(YStyles) $nmode]

}




set plotRange(XStyles) [list "  Two theta   " "  d spacing   " ]
set plotRange(Xmin)   [list  0.   0.1 ]
set plotRange(Xmax)   [list  90.  15.0 ]
set plotRange(YStyles) [list "Intensity lin." "Intensity log." ]
set plotRange(Ymin)   [list  0.  0. ]
set plotRange(Ymax)   [list 2000. 5. ]
#  text variables
set plotRange(Txmin) 0
set plotRange(Tymin) 0
set plotRange(Txmax) 0
set plotRange(Tymax) 0
#  current values
set plotRange(Axmin) [lindex $plotRange(Xmin) $plotStyle(AxStyle) ]
set plotRange(Axmax) [lindex $plotRange(Xmax) $plotStyle(AxStyle) ]
set plotRange(Aymin) [lindex $plotRange(Ymin) $plotStyle(AyStyle) ]
set plotRange(Aymax) [lindex $plotRange(Ymax) $plotStyle(AyStyle) ]
#
set plotRange(Cxmin) $plotRange(Axmin) 
set plotRange(Cymin) $plotRange(Aymin) 
set plotRange(Cxmax) $plotRange(Axmax) 
set plotRange(Cymax) $plotRange(Aymax) 




proc PlotRange { } {
   global applyTo
   global plotRange

   set old [focus]

   if { [winfo exists .plotdimen ] } {
      set $w .plotdimen
      ApplyToGraphConfig $w init  ;# copy Actual (A) back to current (C) 
      PlotRangeConfig    $w init  
   } else {
      set w [ toplevel .plotdimen -borderwidth 10 ]
      wm title  $w "Plot Ranges"
     
      set a [frame $w.f1  -highlightthickness 1 -highlightbackground Red ]
      set b [frame $w.f2  -highlightthickness 1 -highlightbackground Red ]
      set c [frame $w.f3 ]
      set d [frame $w.f4 ]
      set e [frame $w.f5 ]

      grid  $a -sticky w
      grid  $b -sticky w
      grid  $c -sticky w
      grid  $d -sticky w
      grid  $e -sticky w




      label  $w.ylabel  -text  "Y Axis" 
      label $w.yunits   -relief raised -pady 0 
      label  $w.yminlab  -text  "Minimum" 
      entry $w.ymin   -relief sunken  -width 10 \
                          -textvariable plotRange(Tymin)
      label  $w.ymaxlab  -text  "Maximum" 
      entry $w.ymax   -relief sunken  -width 10 \
                          -textvariable plotRange(Tymax)

      grid  $w.ylabel - - -in $a
      grid    x     $w.yunits $w.yminlab $w.ymin -in $a
      grid    x        x      $w.ymaxlab $w.ymax -in $a


      label  $w.xlabel  -text  "X Axis" 
      label  $w.xunits  -relief raised -pady 0 
      label  $w.xminlab  -text  "Minimum" 
      entry  $w.xmin    -relief sunken  -width 10 \
                          -textvariable plotRange(Txmin)
      label  $w.xmaxlab  -text  "Maximum" 
      entry  $w.xmax    -relief sunken  -width 10 \
                          -textvariable plotRange(Txmax)

      grid  $w.xlabel - - -in $b
      grid    x     $w.xunits $w.xminlab $w.xmin -in $b
      grid    x        x      $w.xmaxlab $w.xmax -in $b

      


      label  $w.gnumlab  -text "Current Graph\#"
      entry  $w.gnum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgnum)
      label  $w.gxplab   -text "X position"
      entry  $w.gxnum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgxpos)
      label  $w.gyplab   -text "Y position"
      entry  $w.gynum     -width 2 -relief sunken \
                          -textvariable applyTo(Tgypos)

      label  $w.tapply   -text "Apply to:"
      button $w.tapplyto  -relief raised -pady 0 -underline 0 

      grid  $w.gnumlab  $w.gnum  $w.gxplab  $w.gxnum  -in $c -sticky w
      grid      x         x      $w.gyplab  $w.gynum  -in $c -sticky w
      grid  $w.tapply   $w.tapplyto -in $d   -sticky w




      button $w.done    -text Done    -pady 2  \
                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
                         -command "PlotRangeConfig $w commit ; \
                                   ApplyToGraphConfig $w commit ;\
                                   PlotRangeUpdate "
      button $w.default -text Default -pady 2 \
                           -command "PlotRangeConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command "focus $old ;destroy $w "

      grid  $w.done $w.apply $w.default $w.cancel -in $e -sticky s


      BuildPop $w.tapplyto  $w.pop7  $applyTo(Graph)  applyTo(CGraph)
      bind $w.pop7 <ButtonRelease-1> "ApplyToGraphConfig $w update "

      ApplyToGraphConfig $w init ;
      PlotRangeConfig    $w init  
   }

   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
# effectively modal, but reverting to the main eventloop for processing
# this permits any updates to take effect immediately
}



proc PlotRangeConfig {w mode } {
   global applyTo
   global plotStyle
   global plotRange

   switch -exact -- $mode {
      init {
         set plotRange(Cxmin) $plotRange(Axmin) 
         set plotRange(Cxmax) $plotRange(Axmax) 
         set plotRange(Cymin) $plotRange(Aymin) 
         set plotRange(Cymax) $plotRange(Aymax) 
      }
      commit {
         set plotRange(Cxmin) [format "%f" [expr $plotRange(Txmin) * 1.] ]
         set plotRange(Cxmax) [format "%f" [expr $plotRange(Txmax) * 1.] ]
         set plotRange(Cymin) [format "%f" [expr $plotRange(Tymin) * 1.] ]
         set plotRange(Cymax) [format "%f" [expr $plotRange(Tymax) * 1.] ]
         set plotRange(Axmin) $plotRange(Cxmin) 
         set plotRange(Axmax) $plotRange(Cxmax) 
         set plotRange(Aymin) $plotRange(Cymin) 
         set plotRange(Aymax) $plotRange(Cymax) 
      }
      default {
         set plotRange(Cxmin) [lindex $plotRange(Xmin) $plotStyle(AxStyle) ]
         set plotRange(Cxmax) [lindex $plotRange(Xmax) $plotStyle(AxStyle) ]
         set plotRange(Cymin) [lindex $plotRange(Ymin) $plotStyle(AyStyle) ]
         set plotRange(Cymax) [lindex $plotRange(Ymax) $plotStyle(AyStyle) ]
      }
   }

   set nmode       [expr int($plotStyle(CxStyle)) ]
   $w.xunits  configure -relief raised \
              -text [lindex $plotRange(XStyles) $nmode]
   set nmode       [expr int($plotStyle(CyStyle)) ]
   $w.yunits  configure -relief raised \
              -text [lindex $plotRange(YStyles) $nmode] 


   set tmp $plotRange(Cymin)
   if { abs($tmp) > 999999. }  {
       set plotRange(Tymin) [ format "%.2e" $tmp ]
   }  else {
       set plotRange(Tymin) [ format "%.2f" $tmp ]
   }

   set tmp $plotRange(Cymax)
   if { abs($tmp) > 999999. }  {
       set plotRange(Tymax) [ format "%.2e" $tmp ]
   }  else {
       set plotRange(Tymax) [ format "%.2f" $tmp ]
   }

   set plotRange(Txmin) [ format "%.4f" $plotRange(Cxmin) ]
   set plotRange(Txmax) [ format "%.4f" $plotRange(Cxmax) ]

}






set backGround(Styles)  [list None "polynomial" ]
set backGround(Dp1)  0.
set backGround(Dp2)  0.
set backGround(Dp3)  0.
set backGround(Dp4)  0.
set backGround(Dp5)  0.
set backGround(DStyle)  0
#  Actual used values
set backGround(AStyle) $backGround(DStyle)  
set backGround(Ap1)    $backGround(Dp1)  
set backGround(Ap2)    $backGround(Dp2)  
set backGround(Ap3)    $backGround(Dp3)  
set backGround(Ap4)    $backGround(Dp4)  
set backGround(Ap5)    $backGround(Dp5)  
#  current values displayed
set backGround(CStyle) $backGround(AStyle)  
set backGround(Cp1)    $backGround(Ap1)  
set backGround(Cp2)    $backGround(Ap2)  
set backGround(Cp3)    $backGround(Ap3)  
set backGround(Cp4)    $backGround(Ap4)  
set backGround(Cp5)    $backGround(Ap5)  
#  text entry values
set backGround(Tp1)    0
set backGround(Tp2)    0
set backGround(Tp3)    0
set backGround(Tp4)    0
set backGround(Tp5)    0





proc BackGround { } {
   global backGround

   set old [focus]

   if { [winfo exists .bground ] } {
      set $w .bground
      BackGroundConfig  $w init  
   } else {
      set w [ toplevel .bground -borderwidth 10 ]
      wm title  $w "Measured Backgound"
     
      set a [frame $w.f1  -highlightthickness 1 -highlightbackground Red ]
      set b [frame $w.f2  -highlightthickness 1 -highlightbackground Red ]
      set c [frame $w.f5 ]

      grid  $a -sticky w
      grid  $b -sticky w
      grid  $c -sticky w

      label  $w.title -text "Background Treatment Method:" 



      button $w.method  -relief raised -pady 0 -underline 0 

      grid $w.title  $w.method  -in $a

     
      label  $w.lp0 -text "Polynomial" 

      label  $w.lp1 -text "Const" 
      entry  $w.ep1   -relief sunken  -width 10 \
                          -textvariable backGround(Tp1)
      label  $w.lp2 -text "+ tt   *" 
      entry  $w.ep2   -relief sunken  -width 10 \
                          -textvariable backGround(Tp2)
      label  $w.lp3 -text "+ tt^2 *" 
      entry  $w.ep3   -relief sunken  -width 10 \
                          -textvariable backGround(Tp3)
      label  $w.lp4 -text "+ tt^3 *" 
      entry  $w.ep4   -relief sunken  -width 10 \
                          -textvariable backGround(Tp4)
      label  $w.lp5 -text "+ tt^4 *" 
      entry  $w.ep5   -relief sunken  -width 10 \
                          -textvariable backGround(Tp5)

      grid $w.lp0   x      x   -in $b
      grid  x    $w.lp1 $w.ep1 -in $b 
      grid  x    $w.lp2 $w.ep2 -in $b
      grid  x    $w.lp3 $w.ep3 -in $b
      grid  x    $w.lp4 $w.ep4 -in $b
      grid  x    $w.lp5 $w.ep5 -in $b



      button $w.done    -text Done    -pady 2  \
                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
                       -command "BackGroundConfig $w commit ; BackGroundUpdate "
      button $w.default -text Default -pady 2 \
                           -command "BackGroundConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command "focus $old ;destroy $w "

      grid  $w.done $w.apply $w.default $w.cancel -in $c -sticky s


      BuildPop $w.method  $w.pop1  $backGround(Styles) backGround(CStyle)
      bind $w.pop1 <ButtonRelease-1> "BackGroundConfig $w style "

      BackGroundConfig    $w init  
   }


   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
# effectively modal, but reverting to the main eventloop for processing
# this permits any updates to take effect immediately
}


proc BackGroundConfig {w mode } {
   global backGround

   switch -exact -- $mode {
      init {
         set backGround(CStyle) $backGround(AStyle)  
         set backGround(Cp1)    $backGround(Ap1)  
         set backGround(Cp2)    $backGround(Ap2)  
         set backGround(Cp3)    $backGround(Ap3)  
         set backGround(Cp4)    $backGround(Ap4)  
         set backGround(Cp5)    $backGround(Ap5)  
      }
      commit {
         set backGround(Cp1) [format "%f" [expr $backGround(Tp1) * 1.] ]
         set backGround(Cp2) [format "%f" [expr $backGround(Tp2) * 1.] ]
         set backGround(Cp3) [format "%f" [expr $backGround(Tp3) * 1.] ]
         set backGround(Cp4) [format "%f" [expr $backGround(Tp4) * 1.] ]
         set backGround(Cp5) [format "%f" [expr $backGround(Tp5) * 1.] ]
         set backGround(AStyle) $backGround(CStyle)  
         set backGround(Ap1)    $backGround(Cp1)  
         set backGround(Ap2)    $backGround(Cp2)  
         set backGround(Ap3)    $backGround(Cp3)  
         set backGround(Ap4)    $backGround(Cp4)  
         set backGround(Ap5)    $backGround(Cp5)  
      }
      default {
         set backGround(CStyle) $backGround(DStyle)  
         set backGround(Cp1)    $backGround(Dp1)  
         set backGround(Cp2)    $backGround(Dp2)  
         set backGround(Cp3)    $backGround(Dp3)  
         set backGround(Cp4)    $backGround(Dp4)  
         set backGround(Cp5)    $backGround(Dp5)  
      }
      style {
      }
   }


   set nmode       [expr int($backGround(CStyle)) ]
   $w.method  configure -relief raised \
              -text [lindex $backGround(Styles) $nmode]



   set tmp $backGround(Cp1)
   if { abs($tmp) > 999999. }  {
       set backGround(Tp1) [ format "%.4e" $tmp ]
   }  else {
       set backGround(Tp1) [ format "%.4f" $tmp ]
   }
   set tmp $backGround(Cp2)
   if { abs($tmp) > 999999. }  {
       set backGround(Tp2) [ format "%.4e" $tmp ]
   }  else {
       set backGround(Tp2) [ format "%.4f" $tmp ]
   }
   set tmp $backGround(Cp3)
   if { abs($tmp) > 999999. }  {
       set backGround(Tp3) [ format "%.4e" $tmp ]
   }  else {
       set backGround(Tp3) [ format "%.4f" $tmp ]
   }
   set tmp $backGround(Cp4)
   if { abs($tmp) > 999999. }  {
       set backGround(Tp4) [ format "%.4e" $tmp ]
   }  else {
       set backGround(Tp4) [ format "%.4f" $tmp ]
   }
   set tmp $backGround(Cp5)
   if { abs($tmp) > 999999. }  {
       set backGround(Tp5) [ format "%.4e" $tmp ]
   }  else {
       set backGround(Tp5) [ format "%.4f" $tmp ]
   }

   if {$backGround(CStyle) != 0 }  {
      $w.ep1 configure -state normal
      $w.ep2 configure -state normal
      $w.ep3 configure -state normal
      $w.ep4 configure -state normal
      $w.ep5 configure -state normal
   } else { 
      $w.ep1 configure -state disabled
      $w.ep2 configure -state disabled
      $w.ep3 configure -state disabled
      $w.ep4 configure -state disabled
      $w.ep5 configure -state disabled
   }

}








set peakShape(Styles) [list  "Lorentz" "Gauss" "Pseudo-Voigt" \
                            "Baerlocher & Hepp's" ]
set peakShape(DPhase)    0 ; # first phase 
set peakShape(DStyle)    1 ; # Gaussian
set peakShape(DBHnum)    0 ; # assume no baerlocher and Hepps func
set peakShape(Dhwidth)   0.01; #   half width symmetry const bit
set peakShape(Dpsh2)     0. ;# symmetry *tanth  bit
set peakShape(Dpsh3)     0. ;# symmetry *tanth^2  bit
set peakShape(Dpsh4)     0. ;# assymetry const bit
set peakShape(Dpsh5)     0. ;# assymetry tt factor  bit
set peakShape(Dmixing)   0. ;# pseudo mixing parameter  1.0, 0.0 ....

set peakShape(Phases) [list ] ; # an empty list 

#  Actual used values
set peakShape(APhase)    $peakShape(DPhase)    
set peakShape(AStyle)    $peakShape(DStyle)    
set peakShape(ABHnum)    $peakShape(DBHnum)    
set peakShape(Ahwidth)   $peakShape(Dhwidth)   
set peakShape(Apsh2)     $peakShape(Dpsh2)     
set peakShape(Apsh3)     $peakShape(Dpsh3)     
set peakShape(Apsh4)     $peakShape(Dpsh4)     
set peakShape(Apsh5)     $peakShape(Dpsh5)     
set peakShape(Amixing)   $peakShape(Dmixing)   
#  current values displayed
set peakShape(CPhase)    $peakShape(APhase)    
set peakShape(CStyle)    $peakShape(AStyle)    
set peakShape(CBHnum)    $peakShape(ABHnum)    
set peakShape(Chwidth)   $peakShape(Ahwidth)   
set peakShape(Cpsh2)     $peakShape(Apsh2)     
set peakShape(Cpsh3)     $peakShape(Apsh3)     
set peakShape(Cpsh4)     $peakShape(Apsh4)     
set peakShape(Cpsh5)     $peakShape(Apsh5)     
set peakShape(Cmixing)   $peakShape(Amixing)   
#  text entry values
set peakShape(TPhase)    0
set peakShape(Thwidth)   0
set peakShape(Tpsh2)     0
set peakShape(Tpsh3)     0
set peakShape(Tpsh4)     0
set peakShape(Tpsh5)     0
set peakShape(Tmixing)   0



proc PeakShape { } {
   global applyToPhase
   global peakShape

   set old [focus]

   if { [winfo exists .pshape ] } {
      set $w .pshape
      ApplyToPhaseConfig $w init 
      PeakShapeConfig  $w init  
   } else {
      set w [ toplevel .pshape -borderwidth 10 ]
      wm title  $w "Peak Shape"
     
      set a [frame $w.f1 ]
      set b [frame $w.f2  -highlightthickness 1 -highlightbackground Red ]
      set c [frame $w.f3  -highlightthickness 1 -highlightbackground Red ]
      set d [frame $w.f4 ]
      set e [frame $w.f5 ]
      set f [frame $w.f6 ]
      set g [frame $w.f7 ]

      grid  $a -    -sticky w
      grid  $b  $c  -sticky w
      grid  $d  $e  -sticky w
      grid  $f  -   -sticky w
      grid  $g  -   -sticky w

#$a
      label  $w.title -text "Peak Shape Settings for Each Phase" 
      grid $w.title   -in $a


#$b
     entry  $w.phase -text "phase"  -width 20 -relief sunken \
              -state disabled \
              -textvariable peakShape(Tphase)
     grid $w.phase    -in $b -sticky news

#$c
      label  $w.func -text "Shape Function" 
      button $w.method  -relief raised -pady 0 -underline 0 

      grid  $w.func $w.method  -in $c


#$d
     listbox $w.phlist  \
             -xscrollcommand [list $w.xscroll set ] \
             -yscrollcommand [list $w.yscroll set ] 
     scrollbar $w.xscroll -orient horizontal \
              -command [list $w.phlist xview ]
     scrollbar $w.yscroll -orient vertical \
              -command [list $w.phlist yview ]

     grid $w.phlist  $w.yscroll  -in $d -sticky news
     grid $w.xscroll     x       -in $d -sticky news


#$e
      label  $w.lps -text "Symmetric - Half width = 0.5*Sqrt(" 

      label  $w.lp1 -text "Const   u=" 
      entry  $w.ep1   -relief sunken  -width 10 \
                          -textvariable peakShape(Thwidth)
      label  $w.lp2 -text "+ Tan theta   * v=" 
      entry  $w.ep2   -relief sunken  -width 10 \
                          -textvariable peakShape(Tpsh2)
      label  $w.lp3 -text "+ Tan theta^2 * w=" 
      entry  $w.ep3   -relief sunken  -width 10 \
                          -textvariable peakShape(Tpsh3)

      label  $w.lpa -text "Asymmetric" 

      label  $w.lp4 -text " Const " 
      entry  $w.ep4   -relief sunken  -width 10 \
                          -textvariable peakShape(Tpsh4)
      label  $w.lp5 -text "+ tt *" 
      entry  $w.ep5   -relief sunken  -width 10 \
                          -textvariable peakShape(Tpsh5)

      label  $w.lpm -text "Gauss/Lorentz mixing Param" 
      entry  $w.ep6   -relief sunken  -width 10 \
                          -textvariable peakShape(Tmixing)


      grid $w.lps   -      -   -in $e
      grid  x    $w.lp1 $w.ep1 -in $e 
      grid  x    $w.lp2 $w.ep2 -in $e
      grid  x    $w.lp3 $w.ep3 -in $e
      grid $w.lpa   x      x   -in $e
      grid  x    $w.lp4 $w.ep4 -in $e
      grid  x    $w.lp5 $w.ep5 -in $e
      grid   $w.lpm  -  $w.ep6 -in $e


      label  $w.tapply    -text "Apply to:"
      button $w.tapplyto  -relief raised -pady 0 -underline 0 
      grid  $w.tapply    $w.tapplyto -in $f   -sticky w




      button $w.done    -text Done    -pady 2  \
                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
                       -command "PeakShapeConfig $w commit ; PeakShapeUpdate "
      button $w.default -text Default -pady 2 \
                           -command "PeakShapeConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command "focus $old ;destroy $w "

      grid  $w.done $w.apply $w.default $w.cancel -in $g -sticky s

      bind $w.phlist <ButtonRelease-1> \
        "set peakShape(APhase) \[lindex \[ $w.phlist curselection\] 0 \];\
          PeakShapeRefresh "
      bindtags $w.phlist [list Listbox $w.phlist all ]

      BuildPop $w.method  $w.pop1  $peakShape(Styles) peakShape(CStyle)
      bind $w.pop1 <ButtonRelease-1> "PeakShapeConfig $w style "

      BuildPop $w.tapplyto $w.pop2 $applyToPhase(Phase) applyToPhase(CPhase)
      bind $w.pop2 <ButtonRelease-1> "ApplyToPhaseConfig $w graph "

      ApplyToPhaseConfig $w init 
      PeakShapeConfig    $w init  
   }


   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
# effectively modal, but reverting to the main eventloop for processing
# this permits any updates to take effect immediately
}


proc PeakShapeConfig {w mode } {
   global applyToPhase
   global peakShape

   switch -exact -- $mode {
      init {
         #  current values displayed
         set peakShape(CPhase)    $peakShape(APhase)    
         set peakShape(CStyle)    $peakShape(AStyle)    
         set peakShape(CBHnum)    $peakShape(ABHnum)    
         set peakShape(Chwidth)   $peakShape(Ahwidth)   
         set peakShape(Cpsh2)     $peakShape(Apsh2)     
         set peakShape(Cpsh3)     $peakShape(Apsh3)     
         set peakShape(Cpsh4)     $peakShape(Apsh4)     
         set peakShape(Cpsh5)     $peakShape(Apsh5)     
         set peakShape(Cmixing)   $peakShape(Amixing)   

         $w.phlist delete 0 end ;       # delete originals
         eval { $w.phlist insert end } $peakShape(Phases)
      }
      commit {
         set peakShape(Chwidth) [format "%f" [expr $peakShape(Thwidth) * 1.] ]
         set peakShape(Cpsh2)   [format "%f" [expr $peakShape(Tpsh2) * 1.] ]
         set peakShape(Cpsh3)   [format "%f" [expr $peakShape(Tpsh3) * 1.] ]
         set peakShape(Cpsh4)   [format "%f" [expr $peakShape(Tpsh4) * 1.] ]
         set peakShape(Cpsh5)   [format "%f" [expr $peakShape(Tpsh5) * 1.] ]
         set peakShape(Cmixing) [format "%f" [expr $peakShape(Tmixing) * 1.] ]

         set peakShape(APhase)    $peakShape(CPhase)    
         set peakShape(AStyle)    $peakShape(CStyle)    
         set peakShape(ABHnum)    $peakShape(CBHnum)    
         set peakShape(Ahwidth)   $peakShape(Chwidth)   
         set peakShape(Apsh2)     $peakShape(Cpsh2)     
         set peakShape(Apsh3)     $peakShape(Cpsh3)     
         set peakShape(Apsh4)     $peakShape(Cpsh4)     
         set peakShape(Apsh5)     $peakShape(Cpsh5)     
         set peakShape(Amixing)   $peakShape(Cmixing)   

      }
      default {
         set peakShape(CPhase)    $peakShape(DPhase)    
         set peakShape(CStyle)    $peakShape(DStyle)    
         set peakShape(CBHnum)    $peakShape(DBHnum)    
         set peakShape(Chwidth)   $peakShape(Dhwidth)   
         set peakShape(Cpsh2)     $peakShape(Dpsh2)     
         set peakShape(Cpsh3)     $peakShape(Dpsh3)     
         set peakShape(Cpsh4)     $peakShape(Dpsh4)     
         set peakShape(Cpsh5)     $peakShape(Dpsh5)     
         set peakShape(Cmixing)   $peakShape(Dmixing)   
      }
      style {
         $w.ep1 configure -state normal
         $w.ep2 configure -state normal
         $w.ep3 configure -state normal
         $w.ep4 configure -state normal
         $w.ep5 configure -state normal
         if       {$peakShape(CStyle) == 0} { # lorentz
            $w.ep6 configure -state disabled
            set peakShape(Cmixing)   1. 
         } elseif {$peakShape(CStyle) == 1} { # gauss
            $w.ep6 configure -state disabled
            set peakShape(Cmixing)   0. 
         } elseif {$peakShape(CStyle) == 2} { # pseudo voight
            $w.ep6 configure -state normal
            set peakShape(Cmixing)   0.5 
         } elseif {$peakShape(CStyle) == 3} { #  Baerlocher and Hep's
            set peakShape(Thwidth)   0
            set peakShape(Tpsh2)     0
            set peakShape(Tpsh3)     0
            set peakShape(Tpsh4)     0
            set peakShape(Tpsh5)     0
            set peakShape(Tmixing)   0
            $w.ep1 configure -state disabled
            $w.ep2 configure -state disabled
            $w.ep3 configure -state disabled
            $w.ep4 configure -state disabled
            $w.ep5 configure -state disabled
            $w.ep6 configure -state disabled
            # god only knows for the moment ....
         }
      }
   }


   set nmode       [expr int( $peakShape(CStyle) ) ]
   set nval       [lindex $peakShape(Styles) $nmode]
   $w.method  configure -relief raised \
              -text [lindex $peakShape(Styles) $nmode]

   set  peakShape(Tphase) \
       [lindex $peakShape(Phases) $peakShape(CPhase)]


   if       {$peakShape(CStyle) != 3} { # not baerlocher and hepps
      set tmp $peakShape(Chwidth)
      if { abs($tmp) > 999999. }  {
          set peakShape(Thwidth) [ format "%.4e" $tmp ]
      }  else {
          set peakShape(Thwidth) [ format "%.4f" $tmp ]
      }
      set tmp $peakShape(Cpsh2)
      if { abs($tmp) > 999999. }  {
          set peakShape(Tpsh2) [ format "%.4e" $tmp ]
      }  else {
          set peakShape(Tpsh2) [ format "%.4f" $tmp ]
      }
      set tmp $peakShape(Cpsh3)
      if { abs($tmp) > 999999. }  {
          set peakShape(Tpsh3) [ format "%.4e" $tmp ]
      }  else {
          set peakShape(Tpsh3) [ format "%.4f" $tmp ]
      }
      set tmp $peakShape(Cpsh4)
      if { abs($tmp) > 999999. }  {
          set peakShape(Tpsh4) [ format "%.4e" $tmp ]
      }  else {
          set peakShape(Tpsh4) [ format "%.4f" $tmp ]
      }
      set tmp $peakShape(Cpsh5)
      if { abs($tmp) > 999999. }  {
          set peakShape(Tpsh5) [ format "%.4e" $tmp ]
      }  else {
          set peakShape(Tpsh5) [ format "%.4f" $tmp ]
      }

      set tmp $peakShape(Cmixing)
      if { abs($tmp) > 999999. }  {
          set peakShape(Tmixing) [ format "%.4e" $tmp ]
      }  else {
          set peakShape(Tmixing) [ format "%.4f" $tmp ]
      }
   }
}





set scaleFactor(Phases) [list ] ; # an empty list 
set scaleFactor(DPhase)    0
set scaleFactor(DScale)    1.0
set scaleFactor(TPhase)    0
set scaleFactor(TScale)    0
# actual settings
set scaleFactor(APhase)    $scaleFactor(DPhase)    
set scaleFactor(AScale)    $scaleFactor(DScale)    
# current settings
set scaleFactor(CPhase)    $scaleFactor(APhase)    
set scaleFactor(CScale)    $scaleFactor(AScale)    


proc ScaleFactor { } {
   global applyToPhase
   global scaleFactor

   set old [focus]

   if { [winfo exists .scales ] } {
      set $w .scales
      ApplyToPhaseConfig $w init 
      ScaleFactorConfig  $w init  
   } else {
      set w [ toplevel .scales -borderwidth 10 ]
      wm title  $w "Scale Factor Adjustments"
     
      set a [frame $w.f1 ]
      set b [frame $w.f2 ]
      set c [frame $w.f3 ]
      set d [frame $w.f4 ]
      set e [frame $w.f5 ]
      set f [frame $w.f6 ]
      set g [frame $w.f7 ]

      grid  $a -    -sticky w
      grid  $b  $c  -sticky ew
      grid  $d  $e  -sticky nw
      grid  $f  -   -sticky w
      grid  $g  -   -sticky w

#$a
      label  $w.title -text "Adjust phase scale for:" 
      grid $w.title   -in $a


#$b
     entry  $w.phase -width 20 -relief sunken \
              -state disabled \
              -textvariable scaleFactor(TPhase)
     grid $w.phase    -in $b -sticky news

#$c
     label  $w.lscal -text "scale" 
     grid $w.lscal    -in $c -sticky news



#$d
# if its fast enough, we could put an auto updating slider in here ...
     listbox $w.phlist  \
             -xscrollcommand [list $w.xscroll set ] \
             -yscrollcommand [list $w.yscroll set ] 
     scrollbar $w.xscroll -orient horizontal \
              -command [list $w.phlist xview ]
     scrollbar $w.yscroll -orient vertical \
              -command [list $w.phlist yview ]

     grid $w.phlist  $w.yscroll  -in $d -sticky news
     grid $w.xscroll     x       -in $d -sticky news


#$e
     entry  $w.scale -width 12 -relief sunken \
              -textvariable scaleFactor(TScale)
     grid $w.scale  -in $e -sticky nw


#$f
      label  $w.tapply    -text "Apply to:"
      button $w.tapplyto  -relief raised -pady 0 -underline 0 
      grid  $w.tapply    $w.tapplyto -in $f   -sticky w




#$g
      button $w.done    -text Done    -pady 2  \
                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
                     -command "ScaleFactorConfig $w commit ; ScaleFactorUpdate "
      button $w.default -text Default -pady 2 \
                           -command "ScaleFactorConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command "focus $old ;destroy $w "

      grid  $w.done $w.apply $w.default $w.cancel -in $g -sticky s

      bind $w.phlist <ButtonRelease-1> \
        "set scaleFactor(APhase) \[lindex \[ $w.phlist \curselection\] 0 \];\
          ScaleFactorRefresh "
      bindtags $w.phlist [list Listbox $w.phlist all ]

      BuildPop $w.tapplyto $w.pop2 $applyToPhase(Phase) applyToPhase(CPhase)
      bind $w.pop2 <ButtonRelease-1> "ApplyToPhaseConfig $w graph "

      ApplyToPhaseConfig $w init 
      ScaleFactorConfig  $w init  
   }


   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
# effectively modal, but reverting to the main eventloop for processing
# this permits any updates to take effect immediately
}


proc ScaleFactorConfig {w mode } {
   global applyToPhase
   global scaleFactor

   switch -exact -- $mode {
      init {
         #  current values displayed
         set scaleFactor(CPhase)    $scaleFactor(APhase)    
         set scaleFactor(CScale)    $scaleFactor(AScale)    
         $w.phlist delete 0 end ;       # delete originals
         eval { $w.phlist insert end } $scaleFactor(Phases)
      }
      commit {
         set scaleFactor(CScale) [format "%e" [expr $scaleFactor(TScale) * 1.] ]
         set scaleFactor(APhase)    $scaleFactor(CPhase)    
         set scaleFactor(AScale)    $scaleFactor(CScale)    
      }
      default {
         set scaleFactor(CPhase)    $scaleFactor(DPhase)    
         set scaleFactor(CScale)    $scaleFactor(DScale)    
      }
   }


   set  scaleFactor(TPhase) \
       [lindex $scaleFactor(Phases) $scaleFactor(CPhase)]


   set tmp $scaleFactor(CScale)
   if { abs($tmp) > 999999. || abs($tmp) <0.1 }  {
       set scaleFactor(TScale) [ format "%e" $tmp ]
   }  else {
       set scaleFactor(TScale) [ format "%.4f" $tmp ]
   }
}








set overallDisp(Phases) [list ] ; # an empty list 
set overallDisp(DPhase)    0
set overallDisp(DScale)    0.0
set overallDisp(TPhase)    0
set overallDisp(TScale)    0
# actual settings
set overallDisp(APhase)    $overallDisp(DPhase)    
set overallDisp(AScale)    $overallDisp(DScale)    
# current settings
set overallDisp(CPhase)    $overallDisp(APhase)    
set overallDisp(CScale)    $overallDisp(AScale)    


proc OverallDisp { } {
   global applyToPhase
   global overallDisp

   set old [focus]

   if { [winfo exists .ovdisp ] } {
      set $w .ovdisp
      ApplyToPhaseConfig $w init 
      OverallDispConfig  $w init  
   } else {
      set w [ toplevel .ovdisp -borderwidth 10 ]
      wm title  $w "Scale Factor Adjustments"
     
      set a [frame $w.f1 ]
      set b [frame $w.f2 ]
      set c [frame $w.f3 ]
      set d [frame $w.f4 ]
      set e [frame $w.f5 ]
      set f [frame $w.f6 ]
      set g [frame $w.f7 ]

      grid  $a -    -sticky w
      grid  $b  $c  -sticky ew
      grid  $d  $e  -sticky nw
      grid  $f  -   -sticky w
      grid  $g  -   -sticky w

#$a
      label  $w.title -text "Scale Mean Atomic Displacements" 
      grid $w.title   -in $a


#$b
     entry  $w.phase -width 20 -relief sunken \
              -state disabled \
              -textvariable overallDisp(TPhase)
     grid $w.phase    -in $b -sticky news

#$c
     label  $w.lscal -text "Exp\[-Bs^2\]\, B=" 
     grid $w.lscal    -in $c -sticky news



#$d
# if its fast enough, we could put an auto updating slider in here ...
     listbox $w.phlist  \
             -xscrollcommand [list $w.xscroll set ] \
             -yscrollcommand [list $w.yscroll set ] 
     scrollbar $w.xscroll -orient horizontal \
              -command [list $w.phlist xview ]
     scrollbar $w.yscroll -orient vertical \
              -command [list $w.phlist yview ]

     grid $w.phlist  $w.yscroll  -in $d -sticky news
     grid $w.xscroll     x       -in $d -sticky news


#$e
     entry  $w.scale -width 12 -relief sunken \
              -textvariable overallDisp(TScale)
     grid $w.scale  -in $e -sticky nw


#$f
      label  $w.tapply    -text "Apply to:"
      button $w.tapplyto  -relief raised -pady 0 -underline 0 
      grid  $w.tapply    $w.tapplyto -in $f   -sticky w




#$g
      button $w.done    -text Done    -pady 2  \
                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
                     -command "OverallDispConfig $w commit ; OverallDispUpdate "
      button $w.default -text Default -pady 2 \
                           -command "OverallDispConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command "focus $old ;destroy $w "

      grid  $w.done $w.apply $w.default $w.cancel -in $g -sticky s

      bind $w.phlist <ButtonRelease-1> \
        "set overallDisp(APhase) \[lindex \[ $w.phlist \curselection\] 0 \];\
          OverallDispRefresh "
      bindtags $w.phlist [list Listbox $w.phlist all ]


      BuildPop $w.tapplyto $w.pop2 $applyToPhase(Phase) applyToPhase(CPhase)
      bind $w.pop2 <ButtonRelease-1> "ApplyToPhaseConfig $w graph "

      ApplyToPhaseConfig $w init 
      OverallDispConfig  $w init  
   }


   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
# effectively modal, but reverting to the main eventloop for processing
# this permits any updates to take effect immediately
}


proc OverallDispConfig {w mode } {
   global applyToPhase
   global overallDisp

   switch -exact -- $mode {
      init {
         #  current values displayed
         set overallDisp(CPhase)    $overallDisp(APhase)    
         set overallDisp(CScale)    $overallDisp(AScale)    
         $w.phlist delete 0 end ;       # delete originals
         eval { $w.phlist insert end } $overallDisp(Phases)
      }
      commit {
         set overallDisp(CScale) [format "%e" [expr $overallDisp(TScale) * 1.] ]
         set overallDisp(APhase)    $overallDisp(CPhase)    
         set overallDisp(AScale)    $overallDisp(CScale)    
      }
      default {
         set overallDisp(CPhase)    $overallDisp(DPhase)    
         set overallDisp(CScale)    $overallDisp(DScale)    
      }
   }


   set  overallDisp(TPhase) \
       [lindex $overallDisp(Phases) $overallDisp(CPhase)]


   set tmp $overallDisp(CScale)
   if { abs($tmp) > 999999. || abs($tmp) <0.1 }  {
       set overallDisp(TScale) [ format "%e" $tmp ]
   }  else {
       set overallDisp(TScale) [ format "%.4f" $tmp ]
   }
}






set zeroOffset(Styles)  [list None "polynomial" ]
set zeroOffset(Dp1)  0.
set zeroOffset(Dp2)  0.
set zeroOffset(DStyle)  0
#  Actual used values
set zeroOffset(AStyle) $zeroOffset(DStyle)  
set zeroOffset(Ap1)    $zeroOffset(Dp1)  
set zeroOffset(Ap2)    $zeroOffset(Dp2)  
#  current values displayed
set zeroOffset(CStyle) $zeroOffset(AStyle)  
set zeroOffset(Cp1)    $zeroOffset(Ap1)  
set zeroOffset(Cp2)    $zeroOffset(Ap2)  
#  text entry values
set zeroOffset(Tp1)    0
set zeroOffset(Tp2)    0





proc ZeroOffset { } {
   global zeroOffset

   set old [focus]

   if { [winfo exists .zero ] } {
      set $w .zero
      ZeroOffsetConfig  $w init  
   } else {
      set w [ toplevel .zero -borderwidth 10 ]
      wm title  $w "Two Theta Zero Offsets"
     
      set a [frame $w.f1  -highlightthickness 1 -highlightbackground Red ]
      set b [frame $w.f2  -highlightthickness 1 -highlightbackground Red ]
      set c [frame $w.f5 ]

      grid  $a -sticky w
      grid  $b -sticky w
      grid  $c -sticky w

      label  $w.title -text "Zero Offsets: " 



      button $w.method  -relief raised -pady 0 -underline 0 

      grid $w.title  $w.method  -in $a

     
      label  $w.lp0 -text "Polynomial" 

      label  $w.lp1 -text "Const" 
      entry  $w.ep1   -relief sunken  -width 10 \
                          -textvariable zeroOffset(Tp1)
      label  $w.lp2 -text "+ tt   *" 
      entry  $w.ep2   -relief sunken  -width 10 \
                          -textvariable zeroOffset(Tp2)

      grid $w.lp0   x      x   -in $b
      grid  x    $w.lp1 $w.ep1 -in $b 
      grid  x    $w.lp2 $w.ep2 -in $b



      button $w.done    -text Done    -pady 2  \
                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
                       -command "ZeroOffsetConfig $w commit ; ZeroOffsetUpdate "
      button $w.default -text Default -pady 2 \
                           -command "ZeroOffsetConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command "focus $old ;destroy $w "

      grid  $w.done $w.apply $w.default $w.cancel -in $c -sticky s


      BuildPop $w.method  $w.pop1  $zeroOffset(Styles) zeroOffset(CStyle)
      bind $w.pop1 <ButtonRelease-1> "ZeroOffsetConfig $w style "

      ZeroOffsetConfig    $w init  
   }


   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
# effectively modal, but reverting to the main eventloop for processing
# this permits any updates to take effect immediately
}


proc ZeroOffsetConfig {w mode } {
   global zeroOffset

   switch -exact -- $mode {
      init {
         set zeroOffset(CStyle) $zeroOffset(AStyle)  
         set zeroOffset(Cp1)    $zeroOffset(Ap1)  
         set zeroOffset(Cp2)    $zeroOffset(Ap2)  
      }
      commit {
         set zeroOffset(Cp1) [format "%f" [expr $zeroOffset(Tp1) * 1.] ]
         set zeroOffset(Cp2) [format "%f" [expr $zeroOffset(Tp2) * 1.] ]
         set zeroOffset(AStyle) $zeroOffset(CStyle)  
         set zeroOffset(Ap1)    $zeroOffset(Cp1)  
         set zeroOffset(Ap2)    $zeroOffset(Cp2)  
      }
      default {
         set zeroOffset(CStyle) $zeroOffset(DStyle)  
         set zeroOffset(Cp1)    $zeroOffset(Dp1)  
         set zeroOffset(Cp2)    $zeroOffset(Dp2)  
      }
      style {
         if {$zeroOffset(CStyle) != 0 }  {
            $w.ep1 configure -state normal
            $w.ep2 configure -state normal
         } else { 
            $w.ep1 configure -state disabled
            $w.ep2 configure -state disabled
         }
      }
   }


   set nmode       [expr int($zeroOffset(CStyle)) ]
   $w.method  configure -relief raised \
              -text [lindex $zeroOffset(Styles) $nmode]


   set tmp $zeroOffset(Cp1)
   if { abs($tmp) > 999999. }  {
       set zeroOffset(Tp1) [ format "%.4e" $tmp ]
   }  else {
       set zeroOffset(Tp1) [ format "%.4f" $tmp ]
   }
   set tmp $zeroOffset(Cp2)
   if { abs($tmp) > 999999. }  {
       set zeroOffset(Tp2) [ format "%.4e" $tmp ]
   }  else {
       set zeroOffset(Tp2) [ format "%.4f" $tmp ]
   }

}







# initialize arrange blocks
set arrangeBlocks(Styles) [list "literal" "horizontal optim" "vertical optim"]
#                             hopefully an "as specified " one day also ...
set arrangeBlocks(DStyle)  0
set arrangeBlocks(AStyle)  $arrangeBlocks(DStyle)  
set arrangeBlocks(CStyle)  $arrangeBlocks(AStyle)  

set arrangeBlocks(oldfill) 0 
set arrangeBlocks(mode)    ""
set arrangeBlocks(from)    0
set arrangeBlocks(fromid)  0
set arrangeBlocks(nextNum)    1;  # next available block number
# initialize no invoked blocks
for {set i 1} {$i < 10} {incr i} {
   for {set j 1} {$j < 10} {incr j} {
      set arrangeBlocks("D$i,$j") 0 
      set arrangeBlocks("A$i,$j") $arrangeBlocks("D$i,$j") 
      set arrangeBlocks("C$i,$j") $arrangeBlocks("A$i,$j") 
   }
}
# preset the copy-from source
for {set i 1} {$i < 16} {incr i} {
      set arrangeBlocks("F$i") 0
}


proc ArrangeBlocks { } {
   global arrangeBlocks

   if { [winfo exists .arrangeb ] } {
      set $w .arrangeb
      BlockArrangeConfig  $w init  
   } else {
      set w [ toplevel .arrangeb -borderwidth 10 ]

      wm title $w "Arrange Graph Blocks"
      wm iconname $w "cscroll"
      set c $w.c

      label $w.mesg -width 40 -text "" -relief sunken
      pack $w.mesg -side top

      frame $w.grid
      scrollbar $w.hscroll -orient horiz -command "$c xview"
      scrollbar $w.vscroll -command "$c yview"
      canvas $c -relief sunken -borderwidth 2 \
              -scrollregion {0 0 500 500} \
              -xscrollcommand "$w.hscroll set" \
	      -yscrollcommand "$w.vscroll set"
      pack $w.grid -expand yes -fill both -padx 1 -pady 1
      grid rowconfig    $w.grid 0 -weight 1 -minsize 0
      grid columnconfig $w.grid 0 -weight 1 -minsize 0

      grid $c -padx 1 -in $w.grid -pady 1 \
          -row 0 -column 0 -rowspan 1 -columnspan 1 -sticky news
      grid $w.vscroll -in $w.grid -padx 1 -pady 1 \
          -row 0 -column 1 -rowspan 1 -columnspan 1 -sticky news
      grid $w.hscroll -in $w.grid -padx 1 -pady 1 \
          -row 1 -column 0 -rowspan 1 -columnspan 1 -sticky news
      
      frame $w.d
      pack $w.d -side top -fill x -pady 2m
      label  $w.label -text "placement method:" 
      button $w.method  -relief raised -pady 0 -underline 0 
      pack  $w.label $w.method -in $w.d -side left -expand 1

      frame $w.buttons
      pack $w.buttons -side top -fill x -pady 2m
      button $w.buttons.new -text "New"  -command \
           "$w.mesg configure -text \"Select an empty site for new block.\" ;
            set arrangeBlocks(mode) new "
      button $w.buttons.copy -text "Copy"  -command \
           "$w.mesg configure -text \"Select an active block to clone.\" ;
            set arrangeBlocks(mode) copy "
      button $w.buttons.move -text    "Move" -command \
           "$w.mesg configure -text \"Select an active block to move.\" ;
            set arrangeBlocks(mode) move "
      button $w.buttons.delete -text    "Delete" -command \
           "$w.mesg configure -text \"Select an active block to delete.\" ;
            set arrangeBlocks(mode) delete "
      pack  $w.buttons.new $w.buttons.copy $w.buttons.move $w.buttons.delete \
                 -side left -expand 1

      frame $w.a
      pack $w.a -side bottom
      button $w.done    -text Done    -pady 2  \
                           -command "  destroy $w"
#                           -command " focus $old ; destroy $w"
      button $w.apply   -text Apply   -pady 2 \
                    -command "BlockArrangeConfig $w commit; BlockArrangeUpdate "
      button $w.default -text Default -pady 2 \
                           -command "BlockArrangeConfig $w default"
      button $w.cancel  -text Cancel  -pady 2  \
                           -command " destroy $w "
#                           -command "focus $old ;destroy $w "

      grid  $w.done $w.apply $w.default $w.cancel -in $w.a -sticky s

      BuildPop $w.method $w.pop1 $arrangeBlocks(Styles) arrangeBlocks(CStyle)
      bind $w.pop1 <ButtonRelease-1> "BlockArrangeConfig $w style "
      

      set bg [lindex [$c config -bg] 4]
      for {set i 1} {$i < 10} {incr i} {
          set x [expr { 5 + 55*($i - 1) }]
          for {set j 1;set y [expr 500 - 55]} {$j < 10} {incr j; incr y -55} {
      	     $c create rect $x $y [expr $x+50] [expr $y+50] \
      	  	-outline black -fill $bg -tags rect
      	     $c create text [expr $x+25] [expr $y+40] -text "$i,$j" \
      	        -anchor center -tags blockpos
          }
      }

      $c bind all <Any-Enter> "scrollEnter $c"
      $c bind all <Any-Leave> "scrollLeave $c"
      $c bind all <1> "scrollButton $w"
      bind $c <2> "$c scan mark %x %y"
      bind $c <B2-Motion> "$c scan dragto %x %y"


      BlockArrangeConfig  $w init  
   }


   catch {tkwait visibility $w };  # wait for window to become visible
   #  now override any input in any other tk window
   focus $w           ;  # get mouse focus
   catch {grab $w }   ;  # grab the keyboard also
   raise $w          ;   # put it on top
# effectively modal, but reverting to the main eventloop for processing
# this permits any updates to take effect immediately
}


proc GetNextBlockNum { } {
   global arrangeBlocks
   set blist [list ]
   # build a list of used blocks
   for {set i 1} {$i < 10} {incr i} {
      for {set j 1} {$j < 10} {incr j} {
         if { $arrangeBlocks("C$i,$j") !=0 } { 
            lappend blist $arrangeBlocks("C$i,$j") 
         } 
      }
   }
   # scan used blocks for vacancies
   set alist [lsort -increasing $blist ]
   if { [llength $alist] < 1 } {return 1} 
   set prev [lindex $alist 0]
   if {$prev > 1 } {return 1}
   set rval 0
   set len [llength $alist]
   for {set i 1} {$i < $len } {incr i} {
      set curr [lindex $alist $i]
      if { $curr > $prev +1} {
         set rval [expr $prev + 1]
         break
      }
      set prev $curr
   }
   if {$rval == 0} { set rval  [expr [lindex $alist end ] +1] }
   if {$rval <= 16 && $rval > 0 } { return $rval }
   return 0
}


proc scrollEnter canvas {
    global arrangeBlocks
    set id [$canvas find withtag current]
    set tags [$canvas gettags current] 

    if {[lsearch $tags rect] < 0} { # its not a blockpos x,y item
       if {[lsearch $tags blockpos] >= 0} { # its a rect item
	   set id [expr $id-1] ;        # so get next x,y item
       } else {                         # it must be an active/blk num item
           set id [expr [string trimleft \
                   [lindex $tags [lsearch -glob $tags "id*" ] ] id  ] -1 ]
       }
    }
    
    set arrangeBlocks(oldFill) [lindex [$canvas itemconfig $id -fill] 4]
    if {[winfo depth $canvas] > 1} {
	$canvas itemconfigure $id -fill SeaGreen1
    } else {
	$canvas itemconfigure $id -fill black
	$canvas itemconfigure [expr $id+1] -fill white
    }
}

proc scrollLeave canvas {
    global arrangeBlocks
    set id [$canvas find withtag current]
    set tags [$canvas gettags current] 
    if {[lsearch $tags rect] < 0} { # its not a blockpos x,y item
       if {[lsearch $tags blockpos] >= 0} { # its a rect item
	   set id [expr $id-1] ;        # so get next x,y item
       } else {                         # it must be an active/blk num item
           set id [expr [string trimleft \
                   [lindex $tags [lsearch -glob $tags "id*" ] ] id  ] -1 ]
       }
    }

    $canvas itemconfigure $id -fill $arrangeBlocks(oldFill)
    $canvas itemconfigure [expr $id+1] -fill black
}

proc scrollButton w {
    global arrangeBlocks
    set canvas $w.c
    set bg [lindex [$canvas config -bg] 4]
    set id [$canvas find withtag current] ; # require the blockpos x,y text id
    set tags [$canvas gettags current] 
    if {[lsearch $tags blockpos] < 0} { # its not a blockpos x,y item
       if {[lsearch $tags rect] >= 0} { # its a rect item
	   set id [expr $id+1] ;        # so get next x,y item
       } else {                         # it must be an active/blk num item
           set id [string trimleft \
                   [lindex $tags [lsearch -glob $tags "id*" ] ] id  ]
       }
    }

    set ref [lindex [$canvas itemconf $id -text] 4]
    set nextNum  [GetNextBlockNum ]

    if       {[string match $arrangeBlocks(mode) "new"] } {
       if { $arrangeBlocks("C$ref") != 0 } {
           $w.mesg configure -text "That block is already in use."
       } else {
          BlockArrangeCreate $canvas $id $nextNum
          set arrangeBlocks(oldFill) red
          set arrangeBlocks("C$ref") $nextNum
          set arrangeBlocks("F$nextNum") 0 ;# coppied from nowhere
          $w.mesg configure -text "New block number $nextNum at $ref"
       }

    } elseif {[string match $arrangeBlocks(mode) "copy"] } {
       if { $arrangeBlocks(from) == 0 } {      # get the source 
          if { $arrangeBlocks("C$ref") == 0 } {
             $w.mesg configure -text "That block is not in use."
          } else {
              $canvas itemconfigure [expr $id -1] -fill cyan
              set arrangeBlocks(oldFill) cyan
              set arrangeBlocks(from) $arrangeBlocks("C$ref") ;# source block
              set arrangeBlocks(fromid) $id
             $w.mesg configure -text \
                         "Cloning block $arrangeBlocks(from) from $ref"
          }
       } else {                                  # get the destination
          if { $arrangeBlocks("C$ref") == 0 } {
             $canvas itemconfigure [expr $id -1] -fill red
             BlockArrangeCreate $canvas $id $nextNum
             set arrangeBlocks(oldFill) red
             $canvas itemconfigure [expr $arrangeBlocks(fromid) -1] -fill red
             set src $arrangeBlocks(from) ;# initilize
             while {$arrangeBlocks("F$src")!=0 } { # find the true source
               set src [$arrangeBlocks(F$src)] ; # if recursive froms
             }
             set arrangeBlocks("F$nextNum") $src
             set arrangeBlocks("C$ref") $nextNum
             set arrangeBlocks(from)  0
             set arrangeBlocks(fromid)  0
             $w.mesg configure -text "Select new copy source." 
          } else {
             $w.mesg configure -text "That block is already in use."
          }
       }

    } elseif {[string match $arrangeBlocks(mode) "move"] } {
       if { $arrangeBlocks(from) == 0 } {      # get the source 
          if { $arrangeBlocks("C$ref") == 0 } {
             $w.mesg configure -text "That block is not in use."
          } else {
              $canvas itemconfigure [expr $id -1] -fill blue
              set arrangeBlocks(oldFill) blue
              set arrangeBlocks(from) $arrangeBlocks("C$ref") ;# source block
              set arrangeBlocks(fromid) $id
             $w.mesg configure -text \
                         "Moving block $arrangeBlocks(from) from $ref"
          }
       } else {                                  # get the destination
          if { $arrangeBlocks("C$ref") == 0 } {
             $canvas itemconfigure [expr $id -1] -fill red
             set arrangeBlocks("C$ref") $arrangeBlocks(from)
             BlockArrangeDelete $canvas $arrangeBlocks(fromid)
             BlockArrangeCreate $canvas $id $arrangeBlocks(from)
             set arrangeBlocks(oldFill) red
             $canvas itemconfigure [expr $arrangeBlocks(fromid) -1] -fill $bg
             set ref1 [lindex [$canvas itemconf $arrangeBlocks(fromid) -text] 4]
             set arrangeBlocks("C$ref1") 0 
             set arrangeBlocks(from)  0
             set arrangeBlocks(fromid)  0
             $w.mesg configure -text "Select an active block to move." 
          } else {
             $w.mesg configure -text "That block is already in use."
          }
       }

    } elseif {[string match $arrangeBlocks(mode) "delete" ] } {
       if { $arrangeBlocks("C$ref") == 0 } {
           $w.mesg configure -text "That block was not in use."
       } else {
          BlockArrangeDelete $canvas $id 
          $w.mesg configure -text \
              "Block $arrangeBlocks("C$ref") deleted at $ref"
          set arrangeBlocks(oldFill) $bg
          set blk $arrangeBlocks("C$ref")
          set arrangeBlocks("F$blk")  0
          set arrangeBlocks("C$ref")  0
       }
    }
}

proc BlockArrangeDelete {canvas id } {
   set bg [lindex [$canvas config -bg] 4]
   $canvas itemconfigure [expr $id -1] -fill $bg ; # reset background
   set tags [ $canvas gettags $id]              ; # get linked tags
   foreach tag $tags { 
      if [string match "blk*" $tag ] {
         $canvas dtag $id $tag ;          # remove block tag from x,y text
         $canvas dtag [expr $id -1] $tag ;# ditto for the rect
         $canvas delete $tag ;            # remove active and block tags
         break
      } 
   }
}

proc BlockArrangeCreate {canvas id num} {
   set z [$canvas coords $id ]
   set x [lindex $z 0] ;
   set y [lindex $z 1] ;
   $canvas itemconfigure [expr $id -1] -fill red
   $canvas create text [expr $x] [expr $y-30] \
             -text "active" -anchor center -tag blk$num  
   $canvas create text [expr $x] [expr $y-15] \
             -text $num -anchor center -tags blk$num 
   $canvas addtag "id$id" withtag blk$num  ;         # add pointer to x,y id
   $canvas addtag blk$num withtag $id
   $canvas addtag blk$num withtag [expr $id -1]
}


proc BlockArrangeConfig {w mode } {
   global arrangeBlocks

   switch -exact -- $mode {
      init {
         set arrangeBlocks(CStyle)    $arrangeBlocks(AStyle)    
         for {set i 1} {$i < 10} {incr i} {
            for {set j 1} {$j < 10} {incr j} {
               set id [expr 2*(($i-1)*9 +$j)  ]
               BlockArrangeDelete $w.c $id     ;# predelete any remnants
               set arrangeBlocks("C$i,$j") $arrangeBlocks("A$i,$j") 
               if { $arrangeBlocks("C$i,$j") != 0 } {
                  BlockArrangeCreate $w.c  $id  $arrangeBlocks("C$i,$j")
               }
            }
         }
         # reset the copy-from source
         for {set i 1} {$i < 16} {incr i} {
            set arrangeBlocks("F$i") 0
         }
      }
      commit {
         set arrangeBlocks(AStyle)    $arrangeBlocks(CStyle)    
         for {set i 1} {$i < 10} {incr i} {
            for {set j 1} {$j < 10} {incr j} {
               set arrangeBlocks("A$i,$j") $arrangeBlocks("C$i,$j") 
            }
         }
      }
      default {
         set arrangeBlocks(CStyle)    $arrangeBlocks(DStyle)    
         for {set i 1} {$i < 10} {incr i} {
            for {set j 1} {$j < 10} {incr j} {
               set arrangeBlocks("C$i,$j") $arrangeBlocks("D$i,$j") 
            }
         }
      }
      style {
      }
   }


   set nmode       [expr int($arrangeBlocks(CStyle)) ]
   $w.method  configure -relief raised \
              -text [lindex $arrangeBlocks(Styles) $nmode]

}




MainWin       ;# invoke main window specs
# now return to the Fortran code which sourced this file
