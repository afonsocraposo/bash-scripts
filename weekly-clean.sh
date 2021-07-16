#!/bin/sh

folders="/home/robot/Pictures/screenshots/ /home/robot/Downloads/"

echo "$folders" | tr ' ' '\n' | while read item; do
    echo "Cleaning ${item}"
    /home/robot/Scripts/clean-folder.sh $item 7
done
