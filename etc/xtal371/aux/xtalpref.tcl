#
#       Copyright (C) 2000, The Xtal System, The University of
#             Western Australia, xtal@crystal.uwa.edu.au.
#  Distributed under the GNU General Public Licence as published by
#  the Free Software Foundation, in the hope that it will be useful
#  but WITHOUT ANY WARRANTY. See the GNU General Public License
#  for more details.
#
# xtalpref.tcl: Read and initialize Xtal global and per user preferences.
#
# This file is sourced from within Xtal3.7
# User customization is possible by copying the xtalrc file
# to ~/.xtalrc with optional display specific extensions
# such as: ~/.xtalrc-galah

# location of the xtal resource database
set xtaldef [file join $XTALHOME xtalrc]

#
proc Pref_Init { appDefaults userDefaults } {
   global xtalPrefs
   global env

   set xtalPrefs(uid) 0;# for a unique identifier for widgets
   set xtalPrefs(userDefaults) $userDefaults
   set xtalPrefs(appDefaults)  $appDefaults
   set xtalPrefs(hostname)     [info hostname]
#  could look at $tcl_platform(platform) = unix,macintosh or windows
   if {[info exists env(DISPLAY) ] } { 
       scan $env(DISPLAY) {%[^\.:]} xtalPrefs(display)  
       if { ! [info exists xtalPrefs(display) ] } { 
            set xtalPrefs(display) "" 
       }
   } else { set xtalPrefs(display) "" }
   PrefReadFile $appDefaults  startup
   PrefReadFile $userDefaults user
}

proc PrefReadFile { basename level } {
   global xtalPrefs

   if [file exists $basename] {
      if [catch {option readfile $basename $level} err] {
          Status "Error in $basename: $err"
      }
   }
   
   # look for display host specific defaults file
   if {[string compare $xtalPrefs(display) "" ] !=0 } {
      set extpref  $basename-$xtalPrefs(display)
      if [file exists $extpref]  {
          if [catch {option readfile $extpref $level} err] {
               Status "Error in $extpref: $err"
          }
      }
   } elseif {[string compare $xtalPrefs(hostname) ""] !=0 } {
      set extpref  $basename-$xtalPrefs(hostname)
      if [file exists $extpref]  {
          if [catch {option readfile $extpref $level} err] {
               Status "Error in $extpref: $err"
          }
      }
   }
   
   if {[string match *color* [winfo visual .]]} {
      if [file exists $basename-color] {
          if [catch {option readfile $basename-color $level} err] {
               Status "Error in $basename-color: $err"
          }
      }
   } else  {
      if [file exists $basename-mono] {
          if [catch {option readfile $basename-mono $level} err] {
               Status "Error in $basename-mono: $err"
          }
      }
   }
}

proc Status {s } { puts stderr $s }
 
Pref_Init  $xtaldef  ~/.xtalrc ;# always load the system defaults!

