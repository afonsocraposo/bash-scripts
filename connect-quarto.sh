#!/bin/sh

dunstify "Connecting to Google Home" "Attempting connection..."

if (bluetoothctl power on ; bluetoothctl connect F8:0F:F9:7C:1D:A4);
then
    if pacmd set-default-sink $(pactl list short sinks | tail -n 1 | cut -c -1);
    then
        dunstify "CONNECTED" "Enjoy"
    else
        dunstify "FAILED" "Failed to change audio output"
    fi
else
    dunstify "FAILED" "Failed to connect"
fi
