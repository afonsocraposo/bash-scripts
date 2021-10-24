#!/bin/sh

wal -R -e -q &
ESCDELAY=0 TERM=screen-256color neomutt
