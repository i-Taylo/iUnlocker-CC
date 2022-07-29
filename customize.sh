#!/0023/root/mac/iUnlockerWorkDir/build
SKIPUNZIP=1
COMPILER=clang
CV=$COMPILE-14*
unzip -qo "$ZIPFILE" "function.sh" "$TMPDIR"
. "$TMPDIR/function.sh"
    dezip "$ZIPFILE" "system/*" "$MODPATH"
    dezip "$ZIPFILE" "module.prop" "$MODPATH"
    dezip "$ZIPFILE" "module.prop" "$iMODPATH"
    dezip "$ZIPFILE" "system.prop" "$MODPATH"
    dezip "$ZIPFILE" "settings.prop" "$MODPATH"
    dezip "$ZIPFILE" "post-fs-data.sh" "$MODPATH"
    dezip "$ZIPFILE" "service.sh" "$MODPATH"
    dezip "$ZIPFILE" "uninstall.sh" "$MODPATH"        
  if [ -e $ROOTFSDIR ]; then
  rm -rf $ROOTFSDIR
  else
  quit=1
  name=iUnlocker
  magisk_dfpath=$(magisk --path)
  fi
#
if [ -e $OLDDIR ]; then
rm -rf $OLDDIR
fi
#   -- 製作“rootfs”目錄   #
mkdir -p "$ROOTFSDIR" > /dev/null 2>&1;
#   --  守護進程需要 #
ln -s /system/framework $ROOTFSDIR/framework
ln -s /apex $ROOTFSDIR/apex
ln -s /proc $ROOTFSDIR/apex
cat > $ROOTFSDIR/daemon.prop <<- EOM
number_of_cores=$(nproc)
arch=$ARCH
abi=$ABI
magisk_path=$(magisk --path)
trapdir=/proc
force_edit_level=33
hardware_lib=/vendor/lib
hardware_lib64=/vendor/lib64
EOM
 #  -- 提取用於：ARM64 #
if [ "$ARCH" == "arm64" ]; then
dezip "$ZIPFILE" "arm64/*" "$ROOTFSDIR"; applets
mv $ROOTFSDIR/arm64/bin $ROOTFSDIR
rm -rf "$ROOTFSDIR/arm64";
 # -- 提取用於：ARM #
elif [ "$ARCH" == "arm" ]; then 
dezip "$ZIPFILE" "arm/*" "$ROOTFSDIR"; applets
mv $ROOTFSDIR/arm/bin $ROOTFSDIR
rm -rf "$ROOTFSDIR/arm";
fi
 #  #
 #  -- 提取用於：x86 #
if [ "$ARCH" == "x86" ]; then
dezip "$ZIPFILE" "x86/*" "$ROOTFSDIR"; applets
mv $ROOTFSDIR/x86/bin $ROOTFSDIR
rm -rf "$ROOTFSDIR/x86";
 # -- 提取用於：X64_86 #
elif [ "$ARCH" == "x64" ]; then 
dezip "$ZIPFILE" "x64/*" "$ROOTFSDIR"; applets
mv $ROOTFSDIR/x64/bin $ROOTFSDIR
rm -rf "$ROOTFSDIR/x64";
fi
 #  #
 old_ver_check
set_perm 777 $ROOTFSDIR/bin/*
set_perm 777 $MODPATH/*
        CARCH=$ARCH
        SPACE64="$(su -c $ROOTFSDIR/bin/libCore --arch=64 --$COMPILER -build=1 | tail -c +8)"
        FALVOR=zygisk
        hasLIB=true
        if [ "$SPACE64" == "iUnlocker64.cpp" ]; then
        if [ "$ARCH" == "arm64" ]; then
        export GRABLR="jsondir../../../../PATH"
        export OPTION=-ips-magisk
        export DAEMON="$MODPATH/daemon";
        su -c $ROOTFSDIR/bin/libCore --arch=64 --$COMPILER --compile
        elif [ "$ARCH" == "arm" ]; then
        export GRABLR="jsondir32../../../../PATH"
        export OPTION=-ips-magisk32
        export DAEMON="$MODPATH/daemon"
        su -c $ROOTFSDIR/bin/libCore --arch=32 --$COMPILER --compile
          fi
        fi
    run chain
    set_perm 777 $MODPATH/*
    set_perm 777 $MODPATH/system/bin/*
    set_perm 777 $MODPATH/system/bin/.iUnlocker

    TP=$(pm list packages com.termux | tail -c +9)
    if [ $TP == $termux ]; then
    cout "Termux is installed\n"; chain=3
    TERMUXL; HTP; HSR $CEV
    else
    cout "Termux is not installed\n"
    ltmp="/data/local/tmp"
    if [ -f $ltmp/termux.apk ]; then
          pm install --user 0 "$ltmp/termux.apk" > /dev/null 2>&1;
          cout "Giving termux root permission...\n"
          su -c $MODPATH/data-base-iUnlocker > /dev/null 2>&1;
          TERMUXL; sleep 5; HTP; HSR $CEV
          else
         case $ARCH in         
         arm) download termux.apk "https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_armeabi-v7a.apk";;
         arm64) download termux.apk "https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk";;
         x86) download termux.apk "https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_x86.apk";;
         x64) download termux.apk "https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_x86_64.apk";;
         esac
          ltmp="/data/local/tmp"
          pm install --user 0 "$ltmp/termux.apk" > /dev/null 2>&1;
          cout "Giving termux root permission...\n"
          su -c $MODPATH/data-base-iUnlocker > /dev/null 2>&1;
          TERMUXL; sleep 5; HTP; HSR $CEV
          
    fi
fi
      
      
    TWRP="/sdcard/TWRP"
    # weird name right? cuz games, apps now detects under 'twrp' name exactly so if twrp=t(iUnlocker)wrp then it'll not be detected.
    BACKUPDIR="/sdcard/safe_t(iUnlocker)wrp"
    mkdir -p "$BACKUPDIR" > /dev/null 2>&1;
    mv $TWRP/* $BACKUPDIR > /dev/null 2>&1;
    mv $TWRP/.* $BACKUPDIR > /dev/null 2>&1;
    rm -rf $TWRP > /dev/null 2>&1;
    su -c $ROOTFSDIR/bin/desc > /dev/null 2>&1;
    content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:0