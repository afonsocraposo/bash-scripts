#!/bin/bash

function check-account {
    echo $1
    OUTPUT=$(mw sync $1)
    if [[ $OUTPUT == *"No new mail"* ]]; then
      echo "No mail"
    else
        NR=$(echo $OUTPUT | grep -Poi "Added\s\K([0-9]+)")
        dunstify -I /usr/share/icons/Papirus-Dark/128x128/apps/email.svg  "${1}" "You have $NR new e-mail(s)!"
    fi
}

mw ls | grep -Poi "[0-9]:\s\K(.*)" | while read -r account; do check-account $account; done
exit
