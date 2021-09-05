#!/bin/sh

BACKGROUND=/home/robot/Pictures/wallpapers/6am.jpg

feh --bg-fill $BACKGROUND

wal -i $BACKGROUND -q

/home/robot/.config/polybar/hack/scripts/pywal.sh $BACKGROUND > /dev/null &

exit 0
