#!/bin/bash

DISTURB=$(cat /tmp/disturb 2>/dev/null || echo 1)

if [[ $DISTURB -eq 1 ]]; then
    echo 0 > /tmp/disturb
    killall -SIGUSR1 dunst
    echo "Shh!"
    echo "Shh!"
    echo "#FF0000"
else
    echo 1 > /tmp/disturb
    killall -SIGUSR2 dunst
    echo "OK"
    echo "OK"
    echo "#FFFFFF"
fi
