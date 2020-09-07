#!/bin/bash

HEX=$(colorpicker --preview --short --one-shot)
if [ ${#HEX} -ge 1 ]; then
    echo -n ${HEX} | xclip -selection clipboard
    convert -size 100x100 xc:${HEX} /tmp/colorpicker.png
    dunstify -I /tmp/colorpicker.png "Color ${HEX} copied!"
else
    exit
fi

