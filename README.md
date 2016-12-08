# BQ Aquaris X5 Atmos

![Dolby Atmos](https://s13.postimg.org/eq742bjv9/Logo_Dolby_Atmos_svg.png?dl=1)

**Disclaim: This is a personal experiment on Magisk, adapted from ahrion's Collective Dolby Atmos Port Thread [MM+]. No interest for distribution**

### Intro

This is the Dolby Atmos ported from LeTv, BQ, and ZTE phone's stock Marshmallow ROM. This should work on all devices (starting from Marshmallow) since it is a software effect. It might conflict with other effects you've already installed. However, it has been extensively tested working alongside ViPER4Android, Maxxaudio, and HTC M9/10 Dolby on several ROM/device combinations. Flash the zip, it will edit and patch (not overwrite) your audio_effects.conf. Currently selinux permissive is recommended.

I understand the UI looks like the old Dolby Digital Plus, but I can assure you that it is much much better. This Atmos is a much more updated version than ones previously released on the Lenovo K3/K4 Note. The Axon 7 Dolby Atmos utilizes both software and hardware components of your device, which means it processes in a much more powerful manner with much more precision and quality and a more natural soundscape. My Lenovo K4 Atmos and @[worstenbrood](http://forum.xda-developers.com/member.php?u=981278) Lenovo K3 Atmos both utilize solely a software emulation which results in a more artificial sound experience (that is not as good). However with Axon 7 Atmos version, you will see more realistic sound. When you listen to it you will hear the difference immediately in comparison to other versions. The LeMax 2 and Aquaris X5 Dolby Atmos both only utilize a software effect, however they both sound nearly as good as the Axon 7 Dolby Atmos and are more compatible.

### BQ Aquaris X5 Atmos <v2.2.1.7_r1>

**r0.3**:

- Initial Public BETA
- Permissions no longer need to be manually turned on with MM+

Download: [Link](https://drive.google.com/file/d/0BxlY-VYiFXU7cFB2cUNjX1JoQU0/view?usp=sharing) - [Mirror](https://www.dropbox.com/s/xu2pulree4yzi0k/dax_aquaris_r0.3_signed.zip?dl=0)

**Previous Changelogs (BQ Aquaris X5)**:

**r0.1/0.2**

- Initial private ALPHA
- Changed both app's namespace
- Changed audio effect UUIDs
- Merged framework files
- Backported for support from Jellybean to Android N
- Smali hax to eliminate force closes

### Installation

Each Dobly Atmos above comes from different devices AND manufacturers. To find which Atmos works properly for you, make sure you are Selinux Permissive. Flash LeMax version first, if it does not work then flash Aquaris version second. If that one doesn't work flash Axon version last. If Axon version does not work then I'm sorry, provide a log as I am looking in to fixes. You should be able to flash on top of one another without causing any issues.

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
ROM OS Version: 6.0.x Marshmallow
ROM Firmware Required: 6.0+
```

##### Version Information

```
Status: Beta
Beta Release Date: 2016-09-21

Created 2016-07-07
Last Updated 2016-09-21
```

### Magisk Port Features

1. deep_buffer and raw removal for more compatibility;
2. Fix /system/vendor/etc/audio_effects.conf for OnePlus3 ROMs;
3. Set props by resetprop, introduced in Magisk v9;

### Support Link

- [Collective Dolby Atmos Port Thread [MM+]](http://forum.xda-developers.com/android/software/soundmod-axon-7-dolby-atmos-t3412342)

### Credit
- Orignially ported by [ahrion@XDA](http://forum.xda-developers.com/member.php?u=5357345)
- Magisk module by [laggardkernel@Github](https://github.com/laggardkernel)

