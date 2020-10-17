#!/bin/bash
PERCENT=$($HOME/Scripts/cpu_usage -d 0 | head -n1 | rev | cut -c2- | rev)

FULL_TEXT="${PERCENT}%"
SHORT_TEXT=$FULL_TEXT

# print text
echo $FULL_TEXT
echo $SHORT_TEXT

# and color, eventually
if [ $PERCENT -gt 100  ]
then
    echo "#FF0000"
elif [ $PERCENT -gt 80  ]
then
    echo "#FFAE00"
elif [ $PERCENT -gt 70  ]
then
    echo "#FFF600"
else
    echo "#A8FF00"
fi

