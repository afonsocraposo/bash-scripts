#!/bin/bash

TMPBG=/tmp/screen.png
LOCK=$HOME/.config/screen-lock.png
RES=3840x1080

maim -u /tmp/screen.png

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=20:1,overlay=(main_w-overlay_w)/4:(main_h-overlay_h)/2" -vframes 1 $TMPBG

dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -e -i /tmp/screen.png
