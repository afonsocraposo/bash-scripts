#!/bin/bash
PREV=""
NEW=""
while true; do
    NEW=$(xdotool getactivewindow getwindowname | cut -c -64 | iconv -f utf-8 -t utf-8 -c)
    if [ "$PREV" != "$NEW" ]
    then
        echo $NEW
        PREV=$NEW
    fi
    sleep 0.1
done
