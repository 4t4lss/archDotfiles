---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "nemo"
local browser     = "firefox"
local music       = "pear-desktop"
local launcher    = "rofi -show drun -show-icons"
local runner      = "rofi -show run"
local discord      = "discord --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto"

---------------------
---- KEYBINDINGS ----
---------------------
--variable for 2nd monitor
local eDP_disabled = true

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondMod = "SUPER + SHIFT"
local thirdMod = "SUPER + TAB"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

---------------------
-- QUICKLAUNCHAPPS --
---------------------
hl.bind(mainMod .. " + SEMICOLON", hl.dsp.exec_cmd(terminal)) --kitty
hl.bind(secondMod .. " + SEMICOLON", hl.dsp.exec_cmd(terminal, {float = true})) --floating kitty
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser)) --firefox
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager, {float = true})) --nemo
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(music)) --ytmusci
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(discord)) --discord
hl.bind("ALT + SHIFT + Space", hl.dsp.exec_cmd(launcher)) --rofi terminal runner
hl.bind("ALT + Space", hl.dsp.exec_cmd(runner)) --rofi desktop runner
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy")) --rofi clipboard
hl.bind(mainMod .. " + BACKSLASH", hl.dsp.window.pseudo()) --different view
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("swaync-client -t")) --swaync notification manager/audio player
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy')) --snip screenshot save to clipboard only
hl.bind(secondMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" ~/Pictures/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png')) --snip screenshot save to ~/Pictures/
hl.bind(secondMod .. " + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) --exit hyprland
hl.bind(mainMod .. " + Q", hl.dsp.window.close()) --close window
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/waybar/scripts/toggle_laptop.sh")) --toggle waybar on/off
hl.bind("CTRL + " .. mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session")) --use hyrplock to lock session

---------------------
---- MOVE-AROUND ----
---------------------
-- Move focus with mainMod + hjkl
hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L",  hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",  hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))
-- Move tiles with secondMod + hjkl
hl.bind(secondMod .. " + H",  hl.dsp.window.move({ direction = "left" }))
hl.bind(secondMod .. " + L",  hl.dsp.window.move({ direction = "right" }))
hl.bind(secondMod .. " + K",  hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + J",  hl.dsp.window.move({ direction = "down" }))
-- toggle fullscreen and float
hl.bind(mainMod .. " + P", hl.dsp.window.fullscreen({ mode = "maximized" }))
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
-- -- move focus on monitors
-- hl.bind(mainMod .. " + O", hl.dsp.focus({monitor = "eDP-1"}))
-- hl.bind(mainMod .. " + I", hl.dsp.focus({monitor = "eDP-2"}))
-- -- move tiles on monitors
-- hl.bind(secondMod .. " + o", hl.dsp.window.move({monitor = "eDP-1"}))
-- hl.bind(secondMod .. " + I", hl.dsp.window.move({monitor = "eDP-2"}))
-- Resize tiles relative to the tile you're on
hl.bind(mainMod .. " + left", hl.dsp.window.resize({x = -10, y = 0, relative = true}), {repeating = true})
hl.bind(mainMod .. " + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
hl.bind(mainMod .. " + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
hl.bind(mainMod .. " + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
-- toggle tile layout
hl.bind(mainMod .. " + U", hl.dsp.layout("togglesplit"))

---------------------
--- ZENBOOK-BINDS ---
---------------------
-- Laptop multimedia keys for volume
hl.bind("F3", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true })
hl.bind("F2", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),      { locked = true, repeating = true })
hl.bind("F1", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("F9", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
-- control brightness up and down
hl.bind("F6", hl.dsp.exec_cmd("brightnessctl --device=intel_backlight s +1%"),   { locked = true, repeating = true })
hl.bind("F5", hl.dsp.exec_cmd("brightnessctl --device=intel_backlight s 1%-"),   { locked = true, repeating = true })
--second screen brightness up and down
hl.bind("SHIFT + F6", hl.dsp.exec_cmd("brightnessctl --device=card1-eDP-2-backlight s +1%"),   { locked = true, repeating = true })
hl.bind("SHIFT + F5", hl.dsp.exec_cmd("brightnessctl --device=card1-eDP-2-backlight s 1%-"),   { locked = true, repeating = true })
--disable trackpad
local touchpad_enabled = true
local touchpad_devices = {
    "asus-zenbook-duo-keyboard-touchpad",
    "primax-electronics-ltd.-asus-zenbook-duo-keyboard-touchpad"
}
hl.bind("ALT_R", function()
    touchpad_enabled = not touchpad_enabled
    for _, device in ipairs(touchpad_devices) do
        hl.device({
            name = device,
            enabled = touchpad_enabled
        })
    end
end, { description = "Toggle Laptop Touchpad State" })
--toggle 2nd monitor on and off
local function get_main_brightness()
    local handle = io.popen("brightnessctl -d intel_backlight get")
    if not handle then return 150 end -- Fallback to 150 if the execution fails
    local result = handle:read("*a")
    handle:close()
    local raw_val = tonumber(result:match("%s*(%d+)%s*"))
    if not raw_val then return 150 end -- Safe fallback
    return raw_val
end
hl.bind(secondMod .. " + F23", function()
    if eDP_disabled then
        local target_brightness = get_main_brightness()
        hl.monitor({ output = "eDP-2", disabled = false })
        local cmd = string.format(
            "sleep 0.1 && brightnessctl --device=card1-eDP-2-backlight set %d", 
            target_brightness
        )
        hl.dispatch(hl.dsp.exec_cmd(cmd))
        eDP_disabled = false
    else
        hl.monitor({ output = "eDP-2", disabled = true })
        eDP_disabled = true
    end
end)

---------------------
---- OTHER-BINDS ----
---------------------
-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + M",   hl.dsp.workspace.toggle_special("music"))
hl.bind(secondMod .. " + M", hl.dsp.window.move({ workspace = "special:music" }))
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- ============================================================
-- HELPER: GET TARGET MONITOR NAME ONLY
-- ============================================================
local possibleMonitors = { "HDMI-A-1", "eDP-1", "eDP-2" }

local function get_target_monitor(direction)
    local system_monitors = hl.get_monitors() or {}
    local availableMonitors = {}
    local current_monitor = nil

    -- 1. Filter out which physical monitors are actually active
    for _, possible_name in ipairs(possibleMonitors) do
        for _, sys_mon in ipairs(system_monitors) do
            if sys_mon.name == possible_name then
                table.insert(availableMonitors, possible_name)
                if sys_mon.focused == true then
                    current_monitor = possible_name
                end
                break
            end
        end
    end

    local total_available = #availableMonitors
    if total_available <= 1 then return nil end 

    -- 2. Find where we are standing
    local current_index = nil
    for idx, name in ipairs(availableMonitors) do
        if name == current_monitor then
            current_index = idx
            break
        end
    end
    if not current_index then current_index = 1 end

    -- 3. Calculate target index using modulo
    local target_index
    if direction == "up" then
        target_index = ((current_index - 2) % total_available) + 1
    elseif direction == "down" then
        target_index = (current_index % total_available) + 1
    end

    -- Return only the string name of the target display
    return availableMonitors[target_index]
end

-- ============================================================
-- KEYBINDS
-- ============================================================
-- --- 1. SHIFTING WORKSPACE/MONITOR FOCUS ---
hl.bind(mainMod .. " + O", function()
    local target = get_target_monitor("up")
    if target then hl.dispatch(hl.dsp.focus({ monitor = target })) end
end)

hl.bind(mainMod .. " + I", function()
    local target = get_target_monitor("down")
    if target then hl.dispatch(hl.dsp.focus({ monitor = target })) end
end)

-- --- 2. MOVING ACTIVE WINDOWS TO ADJACENT MONITORS ---
hl.bind(secondMod .. " + O", function()
    local target = get_target_monitor("up")
    if target then hl.dispatch(hl.dsp.window.move({ monitor = target })) end
end)

hl.bind(secondMod .. " + I", function()
    local target = get_target_monitor("down")
    if target then hl.dispatch(hl.dsp.window.move({ monitor = target })) end
end)

-- -- move focus on monitors
-- hl.bind(mainMod .. " + O", hl.dsp.focus({monitor = "eDP-1"}))
-- hl.bind(mainMod .. " + I", hl.dsp.focus({monitor = "eDP-2"}))
-- -- move tiles on monitors
-- hl.bind(secondMod .. " + o", hl.dsp.window.move({monitor = "eDP-1"}))
-- hl.bind(secondMod .. " + I", hl.dsp.window.move({monitor = "eDP-2"}))
