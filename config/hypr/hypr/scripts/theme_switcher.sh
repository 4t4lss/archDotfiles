#!/usr/bin/env bash

HYPR_THEME_DIR="$HOME/.config/hypr/modules/themes"
WAYBAR_THEME_DIR="$HOME/.config/waybar/themes"
ROFI_THEME_DIR="$HOME/.config/rofi/themes"
SWAYNC_THEME_DIR="$HOME/.config/swaync/themes"
HYPR_ACTIVE_SYMLINK="$HYPR_THEME_DIR/active.lua"
WAYBAR_ACTIVE_SYMLINK="$HOME/.config/waybar/style.css"
ROFI_ACTIVE_SYMLINK="$HOME/.config/rofi/config.rasi"
SWAYNC_ACTIVE_SYMLINK="$HOME/.config/swaync/style.css"

if [ ! -d "$HYPR_THEME_DIR" ]; then
    exit 1
fi

MENU_INPUT=""

# extract wallpaper from themefile(s)
shopt -s nullglob
for theme_file in "$HYPR_THEME_DIR"/*.lua; do
    [ -f "$theme_file" ] || continue
 
    filename=$(basename "$theme_file")
    [ "$filename" == "active.lua" ] && continue
    
    theme_id="${filename%.lua}"
    
    WALLPAPER=$(lua -e "local status, t = pcall(dofile, '$theme_file'); if status and type(t) == 'table' then print(t.wallpaper or '') end")
    
    if [ -n "$WALLPAPER" ] && [ -f "$WALLPAPER" ]; then
        MENU_INPUT+="${theme_id}\0icon\x1f${WALLPAPER}\n"
    else
        MENU_INPUT+="${theme_id}\n"
    fi
done
shopt -u nullglob

# Rofi override
ROFI_STYLE='
configuration {
    show-icons: true;
}

window {
    width: 75%;
    location: center;
    anchor: center;
    border-radius: 12px;
}

mainbox {
    children: [ inputbar, listview ];
    padding: 10px;
}

inputbar {
    padding: 10px;
    margin: 0px 0px 15px 0px;
}

entry{
    placeholder: "Select Theme:";
}

listview {
    columns: 4;
    lines: 2;
    spacing: 15px;
    cycle: true;
    dynamic: true;
    fixed-columns: true;
    flow: horizontal;
}

element {
    orientation: vertical;
    padding: 1px;
    border-radius: 8px;
    children: [ element-icon, element-text ];
}

element-icon {
    size: 300px;
    horizontal-align: 0.5;
    vertical-align: 0.5;
    expand: false;
}

element-text {
    enabled: true;
    horizontal-align: 0.5;
    margin: 6px 0px 0px 0px;
}
'

SELECTED=$(echo -e -n "$MENU_INPUT" | rofi -dmenu -i -theme-str "$ROFI_STYLE")

if [ -n "$SELECTED" ] && [ -f "$HYPR_THEME_DIR/$SELECTED.lua" ] && [ -f "$WAYBAR_THEME_DIR/$SELECTED.css" ] ; then
    #swap pointer
    ln -sf "$HYPR_THEME_DIR/$SELECTED.lua" "$HYPR_ACTIVE_SYMLINK"
    ln -sf "$WAYBAR_THEME_DIR/$SELECTED.css" "$WAYBAR_ACTIVE_SYMLINK"
    ln -sf "$ROFI_THEME_DIR/$SELECTED.rasi" "$ROFI_ACTIVE_SYMLINK"
    ln -sf "$SWAYNC_THEME_DIR/$SELECTED.css" "$SWAYNC_ACTIVE_SYMLINK"

    WALLPAPER=$(lua -e "local status, t = pcall(dofile, '$HYPR_THEME_DIR/$SELECTED.lua'); if status and type(t) == 'table' then print(t.wallpaper or '') end")

    if [ -n "$WALLPAPER" ] && [ -f "$WALLPAPER" ]; then
        ACTIVE_MONITORS=$(hyprctl monitors -j | jq -r '.[].name')

        for MON in $ACTIVE_MONITORS; do
            hyprctl hyprpaper wallpaper "$MON,$WALLPAPER"
        done
    fi
    killall -SIGUSR2 waybar
    swaync-client -rs
fi
