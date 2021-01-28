#!/bin/sh


if /sbin/pkill -f /usr/lib/ferdi; then
    sleep 1
    /sbin/ferdi &
fi

