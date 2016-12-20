# Bin_bind Demo

### Intro

A simple demo for bind_mount binaries to /system/bin manually in Magisk. The reason for the exsitence of this demo is that, Magisk v9 fails to mount binaries to /system/bin and causes boot stuck. For any developer who really need bind_mount binaries, the trick here will be your temporary remedy.

**NOTE**: bind_mount binaries to /system/xbin with auto_mount switch works well. No remedy needed.

### Detail

update-binary is untouched. Modifications happened in `config.sh` and `post-fs-data.sh`. Use service.sh could get the work done as well. 

1. bin binaries are moved from `MODDIR/system/bin` as `MODDIR/bin` during `set_permissions` in `config.sh`, and an empty `enable` is touched as the switch in `$MODDIR/bin_bind`. Once the switch is deleted, bind_mount binaries to /system/bin stops. This helps bind_mount your binaries on demand. 
2. In `post-fs-data`, all exsiting binaries in your device will be copied to `$MODDIR/bin_bind`, then your custom binaries in `MODDIR/bin` will be symlink-ed here as well. 
3. At last, we mount `$MODDIR/bin_bind` back to `/system/bin`. 

Done.

### Credit
- manual bind_mount idea from [topjhonwu](https://github.com/topjohnwu)'s [phh-superuser](https://github.com/Magisk-Modules-Repo/phh-superuser) 
- [demo](https://github.com/laggardkernel/magisk-module-template/tree/bin_bind_demo) made by [laggardkernel @XDA](http://forum.xda-developers.com/member.php?u=7897801)
