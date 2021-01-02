#!/bin/bash

s="${HOME}/Pictures/screenshots/"
n="screenshot_$(date -u +'%Y-%m-%d_%H:%M:%S').png"
f="${s}${n}"

maim -u -i $(xdotool getactivewindow) $f
convert -geometry 100x $f /tmp/screenshot.png
xclip -selection clipboard -target image/png -i $f &>/dev/null
ACTION=$(dunstify -I /tmp/screenshot.png "Screenshot copied!")

if [ $ACTION == "2" ]; then
    gimp $f &
fi

