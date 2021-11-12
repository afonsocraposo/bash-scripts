#!/bin/sh

/home/robot/Scripts/email-tray-indicator.py 2>/dev/null &
ESCDELAY=0 TERM=screen-256color neomutt
