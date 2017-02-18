**NOTE**: ONLY AVAILABLE FOR MAGISK V9

# LeEco LePro 3 Atmos

![Dolby Atmos](https://s13.postimg.org/eq742bjv9/Logo_Dolby_Atmos_svg.png?dl=1)

**Disclaimer: This is a personal experiment on Magisk, adapted from ahrion's Collective Dolby Atmos Port Thread [JB-N+][MAJOR UPDATE: 02/12/2017]. No interest for distribution**

### Intro

This is the Dolby Atmos ported from LeTv, BQ, and ZTE phone's stock Marshmallow ROM. This should work on all devices (starting from Marshmallow) since it is a software effect. It might conflict with other effects you've already installed. However, it has been extensively tested working alongside ViPER4Android, Maxxaudio, and HTC M9/10 Dolby on several ROM/device combinations. Flash the zip, it will edit and patch (not overwrite) your audio_effects.conf. Currently selinux permissive is recommended.

I understand the UI looks like the old Dolby Digital Plus, but I can assure you that it is much much better. This Atmos is a much more updated version than ones previously released on the Lenovo K3/K4 Note. The Axon 7 Dolby Atmos utilizes both software and hardware components of your device, which means it processes in a much more powerful manner with much more precision and quality and a more natural soundscape. My Lenovo K4 Atmos and @[worstenbrood](http://forum.xda-developers.com/member.php?u=981278) Lenovo A7000 (6.5) Atmos both utilize solely a software emulation which results in a more artificial sound experience (that is not as good). However with Axon 7 Atmos version, you will see more realistic sound. When you listen to it you will hear the difference immediately in comparison to other versions. The Lepro 3, LeMax 2, and Aquaris X5 Dolby Atmos both only utilize a software effect, however they both sound nearly as good as the Axon 7 Dolby Atmos and are more compatible.

### LeEco LePro 3 Atmos <v2.3.a.12_r0>

**r1.1**:

- Further smali hax
- Bug fixes
- Massive script updates
- Newer device compatibility including Pixel & Nexus 6P support
- Elaborate restore/backup function
- Universal deep_buffer hack included

Download: [Link](https://drive.google.com/file/d/0BxlY-VYiFXU7V3NJdXRpN3hQdGs/view?usp=sharing) - [Mirror](https://www.dropbox.com/s/ymlyuhuu7kbiolu/dax_lepro3_r1.1_signed.zip?dl=0)

#### Previous Changelogs (LeEco LePro 3 Atmos):

**r1.0**:

- Changed both app's namespace
- Changed audio effect UUIDs
- Merged framework files
- Backported for support from Jellybean to Android N
- Smali hax to eliminate force closes
- Permissions no longer need to be manually turned on with MM+
- Bug fixes

### Installation

When you've chosen the one you're going to use, download and flash the installer provided above. TWRP is recommended, but I'm sure CM Recovery, Philz, and CWM work just fine. Flashfire is tested as working. Each Dobly Atmos above comes from different devices AND manufacturers. To find which Atmos works properly for you, make sure you are Selinux Permissive. Flash LePro 3 version if and if that does not work flash LeMax 2 version. If it does not work then flash BQ Aquaris version third. If that one doesn't work flash Axon version last. If Axon version does not work then I'm sorry, provide a log as I am looking in to fixes. You should be able to flash on top of one another without causing any issues.

### Uninstall

Download and flash the uninstaller provided above. TWRP is recommended, but I'm sure CM Recovery, Philz, and CWM work just fine. Flashfire is tested as working.

![Dolby Atmos app Interface](https://img.xda-cdn.com/SNOpo8COXcCngH3Ch61PdGfAfKg=/https%3A%2F%2Fs32.postimg.org%2Fyo3au3o5h%2FScreenshot_20160710_160615.png)

Credits of Originality by [ahrion](http://forum.xda-developers.com/member.php?u=5357345):

- Dolby
- BQ
- LeEco (LeTv)
- ZTE
- Lenovo
- I ported the app myself([ahrion](http://forum.xda-developers.com/member.php?u=5357345)) and made the changes necessary for it to work without FC on most devices

**WARNING: Permission to use this for your own mod is and will never be granted to anyone with the exception being A.R.I.S.E. If you would like to use my files for your ROM, and only your ROM, please contact me to obtain permission before doing so. By not adhering to my strict policies, you are in violation and the issue will be forwarded promptly to a moderator. You can thank kangers.**

#### XDA:DevDB Information

**Collective Dolby Atmos Port Thread, ROM for all devices (see above for details)**

##### Contributors

ahrion, @Yoinx (helping hax headphone smali bug)
```
ROM OS Version: 7.x Nougat
ROM Firmware Required: 4.1+
```

##### Version Information

```
Status: Stable
Stable Release Date: 2017-02-12

Created 2016-07-07
Last Updated 2017-02-12
```

### Magisk Port Features

1. deep_buffer and raw removal for more compatibility;
2. Fix /system/vendor/etc/audio_effects.conf for OnePlus3 ROMs;
3. Set props by resetprop, introduced in Magisk v9;

### Support Link

- [Collective Dolby Atmos Port Thread [JB-N+][MAJOR UPDATE: 02/12/2017]](http://forum.xda-developers.com/android/software/soundmod-axon-7-dolby-atmos-t3412342)
- [Magisk - Root & Universal Systemless Interface [Android 5.0+]](https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445)

### Credit
- Orignially ported by [ahrion@XDA](http://forum.xda-developers.com/member.php?u=5357345)
- Magisk by [topjohnwu@XDA](https://forum.xda-developers.com/member.php?u=4470081)
- Magisk module by [laggardkernel@Github](https://github.com/laggardkernel)


