#!/bin/sh

selected=$(tac ~/.local/share/zathura/history | sed -rn 's/\[(.*.pdf)\]$/\1/p' | wofi --dmenu)

# exit if nothing is selected
[ -z "$selected" ] && exit

zathura "$selected" &
ps aux | grep -ie "zathura\$" | awk '{print $2}' | xargs kill -9 2>/dev/null

exit 0
