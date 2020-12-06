#!/bin/bash
#function confirm {
    #zenity --question --text="Proceed to $1"
    #if [ $? = 0 ]; then
        #$2
    #else
        #exit
    #fi
#}


ask=`zenity --list --title="Select an option" --column="0" "Hibernate" "Logout" "Shutdown" "Reboot" --width=100 --height=300 --hide-header`

#if [ "$ask" == "Lock screen" ]; then
    #confirm "lock screen" $(/home/robot/.config/awesome/scripts/locker.sh)
#fi

#if [ "$ask" == "Suspend" ]; then
    #confirm "suspend" $(systemctl suspend)
#fi

#if [ "$ask" == "Log out" ]; then
    #confirm "log out" $(dm-tool switch-to-greeter)
#fi

if [ "$ask" == "Hibernate" ]; then
    zenity --question --text="Proceed to hibernate?"
    if [ $? = 0 ]; then
    $(systemctl hibernate)
    else
        exit
    fi
fi

if [ "$ask" == "Logout" ]; then
    zenity --question --text="Proceed to logout?"
    if [ $? = 0 ]; then
    $(i3-msg exit)
    else
        exit
    fi
fi

if [ "$ask" == "Shutdown" ]; then
    zenity --question --text="Proceed to shutdown?"
    if [ $? = 0 ]; then
        $(systemctl poweroff)
    else
        exit
    fi
fi

if [ "$ask" == "Reboot" ]; then
    zenity --question --text="Proceed to reboot?"
    if [ $? = 0 ]; then
        $(systemctl reboot)
    else
        exit
    fi

fi
exit 0
