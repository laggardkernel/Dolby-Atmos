#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
LOGFILE=/cache/magisk.log
MODNAME=${MODDIR#/magisk/}

MODE="post-fs-data"
APKNAME=*.apk
PACKAGENAME=*.*.*
REBOOT=false

# Use the included busybox for maximum compatibility and reliable results
# e.g. we rely on the option "-c" for cp (reserve contexts), and -exec for find
TOOLPATH=/data/busybox
# BINPATH=/data/magisk

log_print() {
  echo "$MODNAME: $1"
  echo "$MODNAME: $1" >> $LOGFILE
  log -p i -t "$MODNAME" "$1"
}

bind_mount() {
  if [ -e "$1" -a -e "$2" ]; then
    mount -o bind $1 $2
    if [ "$?" -eq "0" ]; then
      log_print "Mount: $1"
    else
      log_print "Mount Fail: $1"
    fi
  fi
}

install_package() {
  # Install Android package $APKNAME $PACKAGENAME
  if [ -f "/cache/$1" ]; then
    cp /cache/$1 /data/$1
    rm /cache/$1
  fi

  if [ -f "/data/$1" ]; then
    log_print "installing $1 in /data"
    APKPATH="$2"-1
    for i in `ls /data/app | grep "$2"-`; do
      if [ `cat /data/system/packages.xml | grep $i >/dev/null 2>&1; echo $?` -eq 0 ]; then
        APKPATH=$i
        break;
      fi
    done
    rm -rf /data/app/"$2"-*
    log_print "target path: /data/app/$APKPATH"
    mkdir /data/app/$APKPATH
    chown 1000.1000 /data/app/$APKPATH
    chmod 0755 /data/app/$APKPATH
    chcon u:object_r:apk_data_file:s0 /data/app/$APKPATH
    cp /data/$1 /data/app/$APKPATH/base.apk
    chown 1000.1000 /data/app/$APKPATH/base.apk
    chmod 0644 /data/app/$APKPATH/base.apk
    chcon u:object_r:apk_data_file:s0 /data/app/$APKPATH/base.apk
    rm /data/$1
    sync
    # just in case
    REBOOT=true
  fi
}

install_package "$APKNAME" "$PACKAGENAME"

# sometimes we need to reboot, make it so
if ($REBOOT); then
  log_print "rebooting"
  if [ "$MODE" = "post-fs-data" ]; then
    # avoid device freeze (reason unknown)
    sh -c "sleep 5; reboot" &
  else
    reboot
  fi
  exit
fi

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# if other su binaries exist, route them to ours
# mount -o bind $MODDIR/bin/su /sbin/su 2>/dev/null
# mount -o bind $MODDIR/bin/su /system/bin/su 2>/dev/null
# mount -o bind $MODDIR/bin/su /system/xbin/su 2>/dev/null

# bind_mount bin files to /system/bin manually
if [ -f "$MODDIR/bin_bind/enable" ]; then
  log_print "Binding binaries to bin"
  rm -rf "$MODDIR/bin_bind"
  mkdir -p "$MODDIR/bin_bind"
  touch "$MODDIR/bin_bind/enable"
  $TOOLPATH/cp -afc /system/bin/. $MODDIR/bin_bind
  # In case that you're bind_mounting your own su, uncomment below
  # rm -rf $MODDIR/bin_bind/su $MODDIR/bin_bind/sepolicy-inject 2>/dev/null
  chmod -R 755 $MODDIR/bin_bind
  chcon -hR "u:object_r:system_file:s0" $MODDIR/bin_bind
  ln -s $MODDIR/bin/* $MODDIR/bin_bind 2>/dev/null
  bind_mount $MODDIR/bin_bind /system/bin
fi

if [ -d "${MODDIR}/system/priv-app/Ax" ] || [ -d "${MODDIR}/system/priv-app/AxUI" ]; then
  log_print "Set SELinux permissive"
  setenforce 0
else
  log_print "SELinux Injection"
  # For Magisk v9
  /data/magisk/sepolicy-inject --live -s mediaserver -t mediaserver_tmpfs -c file -p read,write,execute
  /data/magisk/sepolicy-inject --live -s audioserver -t audioserver_tmpfs -c file -p read,write,execute
  # Preparation for Magisk v11+ with the new MagiskSU and its sepolicy
  # /data/magisk/sepolicy-inject --live "allow mediaserver mediaserver_tmpfs file { read write execute }" \
  # "allow audioserver audioserver_tmpfs file { read write execute }"

fi
