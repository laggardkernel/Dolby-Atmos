##########################################################################################
#
# Magisk
# by topjohnwu
#
# This is a template zip for developers
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder
# 2. Fill in all sections in this file
# 3. For advanced features, add commands into the script files under common:
#    post-fs.sh, post-fs-data.sh, service.sh
# 4. Change the "module.prop" under common with the info of your module
#
##########################################################################################
##########################################################################################
#
# Limitations:
# 1. Can not place any new items under /system root!! e.g. /system/newfile, /system/newdir
#    Magisk will delete these items at boot.
#
##########################################################################################

##########################################################################################
# Defines
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

# This will be the folder name under /magisk or /cache/magisk
# This should also be the same as the id in your module.prop to prevent confusion
MODID=template

# Set to true if you need automount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=false

# Set to true if you need custom setprop script
PROPFILE=true
# personal file's name located anywhere on your internal storage
# buildname="custom_build.prop"
buildname="system.prop"
tweakname="tweak.prop"

VERSION="v1.0.0"
REVISION="0.1"
# APKNAME=*.apk
# PACKAGENAME=*.*.*

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "*******************************"
  ui_print "     Magisk Module Template    "
  ui_print " "
  ui_print "             $VERSION"
  ui_print "*******************************"
  ui_print "  Magisk MOD by laggardkernel  "
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# By default Magisk will merge your files with the original system
# Directories listed here however, will be directly mounted to the correspond directory in the system

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"
# Removal list from theme ready
TESTREMOVAL="
/system/app/GoogleLatinIME
/system/priv-app/GoogleLatinIme
/system/app/GoogleLatinIme
/system/priv-app/GoogleLatinime
/system/app/GoogleLatinime
/system/priv-app/GoogleIMELatin
/system/app/GoogleIMELatin
/system/priv-app/GoogleImeLatin
/system/app/GoogleImeLatin
/system/priv-app/GoogleimeLatin
/system/app/GoogleimeLatin
/system/priv-app/LatinIMEGoogle
/system/app/LatinIMEGoogle
/system/priv-app/LatinImeGoogle
/system/app/LatinImeGoogle
/system/priv-app/LatinimeGoogle
/system/app/LatinimeGoogle
/system/app/Gboard
/system/priv-app/Gboard
/system/app/Gmail2
/system/app/gmail2
/system/app/PrebuiltGmail
/system/priv-app/velvet
/system/app/velvet
/system/app/Velvet
/system/priv-app/googleapp
/system/app/Googleapp
/system/app/GoogleApp
/system/priv-app/Googleapp
/system/priv-app/GoogleApp
/system/priv-app/Velvet
/system/priv-app/GoogleContacts
/data/app/com.google.android.contacts
/data/app/com.google.android.contacts-1
/data/app/com.google.android.contacts-2
/system/priv-app/GoogleDialer
/data/app/com.google.android.dialer
/data/app/com.google.android.dialer-1
/data/app/com.google.android.dialer-2
/system/priv-app/Hangout
/system/priv-app/Hangouts
/system/priv-app/hangout
/system/priv-app/hangouts
/system/app/Hangouts
/system/app/photos
/system/app/googlephotos
/system/app/GooglePhotos
/system/app/Photos
/system/app/youtube
/system/app/Youtube
/system/app/YouTube
"

TESTREMOVAL=""

##########################################################################################
# Permissons
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644

  if [ -d "$MODPATH$SYS/bin" ]; then
    set_perm_recursive  $MODPATH/system/bin  0  2000  0755  0755
  fi

  # bin_mount binaries to /system/bin is broken, do it manually
  # if [ -d "$MODPATH/system/bin" ]; then
  #   ui_print "- Changing bin binaries mount method as manual"
  #   mv -f "$MODPATH/system/bin" "$MODPATH/bin"
  #   set_perm_recursive  $MODPATH/bin  0  2000  0755  0755
  #   # Touch an empty "enable" file as switch
  #   mkdir -p $MODPATH/bin_bind
  #   touch $MODPATH/bin_bind/enable
  # fi

  if [ -d "$MODPATH$SYS/xbin" ]; then
    set_perm_recursive  $MODPATH$SYS/xbin  0  2000  0755  0755
  fi

  if [ -f "$MODPATH$SYS/vendor" ]; then
    set_separate_perm_recursive $MODPATH$SYS/vendor 0 2000 0 0 0755 0644
    if [ -f "$MODPATH$SYS/vendor/bin" ]; then
      set_perm_recursive $MODPATH$SYS/vendor/bin 0 2000 0755 0755
    fi
  fi

  # Only some special files require specific permission settings
  # The default permissions should be good enough for most cases

  # Some templates if you have no idea what to do:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644
}
