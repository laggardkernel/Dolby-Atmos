# Lenovo K3 Dolby Atmos

![Dolby Atmos](https://s13.postimg.org/eq742bjv9/Logo_Dolby_Atmos_svg.png?dl=1)

**Disclaim: This is a personal experiment on Magisk, adapted from ahrion's Collective Dolby Atmos Port Thread [MM+]. No interest for distribution**

### Intro

This is the Dolby Atmos sound effect ported from a Lenovo rom. This should work on all devices (starting from Android 4.3) since it is a software effect. It might conflict with other dolby effects you already installed. Flash the zip, it will edit (not overwrite) your audio_effects.conf.

### BQ Aquaris X5 Atmos <v1.1.4>

##### Download

- Download: [R6.5](http://forum.xda-developers.com/devdb/project/dl/?id=13100)
- Download: [R6.5.1 uninstall](http://forum.xda-developers.com/devdb/project/dl/?id=13553)
- deep_buffer remover: [Download](http://forum.xda-developers.com/devdb/project/dl/?id=13950)

**r6.5**:

- Fixed permissions
- Fixed issue with audio_effects.conf on some devices
- Fixed removal of As*

##### Previous Changelogs (Lenovo K3 Dolby Atmos):

**R6.3**

- Added permissions in installer script

**R6.2**

- Patch both /system/etc/audio_effects.conf AND /system/vendor/etc/audio_effects.conf to bypass those badly implemented audio mods that blindly overwrite audio_effects.conf or put an unused audio_effects.conf in /system/vendor/etc.

**R6.1**

- Renamed namespace
- Renamed Ds/DsUI to As/AsUI
- Start from a clean rom (dirty flash) when installing this since it will not cleanup the previous version !

**R5**

- Removed demo video, size reduced to 3 mb

**R4**

- Fixed compatibility for Android 4.x in Ds.apk and DsUI.apk
- Changed uuid and name of the library so it doesnt conflict with other dolby libraries (Ds and DsUI still do but will be overwritten)

**R1**

- Initial release

![Dolby Atmos app Interface 1](http://forum.xda-developers.com/attachment.php?attachmentid=3314480&d=1431711136) ![Dolby Atmos app Interface 1](http://forum.xda-developers.com/attachment.php?attachmentid=3317806&d=1431888014)


#### XDA:DevDB Information

**Dolby ATMOS, App for all devices (see above for details)**

##### Contributors

[worstenbrood](http://forum.xda-developers.com/member.php?u=981278), [ahrion](http://forum.xda-developers.com/member.php?u=5357345), [aki_007](http://forum.xda-developers.com/member.php?u=5648292)

##### Version Information

```
Status: Stable
Current Stable Version: R6.5
Stable Release Date: 2015-06-20

Created 2015-05-15
Last Updated 2016-10-05
```

### Magisk Port Features

1. deep_buffer and raw removal for more compatibility;
2. Fix /system/vendor/etc/audio_effects.conf for OnePlus3 ROMs;
3. Set props by resetprop, introduced in Magisk v9;

### Support Link

- [[MOD][ARM][4.3+] Dolby ATMOS](http://forum.xda-developers.com/android/apps-games/mod-dolby-atmos-t3109446)

### Credit
- Orignially ported by [worstenbrood@XDA](http://forum.xda-developers.com/member.php?u=981278)
- [ahrion](http://forum.xda-developers.com/member.php?u=5357345) and [aki_007](http://forum.xda-developers.com/member.php?u=5648292) for supplying the rom
- Magisk module by [laggardkernel@Github](https://github.com/laggardkernel)
