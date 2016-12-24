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
buildname="custom_build.prop"
tweakname="tweak.prop"

VERSION="v1.0.0"
REVISION="0.1"
# APKNAME=*.apk
# PACKAGENAME=*.*.*

# FILE LOCATIONS
CONFIG_FILE=/system/etc/audio_effects.conf
VENDOR_CONFIG=/system/vendor/etc/audio_effects.conf
HTC_CONFIG_FILE=/system/etc/htc_audio_effects.conf
OTHER_VENDOR_FILE=/system/etc/audio_effects_vendor.conf
#OFFLOAD_CONFIG=/system/vendor/etc/audio_effects_offload.conf
OFFLOAD_CONFIG=/system/vendor/etc/audio_offload_effects.conf
HTC_VENDOR=/vendor/etc/audio_effects.conf

REMOVAL="
"

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

##########################################################################################
# Package installation
##########################################################################################

install_package() {
  # Install Android package $APKNAME $PACKAGENAME
  if [ -f "$MODPATH/system/app/${1%.apk}/$1" ]; then
    ui_print "- Installing ${1%.apk} as system app"
    rm -rf /data/app/${2}-*
    rm -rf /data/data/${2}
  
  elif [ -f "$MODPATH/system/priv-app/${1%.apk}/$1" ]; then
    ui_print "- Installing ${1%.apk} as system priv-app"
    rm -rf /data/app/${2}-*
    rm -rf /data/data/${2}
  
  elif [ -f "$INSTALLER/$1" ]; then
    if [ -z `ls /data/app | grep "$2"-` ]; then
      ui_print "- Installing ${1%.apk} as data app"
      cp -af $INSTALLER/$1 /data/$1
      APKPATH="$2"-1
      for i in `ls /data/app | grep "$2"-`; do
        if [ `cat /data/system/packages.xml | grep $i >/dev/null 2>&1; echo $?` -eq 0 ]; then
          APKPATH=$i
          break;
        fi
      done
      rm -rf /data/app/"$2"-*
      ui_print "  target path: /data/app/$APKPATH"
      mkdir /data/app/$APKPATH
      chown 1000.1000 /data/app/$APKPATH
      chmod 0755 /data/app/$APKPATH
      chcon u:object_r:apk_data_file:s0 /data/app/$APKPATH
      cp /data/$1 /data/app/$APKPATH/base.apk
      chown 1000.1000 /data/app/$APKPATH/base.apk
      chmod 0644 /data/app/$APKPATH/base.apk
      chcon u:object_r:apk_data_file:s0 /data/app/$APKPATH/base.apk
      rm /data/$1
    else
      ui_print "- ${1%.apk} already exists on the device"
    fi
  
  else
    ui_print "- ${1%.apk} is not included, install it later by yourself"
    
  fi
}

##########################################################################################
# Permissons
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644

  # if [ -d "$MODPATH/system/bin" ]; then
  #   set_perm_recursive  $MODPATH/system/bin  0  2000  0755  0755
  # fi

  # bin_mount binaries to /system/bin is broken, do it manually
  if [ -d "$MODPATH/system/bin" ]; then
    ui_print "- Changing bin binaries mount method as manual"
    mv -f "$MODPATH/system/bin" "$MODPATH/bin"
    set_perm_recursive  $MODPATH/bin  0  2000  0755  0755
    # Touch an empty "enable" file as switch
    mkdir -p $MODPATH/bin_bind
    touch $MODPATH/bin_bind/enable
  fi

  if [ -d "$MODPATH/system/xbin" ]; then
    set_perm_recursive  $MODPATH/system/xbin  0  2000  0755  0755
  fi

  if [ -d "$MODPATH/system/vendor/lib" ]; then
    set_perm_recursive  $MODPATH/system/vendor/lib  0  2000  0755  0644
  fi

  if [ -d "$MODPATH/system/vendor/lib64" ]; then
    set_perm_recursive  $MODPATH/system/vendor/lib64  0  2000  0755  0644
  fi

  if [ -d "$MODPATH/system/vendor/etc" ]; then
    set_perm_recursive  $MODPATH/system/vendor/etc  0  2000  0755  0644
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
