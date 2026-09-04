-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
hl.layer_rule({ blur = false, ignore_alpha = 0.5, match = { namespace = "logout_dialog" }, animation = "fade" })
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
hl.layer_rule({ blur = false, ignore_alpha = 0.5, match = { namespace = "swayosd" } })
hl.layer_rule({ blur = false, match = { namespace = "waybar" } })

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
	size = "1200 700",
	center = true,
})

hl.window_rule({
	name = "localsend-float",
	match = { class = "^(org.localsend.localsend_app)$" },
	float = true,
	size = "1200 700",
})

hl.window_rule({
	name = "volume-float",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
	size = "1200 700",
})

hl.window_rule({
	name = "blueman-manager-float",
	match = { class = "^(blueman-manager)$" },
	float = true,
	size = "1200 700",
})

hl.window_rule({
	name = "quick-terminal-float",
	match = { class = "kitty-float" },
	float = true,
	size = "1200 700",
	center = true,
})

hl.window_rule({
	name = "xdg-desktop-portal-gtk",
	match = { class = "xdg-desktop-portal-gtk" },
	float = true,
	size = "1200 700",
	center = true,
})

hl.window_rule({
	name = "hyprland-share-picker",
	match = { class = "hyprland-share-picker" },
	size = "1200 700",
	float = true,
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
