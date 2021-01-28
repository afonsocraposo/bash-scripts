#!/bin/sh

folders=(
    "/home/robot/Pictures/screenshots"
    "/home/robot/Downloads"
)

for i in "${folders[@]}"; do
    /home/robot/Scripts/clean-folder.sh $i 7
done
