------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

local targetMac = "C3:D7:D1:BF:04:DF"

local function keyboardConnnected(mac)
    local command = string.format("bluetoothctl info %s 2>/dev/null | grep 'Connected: yes'", mac)
    local handle = io.popen(command)
    if not handle then return false end
    local result = handle:read("*a")
    handle:close()

    return (result ~= nil and result ~= "")
end

local btConnected = keyboardConnnected(targetMac)

hl.monitor({
    output   = "eDP-1",
    disabled = false,
    mode     = "2880x1800@60",
    position = "0x0",
    --other valid scale is 1.33
    scale    = "1.5",
    vrr = true,
})

hl.monitor({
    output   = "eDP-2",
    disabled = not btConnected,
    mode     = "2880x1800@60",
    position = "0x-1800",
    --other valid scale is 1.33
    scale    = "1.5",
    vrr = true,
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "0x1800",
    scale    = "1",
    --rotate clcokwise 90 degrees * input
    transform = 0,
})

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

