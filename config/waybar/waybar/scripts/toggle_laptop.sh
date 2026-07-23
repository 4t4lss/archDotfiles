!/usr/bin/env bash

# Check if a waybar layer exists on your laptop displays (eDP-1 or eDP-2)
if hyprctl layers | grep -E "eDP-[1-2]" | grep -q "waybar"; then
    # It is currently visible, so send the hide signal
    pkill -f 'waybar -c .*/config.jsonc$' -SIGUSR1
else
    # It is currently hidden, so send the reveal signal
    pkill -f 'waybar -c .*/config.jsonc$' -SIGUSR1
fi
