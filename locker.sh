#!/bin/bash

TMPBG=/tmp/screen.png
LOCK=$HOME/.config/screen-lock.png
RES=3840x1080

/home/robot/Scripts/screenshot-locker.lua

ffmpeg -i /tmp/screenshot_fixed.png -video_size $RES -y -i $LOCK -filter_complex "boxblur=20:1,overlay=(3*main_w/4)-overlay_w/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG

dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop

i3lock -e -i /tmp/screen.png 
