#!/usr/bin/env bash

# Options list with icons
OPTIONS="\uea75 Lock\n\uedf5 Log Out\n\uf4ee Suspend\n\uf2dc Hibernate\n\uead2 Reboot\n\uf011 Shutdown"

# Prompt Rofi menu
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p -theme-str 'entry { placeholder: "Select Action:";}')

case "$CHOICE" in
    *Lock)         hyprlock ;;
    *"Log Out"*)     hyprctl dispatch 'hl.dsp.exit()' ;;
    *Suspend*)     systemctl suspend ;;
    *Hibernate*)   systemctl hibernate ;;
    *Reboot*)      systemctl reboot ;;
    *Shutdown*)    shutdown now ;;
esac
