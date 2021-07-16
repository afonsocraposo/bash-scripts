#!/bin/sh

NUMBER=$(/sbin/notmuch search tag:unread and folder:/INBOX/ -folder:/Junk/ | wc -l)

if [ "$NUMBER" -eq "0" ]; then
   echo "-";
   exit;
fi

echo $NUMBER
echo $NUMBER
echo "#FFFF00"
