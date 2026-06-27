
#!/bin/bash
TARGET_MAC="C3:D7:D1:BF:03:DF" 

# Listen continuously to bluetooth properties via DBus (0% idle CPU)
dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" | \
while read -r line; do
    # Check if our target MAC address triggers a connection change
    if echo "$line" | grep -q "/dev_${TARGET_MAC//:/_}"; then
        # Check current connected status using bluetoothctl
        if bluetoothctl info "$TARGET_MAC" | grep -q "Connected: yes"; then
            # Keyboard connected -> Turn laptop screen on
            hyprctl eval 'hl.monitor({output = "eDP-2", disabled = false})'
            brightnessctl --device=card1-eDP-2-backlight set 150
        else
            # Keyboard disconnected -> Turn laptop screen off
            hyprctl eval 'hl.monitor({output = "eDP-2", disabled = true})'
        fi
    fi
done
