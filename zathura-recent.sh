#!/bin/sh

options='-columns 6 -width 100 -lines 15 -bw 2 -yoffset -2 -location 1'

selected=$(\
        tac ~/.local/share/zathura/history | sed -rn 's/\[(.*.pdf)\]$/\1/p'  \
        | rofi -dmenu -i -markup-rows \
        ${options} 
        )

# exit if nothing is selected
[[ -z $selected ]] && exit

zathura "$selected" &
ps aux | grep -ie "zathura\$" | awk '{print $2}' | xargs kill -9

exit 0
