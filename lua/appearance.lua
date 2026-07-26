local c = require("lua.colors")

-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 12,
		border_size = 2,
		-- The legacy alternatives remain commented in Modules/appearance.conf.
		col = {
			active_border = { colors = { c.primary, c.secondary }, angle = 45 },
			inactive_border = c.outline_variant,
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "scrolling",
	},
	decoration = {
		rounding = 25,
		rounding_power = 4,
		active_opacity = 0.90,
		inactive_opacity = 0.80,
		dim_inactive = true,
		dim_strength = 0.1,
		shadow = { enabled = false, range = 15, render_power = 3, color = c.shadow },
		blur = {
			enabled = false,
			size = 6,
			passes = 3,
			new_optimizations = true,
			ignore_opacity = true,
			xray = false,
			vibrancy = 0.1696,
		},
	},
})
