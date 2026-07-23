---------------
---- INPUT ----
---------------


hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_options = "caps:swapescape,fkeys:basic_13-24",
        kb_rules   = "",
        repeat_rate = 45,
        repeat_delay = 200,
        accel_profile = "flat",
        follow_mouse = 1,
        sensitivity = .15, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            disable_while_typing = true,
            natural_scroll = true,
            scroll_factor = .2,
            tap_to_click = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
