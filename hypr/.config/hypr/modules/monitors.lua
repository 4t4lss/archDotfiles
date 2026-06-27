------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output   = "eDP-1",
    mode     = "2880x1800@120",
    position = "0x0",
    scale    = "1.33",
    vrr = true,
})

hl.monitor({
    output   = "eDP-2",
    disabled = true,
    mode     = "2880x1800@120",
    position = "0x-1800",
    scale    = "1.33",
    vrr = true,
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@120",
    position = "0x1800",
    scale    = "0.83",
})

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

