#!/system/bin/sh
iMODPATH="/data/adb/modules/iUnlocker"
busybox="/data/adb/magisk/busybox"
sysbin=$MODPATH/system/bin
DATADIR="/data"
FSNAME=iUnlocker-fs
ROOTFSDIR=$DATADIR/adb/$FSNAME
termux=com.termux
termux_ver=null
applet=wget
opti=-qO
magisk_supported=universal
flavor=zygisk
isUpdate=true
isUser=true
isDev=false
reboot_time='t\18/s/g'
SPREADINGDIR=/system\/vendor\/odm\/system_ext\/product
magiskdb=/data/adb/magisk.db
OLDDIR="/data/adb/modules/iUnlockerIV"
quick_option='--vault'
download() {
su -c $busybox $applet $opti "/data/local/tmp/$1" "$2" > /dev/null | echo "Downloading... $1"; }
cout() { printf "$1"; }
dezip() { unzip -qo "$1" "$2" -d "$3"; }
RNM() { mv "$sysbin/$1" "$sysbin/$2" | echo "Renamed to: $2"; }
progress() { sleep "$@"; echo " + D: $(date +%d/%y/%m)" | head -n 1; }
TERMUXL() { monkey -p com.termux -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1; }
CEV=KEYCODE_ENTER
HTP() { input text "su -c /data/adb/modules_update/iUnlocker/postiUnlocker"; }
HSR() { input keyevent "$@"; }
set_perm() { chmod "$@"; }
run() { su -c "$DATADIR/adb/modules_update/iUnlocker/$1"; }
applets() 
{
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/system/bin/iUnlocker"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/overclock"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/daemon"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/AI"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/iUnlockerXQualcomm"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/iUnlockerRE"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/iUnlockerXMTK"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/idaemon"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/postiUnlocker"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/Proc"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/Unlocker"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/updater"
    ln -s "$ROOTFSDIR/bin/chain" "$MODPATH/chain"
    ln -s "$ROOTFSDIR/bin/iUnlockerBox" "$MODPATH/iUnlockerHelpCenter"
    ln -s "$ROOTFSDIR/bin/data-base-iUnlocker" "$MODPATH/data-base-iUnlocker"
}
old_ver_check() {
if [ -e /data/adb/modules/iUnlockerIV ]; then
rm -rf /data/adb/modules/iUnlockerIV
rm -rf /data/adb/modules_update/iUnlockerIV
fi
if [ -e /data/adb/modules/iUnlocker-Sapphire ]; then
rm -rf /data/adb/modules/iUnlocker-Sapphire
rm -rf /data/adb/modules_update/iUnlocker-Sapphire
fi
}
