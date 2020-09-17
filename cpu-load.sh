#!/bin/bash
PERCENT=$(/home/robot/.config/i3blocks/cpu_usage -d 0 | head -n1)

FULL_TEXT="${PERCENT}"
SHORT_TEXT=$FULL_TEXT

# print text
echo $FULL_TEXT
echo $SHORT_TEXT

# and color, eventually
if (( $PERCENT > 100  ))
then
    echo "#FF0000"
elif (( $PERCENT > 80  ))
then
    echo "#FFAE00"
elif (( $PERCENT > 70  ))
then
    echo "#FFF600"
else
    echo "#A8FF00"
fi

