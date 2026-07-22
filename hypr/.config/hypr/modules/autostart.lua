-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function ()
    --load hypr before other apps
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- desktop daemons
    hl.exec_cmd("waybar -c ~/.config/waybar/config.jsonc &")
    hl.exec_cmd("waybar -c ~/.config/waybar/hdmi_config.jsonc &")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    -- hl.exec_cmd("hyprlock")

    --desktop apps
    hl.exec_cmd("kitty")
    hl.exec_cmd("firefox")
    -- hl.exec_cmd("[workspace special:music silent] pear-desktop")

    --authentication and scripts
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("~/.config/hypr/scripts/bt_monitor.sh")

    --clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
