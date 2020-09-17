#!/bin/bash

PERCENT=$(free | grep Mem | awk '{printf("%3.0f\n", $3/$2 * 100.0)}')

FULL_TEXT="${PERCENT}%"
SHORT_TEXT=$FULL_TEXT

# print text
echo $FULL_TEXT
echo $SHORT_TEXT

# and color, eventually
if (( $PERCENT > 95  ))
then
    echo "#FF0000"
elif (( $PERCENT > 80  ))
then
    echo "#FFAE00"
elif (( $PERCENT > 65  ))
then
    echo "#FFF600"
else
    echo "#A8FF00"
fi

