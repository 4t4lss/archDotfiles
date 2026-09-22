-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

local theme = require("modules.themes.active")
local animation = require("modules.animations.active")

hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 0,

        border_size = 1,

        col = {
            active_border   = theme.border_active,
            inactive_border = theme.border_inactive,
        },

        resize_on_border = false,
        allow_tearing = false,

    },

    decoration = {
        rounding       = 3,
        rounding_power = 4,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = .75,
        fullscreen_opacity = 1,
        dim_inactive = false,

        blur = {
            enabled   = animation.animations_enabled,
            size      = 4,
            passes    = 2,
            ignore_opacity = true,
            new_optimizations = true,
            xray = true,
            noise = 0.0117,
            contrast = 1.5,
            brightness = 1.5,
            vibrancy  = 0.1696,
            vibrancy_darkness = 0,
            special = false,
            popups = false,
        },

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            -- color        = 0xee1a1a1a,
        },

        glow = {
            enabled = false,
        },
    },

    animations = {
        enabled = animation.animations_enabled,
        -- enabled = true
    },
})


-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 99.2633, dampening = 16.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 0.2, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 0.79, spring = "easy" })
hl.animation({ leaf = "windowsMove",   enabled = true,  speed = 5,    bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 1.0,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.0,  bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 1.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 1.5,  bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

