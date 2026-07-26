-- Hyprland cursor configuration for Anya-cursors
hl.env("XCURSOR_THEME", "Anya-cursors")
-- hl.env("XCURSOR_SIZE", "24")
-- Alternative cursor sizes you can use:
-- hl.env("XCURSOR_SIZE", "16") -- Small
-- hl.env("XCURSOR_SIZE", "24") -- Medium (recommended)
-- hl.env("XCURSOR_SIZE", "32") -- Large
hl.env("XCURSOR_SIZE", "48") -- Extra Large
hl.config({ cursor = { no_hardware_cursors = false, default_monitor = "" } })
-- Force cursor reload on startup
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprctl setcursor Anya-cursors 24")
end)
