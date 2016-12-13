# Ubuntu Fonts (Magisk)

Repalce fonts for Latin letters(Roboto as default) with Ubuntu fonts systemlessly. The method is origianlly created by [RadarNyan](https://plus.google.com/+SatsukiMisaki "見崎未咲（RadarNyan）") on a [themex post](http://bbs.themex.net/showthread.php?p=1308726 "完美更换 Android 5.0+ 系统字体（英文字体，不修改字体文件）").

System fonts configuration files `system_fonts.xml` and `fallback_fontx.xml` are combined as `fonts.xml` since Android 5.0. System default fonts and fallback fonts on Android could be changed without modifying the font files, like .ttf .otf, simply through modifying `fonts.xml`.

### Detail

While, change default fonts by modifying the configuration file is not enough, which will cause a different font height comparing with the default font, Roboto. This is due to the different Metrics in different fonts. Instead of modifying the font itself, .ttf or .otf, which is kind of dirty, [RadarNyan](https://plus.google.com/+SatsukiMisaki "見崎未咲（RadarNyan）") choose to solve this using the fallback mechanism of fonts on Android,

1. Create a series fake fonts from Roboto without Glyph;
2. Modify fonts.xml to let RobotoFake be default fonts and Ubuntu as fallback;
```html
<familyset version="22">
    <!-- RobotoFake provides Metrics -->
    <family name="sans-serif">
        <font weight="100" style="normal">RobotoFake-Thin.ttf</font>
        <font weight="100" style="italic">RobotoFake-ThinItalic.ttf</font>
        <font weight="300" style="normal">RobotoFake-Light.ttf</font>
        <font weight="300" style="italic">RobotoFake-LightItalic.ttf</font>
        <font weight="400" style="normal">RobotoFake-Regular.ttf</font>
        <font weight="400" style="italic">RobotoFake-Italic.ttf</font>
        <font weight="500" style="normal">RobotoFake-Medium.ttf</font>
        <font weight="500" style="italic">RobotoFake-MediumItalic.ttf</font>
        <font weight="900" style="normal">RobotoFake-Black.ttf</font>
        <font weight="900" style="italic">RobotoFake-BlackItalic.ttf</font>
        <font weight="700" style="normal">RobotoFake-Bold.ttf</font>
        <font weight="700" style="italic">RobotoFake-BoldItalic.ttf</font>
    </family>
    
    <!-- Ubuntu font is default -->
    <family>
        <font weight="300" style="normal">Ubuntu-L.ttf</font>
        <font weight="300" style="italic">Ubuntu-LI.ttf</font>
        <font weight="400" style="normal">Ubuntu-R.ttf</font>
        <font weight="400" style="italic">Ubuntu-RI.ttf</font>
        <font weight="500" style="normal">Ubuntu-M.ttf</font>
        <font weight="500" style="italic">Ubuntu-MI.ttf</font>
        <font weight="700" style="normal">Ubuntu-B.ttf</font>
        <font weight="700" style="italic">Ubuntu-BI.ttf</font>
    </family>

    <!-- Roboto as default fallback -->
    <family>
        <font weight="100" style="normal">Roboto-Thin.ttf</font>
        <font weight="100" style="italic">Roboto-ThinItalic.ttf</font>
        <font weight="300" style="normal">Roboto-Light.ttf</font>
        <font weight="300" style="italic">Roboto-LightItalic.ttf</font>
        <font weight="400" style="normal">Roboto-Regular.ttf</font>
        <font weight="400" style="italic">Roboto-Italic.ttf</font>
        <font weight="500" style="normal">Roboto-Medium.ttf</font>
        <font weight="500" style="italic">Roboto-MediumItalic.ttf</font>
        <font weight="900" style="normal">Roboto-Black.ttf</font>
        <font weight="900" style="italic">Roboto-BlackItalic.ttf</font>
        <font weight="700" style="normal">Roboto-Bold.ttf</font>
        <font weight="700" style="italic">Roboto-BoldItalic.ttf</font>
    </family>
(The following is omitted)
```

Since RobotoFake fonts don't have Glyph, they are made as a Metrics provider for the fallback fonts, Ubuntu fonts in this case. The orgianl Roboto is made a second default fallback to provide the possible lost characters in Ubuntu.

**NOTE: The 2nd and 3rd parts of the configuration above should not inclue name property in the `<family>` tag.**

The advantage of this solution is that, fonts for Latin characters could be changed on your will without touching font files themselves by modifying the 2nd part of the template above. The font weights should be written down as what it is. No need to be worried about that lost characters in your custom fonts be replaced by Roboto. Because the fallback mechanism on Android is based on "family" but "weight". 

Besides, dehint is recommended for a better display on high-resolution screens.

### Display effects

1. Modify fonts.xml directly

    ![Modify fonts.xml directly](https://raw.githubusercontent.com/laggardkernel/magisk-module-template/ubuntu_font/src/1.png)

2. Original Roboto

    ![Original Roboto](https://raw.githubusercontent.com/laggardkernel/magisk-module-template/ubuntu_font/src/2.png)

3. Use the fallback trick

    ![Use the fallback trick](https://raw.githubusercontent.com/laggardkernel/magisk-module-template/ubuntu_font/src/3.png)

### Credit

- original creator [RadarNyan](https://plus.google.com/+SatsukiMisaki "見崎未咲（RadarNyan）")
- magisk module by [laggardkernel](https://github.com/laggardkernel)
