local p = require("lua.settings").programs
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(p.terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(p.file_manager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(p.fyzenor))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(p.browser))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(p.discord))

-- If it's open, it toggles the scratchpad view.
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd(
		"cliphist list | rofi -dmenu -theme ~/.config/rofi/config-cliphist.rasi | cliphist decode | wl-copy"
	)
)
-- hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("qs ipc -p /usr/share/chillpill-shell call cliphist toggle"))

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(p.menu))
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("qs ipc -p /usr/share/chillpill-shell call appLauncher toggle"))

hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg promote")) -- scrolling
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for workspace = 1, 10 do
	local key = workspace % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Example special workspace (scratchpad)
hl.bind("ALT + S", hl.dsp.workspace.toggle_special("mirage"))
hl.bind("ALT+ SHIFT + S", hl.dsp.window.move({ workspace = "special:mirage" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind(
-- 	"XF86AudioRaiseVolume",
-- 	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioLowerVolume",
-- 	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioMute",
-- 	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioMicMute",
-- 	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
-- 	{ locked = true, repeating = true }
-- )
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true })
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("swayosd-client --brightness raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("swayosd-client --brightness lower"),
	{ locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshot/Window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/Screenshot/Output"))
-- Original setting used the undefined $mainMod_SHIFT variable; it is preserved
-- verbatim in Modules/keybinds.conf rather than silently assigning new behavior.
hl.bind(mainMod .. "+ SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshot/Region"))

-- Lock
hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.exec_cmd("loginctl lock-session"))

-- Notification Center
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("swaync-client -t -sw"))
-- hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("qs ipc -p /usr/share/chillpill-shell call controlCenter toggle"))

-- hyprexpo
-- Cycle forward through windows
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
-- Cycle backward through windows
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ prev = true }))

-- hyprland.lua
hl.bind("SUPER + w", function()
	hl.plugin.scrolloverview.overview("toggle all")
end)

-- gsr
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("gsr toggle"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("gsr toggle --mic"))
hl.bind(mainMod .. " + CTRL + G", hl.dsp.exec_cmd("gsr pause"))
hl.bind(mainMod .. " + SHIFT + F10", hl.dsp.exec_cmd("gsr replay-toggle"))
hl.bind(mainMod .. " + CTRL + F10", hl.dsp.exec_cmd("gsr replay-toggle --mic"))
hl.bind(mainMod .. " + F8", hl.dsp.exec_cmd("gsr replay-10"))
hl.bind(mainMod .. " + F9", hl.dsp.exec_cmd("gsr replay-30"))
hl.bind(mainMod .. " + F10", hl.dsp.exec_cmd("gsr replay-60"))

-- localsend
hl.bind("ALT + W", hl.dsp.exec_cmd("localsend"))

hl.bind("ALT + Q", hl.dsp.exec_cmd("kitty --class kitty-float"))

-- hl.bind(mainMod .. "+ SHIFT + W", hl.dsp.exec_cmd("qs ipc -p /usr/share/chillpill-shell call wallpaperSwitcher toggle"))
-- hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("qs ipc -p /usr/share/chillpill-shell call miniDashboard toggle"))
