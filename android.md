## login as root

connect you android phone to computer via a cable.
open developer options and usb debugging mode on the phone.
on computer type:

    $ adb shell

## remount system with rw privileges

--- so that you can access formerly unaccessable directories.

    $ adb shell
    # mount -o remount,rw /system

## transfer files

    $ adb pull
    $ adb push

## firefox usb debugging

    $ adb forward tcp:6000 localfilesystem:/data/data/org.mozilla.firefox/firefox-debugger-socket

## remove app

    $ adb devices
    $ adb shell px list packages
    $ adb uninstall com.??.??

## remove system app

    $ adb root
    $ adb remount # get r/w privilege
    # cd /system/app
    # rm -rf <AppName>
    # reboot

## package info

    # dumpsys package com.??.??

## start app

    # am start -n com.??.??.MainActivity

## misc

    $ ps -A >> /sdcard/memory.log # show processes
    $ pm disable-user com.??.?? # disable app
