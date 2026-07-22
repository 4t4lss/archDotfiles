#!/bin/bash
TARGET_MAC="C3:D7:D1:BF:04:DF" 

# Listen continuously to bluetooth properties via DBus (0% idle CPU)
dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" | \
while read -r line; do
    # Check if our target MAC address triggers a connection change
    if echo "$line" | grep -q "/dev_${TARGET_MAC//:/_}"; then
        # Check current connected status using bluetoothctl
        if bluetoothctl info "$TARGET_MAC" | grep -q "Connected: yes"; then
            # Keyboard connected -> Retrieve main monitor brightness
            MAIN_BRIGHTNESS=$(brightnessctl -d intel_backlight get)
            
            # Fallback check in case the command fails to read
            if [ -z "$MAIN_BRIGHTNESS" ]; then
                MAIN_BRIGHTNESS=150
            fi

            # 1. Turn laptop screen on first
            hyprctl eval 'hl.monitor({output = "eDP-2", disabled = false})'
            
            # 2. Wait 0.2 seconds for the display panel and sysfs hardware to wake up
            sleep 0.2
            
            # 3. Apply the brightness level safely
            brightnessctl --device=card1-eDP-2-backlight set "$MAIN_BRIGHTNESS"
        else
            # Keyboard disconnected -> Turn laptop screen off
            hyprctl eval 'hl.monitor({output = "eDP-2", disabled = true})'
        fi
    fi
done
