#!/bin/bash

DISTURB=$(cat /tmp/disturb 2>/dev/null || echo 0)

if [[ $DISTURB -eq 0 ]]; then
    echo 1 > /tmp/disturb
    killall -SIGUSR1 dunst
    ~/Scripts/mute-app.sh rambox
    #echo "ﮖ" > /tmp/disturb-icon
    echo "Shh!"
    echo "Shh!"
    echo "#FF0000"
else
    echo 0 > /tmp/disturb
    killall -SIGUSR2 dunst
    ~/Scripts/mute-app.sh -u rambox
    #echo "ﮗ" > /tmp/disturb-icon
    echo "OK"
fi
