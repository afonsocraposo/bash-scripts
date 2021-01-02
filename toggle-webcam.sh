#!/bin/bash

WEBCAM=$(cat /tmp/webcam 2>/dev/null || echo 1)

if [[ $WEBCAM -eq 1 ]]; then
    echo "0" | sudo -A tee -a /sys/bus/usb/devices/2-1.1/bConfigurationValue > /dev/null
    if [ $? -eq 0 ]; then
        echo 0 > /tmp/webcam
        echo "webcam"
        echo "webcam"
        echo "#aaaaaa"
        exit 0
    else
        exit 1
    fi
else
    echo "1" | sudo -A tee -a /sys/bus/usb/devices/2-1.1/bConfigurationValue > /dev/null
    if [ $? -eq 0 ]; then
        echo 1 > /tmp/webcam
        echo "webcam"
        echo "webcam"
        echo "#aaffaa"
        exit 0
    else
        exit 1
    fi
fi
