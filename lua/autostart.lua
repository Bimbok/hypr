local p = require("lua.settings").programs

-- Autostart necessary processes (like notification daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
-- hl.on("hyprland.start", function() hl.exec_cmd(p.terminal) end)
-- hl.on("hyprland.start", function() hl.exec_cmd("nm-applet &") end)
-- hl.on("hyprland.start", function() hl.exec_cmd("wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store & waybar & hyprpaper & firefox") end)
-- hl.on("hyprland.start", function() hl.exec_cmd("hyprpm reload -n") end)
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpm reload -n")
	-- hl.exec_cmd("chillpill-shell")
	hl.exec_cmd(
		"wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store & awww-daemon & hypridle"
	)
	hl.exec_cmd("waybar & swaync & swayosd-server")
	hl.exec_cmd("~/.config/hypr/Scripts/battery_notify.sh")
end)
