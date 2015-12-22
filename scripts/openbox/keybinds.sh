#!/bin/mksh
# Script to easily map commands to keys in openbox
#
# Created by Dylan Araps
# https://github.com/dylanaraps/dotfiles

volup () {
    amixer set Master 5+
    popup.sh -e "$(amixer get Master | egrep -o '[0-9]+\%')" -w 150 -x 1670 &
    mpc update
}

voldown () {
    amixer set Master 5-
    popup.sh -e "$(amixer get Master | egrep -o '[0-9]+\%')" -w 150 -x 1670 &
    mpc update
}

prevsong () {
    mpc -q prev
    popup.sh -e "$(mpc current)" -w $(txtw "$(mpc current)") -x $((1820 - $(txtw "$(mpc current)"))) &
}

nextsong () {
    mpc -q next
    popup.sh -e "$(mpc current)" -w $(txtw "$(mpc current)") -x $((1820 - $(txtw "$(mpc current)"))) &
}

togglesong () {
    mpc -q toggle
    popup.sh -e "$(mpc status | egrep -o '\[.*\]' | sed 's/[][]//g')" -w 150 -x 1670 &
}

dmenu () {
    dmenu_recent_aliases -s 0 -nb "#$white" -nf "#$black" -sb "#$white" -sf "#$gray" -i -h 30 -w 120 -q -x 30 -y 30 -fn "lemon" -p ">" -l 1
    mpc update
}

screenshot () {
    popup.sh -e "Saved Screenshot" -s 4 -w 150 -x 1670 & sleep 1; \
    cd "$HOME/Pictures/scrots" && scrot &
}

minify () {
    wrs -a 355 270 $(pfw)
}

case $1 in
    volup) volup ;;
    voldown) voldown ;;
    prevsong) prevsong ;;
    nextsong) nextsong ;;
    togglesong) togglesong ;;
    dmenu) dmenu ;;
    screenshot) screenshot ;;
    minify) minify ;;
esac
