#!/bin/bash
TEMP=$(sensors | grep "Tctl" | grep -Po "[0-9]{1,3}.[0-9]" | head -1 | rev | cut -c 3- | rev)

FULL_TEXT="${TEMP}ºC"
SHORT_TEXT=$FULL_TEXT

# print text
echo $FULL_TEXT
echo $SHORT_TEXT

# and color, eventually
if (( $TEMP > 100  ))
then
    echo "#FF0000"
elif (( $TEMP > 80  ))
then
    echo "#FFAE00"
elif (( $TEMP > 70  ))
then
    echo "#FFF600"
else
    echo "#A8FF00"
fi

