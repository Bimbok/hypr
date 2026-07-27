-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
hl.layer_rule({ blur = false, ignore_alpha = 0.5, match = { namespace = "wlogout" } })
hl.layer_rule({ blur = false, animation = "slide left", match = { namespace = "rofi" } })
hl.layer_rule({
	blur = false,
	ignore_alpha = 0.5,
	animation = "slide top",
	dim_around = false,
	match = { namespace = "swaync-control-center" },
})
hl.layer_rule({
	blur = false,
	ignore_alpha = 0.5,
	dim_around = false,
	match = { namespace = "swaync-notification-window" },
})
hl.layer_rule({ blur = false, ignore_alpha = 0.5, match = { class = "swayosd" } })
hl.layer_rule({ blur = false, match = { class = "waybar" } })

hl.window_rule({ name = "rofi-float", match = { class = "^([Rr]ofi)$" }, float = true })
hl.window_rule({ name = "rofi-pin", match = { class = "^([Rr]ofi)$" }, pin = true })
hl.window_rule({ name = "rofi-center", match = { class = "^([Rr]ofi)$" }, center = true })

-- Example windowrule
-- hl.window_rule({ name = "kitty-float", match = { class = "^(kitty)$", title = "^(kitty)$" }, float = true })

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({ name = "suppress-maximize-events", match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({
	name = "discord-special-magic",
	match = { class = "^(discord)$" },
	workspace = "special:magic",
	float = true,
	size = "1435 776",
	move = "236 236",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})
hl.config({ xwayland = { force_zero_scaling = true } })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only" — uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ name = "no-gaps-wtv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
-- hl.window_rule({ name = "no-gaps-f1", match = { float = false, workspace = "f[1]" }, border_size = 0, rounding = 0 })
