#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
LOGFILE=/cache/magisk.log
MODDIR=${0%/*}

# MOUNTPOINT=/magisk

# COREDIR=$MOUNTPOINT/.core

# TMPDIR=/dev/magisk
# DUMMDIR=$TMPDIR/dummy
# MIRRDIR=$TMPDIR/mirror
# MOUNTINFO=$TMPDIR/mnt

# Use the included busybox for maximum compatibility and reliable results
# e.g. we rely on the option "-c" for cp (reserve contexts), and -exec for find
TOOLPATH=/data/busybox
# BINPATH=/data/magisk

# export OLDPATH=$PATH
# export PATH=$TOOLPATH:$OLDPATH

log_print() {
  echo $1
  echo "bin_bind: $1" >> $LOGFILE
  log -p i -t bin_bind "$1"
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
