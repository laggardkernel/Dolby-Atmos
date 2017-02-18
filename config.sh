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
MODID=dap

# Set to true if you need automount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need post-fs-data script
POSTFSDATA=true

# Set to true if you need late_start service script
LATESTARTSERVICE=true

# Set to true if you need custom setprop script
PROPFILE=true
# personal file's name located anywhere on your internal storage
buildname="custom_build.prop"
tweakname="tweak.prop"

# Custom variables
VERSION="v1.1.4"
REV="r6.5"
#APP1="As"
#APP2="AsUI"
#TMPDIR="dap"
#SYSTEM="system"
#SYSTEMLESS="systemless"

# FILE LOCATIONS
CONFIG_FILE=/system/etc/audio_effects.conf
VENDOR_CONFIG=/system/vendor/etc/audio_effects.conf
HTC_CONFIG_FILE=/system/etc/htc_audio_effects.conf
OTHER_VENDOR_FILE=/system/etc/audio_effects_vendor.conf
#OFFLOAD_CONFIG=/system/vendor/etc/audio_effects_offload.conf
OFFLOAD_CONFIG=/system/vendor/etc/audio_offload_effects.conf
HTC_VENDOR=/vendor/etc/audio_effects.conf

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "*******************************"
  ui_print "     Lenovo K3 Dolby ATMOS     "
  ui_print "           $VERSION            "
  ui_print "     selinux enforcing fix     "
  ui_print "        Universal - Mod        "
  ui_print "        Revision $REV          "
  ui_print "        by worstenbrood        "
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

##########################################################################################
# Permissons
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644

  if [ -f "$MODPATH/system/bin" ]; then
    set_perm_recursive  $MODPATH/system/bin  0  2000  0755  0755
  fi

  if [ -f "$MODPATH/system/xbin" ]; then
    set_perm_recursive  $MODPATH/system/xbin  0  2000  0755  0755
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
