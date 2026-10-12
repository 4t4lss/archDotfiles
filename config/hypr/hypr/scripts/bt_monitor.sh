#!/bin/bash
TARGET_MAC="C3:D7:D1:BF:04:DF" 

# Listen continuously to bluetooth properties via DBus (0% idle CPU)
dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" | \
while read -r line; do
    if echo "$line" | grep -q "/dev_${TARGET_MAC//:/_}"; then
        # Check bluetooth status
        if bluetoothctl info "$TARGET_MAC" | grep -q "Connected: yes"; then
            # get main monitor brightness
            MAIN_BRIGHTNESS=$(brightnessctl -d intel_backlight get)
            
            #fallback in case no work
            if [ -z "$MAIN_BRIGHTNESS" ]; then
                MAIN_BRIGHTNESS=150
            fi

            # turn on laptop screen
            hyprctl eval 'hl.monitor({output = "eDP-2", disabled = false})'
            
            #wait 
            sleep 0.2

            #apply wallpaper
            WALLPAPER=$(lua -e "local status, t = pcall(dofile, '/home/atlas/.config/hypr/modules/themes/active.lua'); if status and type(t) == 'table' then print(t.wallpaper or '') end")
            hyprctl hyprpaper wallpaper "eDP-2,$WALLPAPER,cover"
            
            # apply brightness level
            brightnessctl --device=card1-eDP-2-backlight set "$MAIN_BRIGHTNESS"
        else
            #keyboard connected = monitor off
            hyprctl eval 'hl.monitor({output = "eDP-2",disabled = true})'
        fi
    fi
done
