#!/bin/bash

s="${HOME}/Pictures/screenshots/"
n="screenshot_$(date -u +'%Y-%m-%d_%H:%M:%S').png"
f="${s}${n}"

if [ -z "$(maim -u -s ${f} 2>&1 > /dev/null)" ]
then
	convert -geometry 100x $f /tmp/screenshot.png
	xclip -selection clipboard -target image/png -i $f &>/dev/null
    dunstify -I /tmp/screenshot.png "Screenshot copied!"
else
	echo "cancel"
fi

