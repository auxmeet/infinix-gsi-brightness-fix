#!/system/bin/sh

MODID=gsi-brightness-fix
AUTOMOUNT=true
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false  

REPLACE="
"

print_modname() {
  ui_print " "
  ui_print "========================="
  ui_print "= Fix brightness on GSI ="
  ui_print "========================="
  ui_print "This module maded by @auxmeet"
  ui_print "Also thanks to @ironemenero"
  ui_print " "
}

on_install() {
  ui_print "- Extracting module files..."
}

set_permissions() {
  set_perm_recursive  $MODPATH  0  0  0755  0644
}
