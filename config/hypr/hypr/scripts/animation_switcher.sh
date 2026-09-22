#!/usr/bin/env bash

ANIMATIONS_DIR="$HOME/.config/hypr/modules/animations"
ACTIVE_SYMLINK="$ANIMATIONS_DIR/active.lua"

if [ "$(readlink "$ACTIVE_SYMLINK")" = "$ANIMATIONS_DIR/on.lua" ]; then
   TARGET_FILE="$ANIMATIONS_DIR/off.lua" 
else
   TARGET_FILE="$ANIMATIONS_DIR/on.lua" 
fi

ln -sf "$TARGET_FILE" "$ACTIVE_SYMLINK"

hyprctl reload
