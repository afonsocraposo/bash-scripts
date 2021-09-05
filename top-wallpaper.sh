#!/bin/sh

if (python /home/robot/Scripts/top-wallpaper.py $1)
then

    rm /home/robot/.cache/wal/schemes/_tmp_background_png*

    feh --bg-fill /tmp/background.png

    wal -i /tmp/background.png -q

    /home/robot/.config/polybar/hack/scripts/pywal.sh /tmp/background.png > /dev/null &

    exit 0

else
    exit -1
fi
