local c = require("lua.colors")

-- hyprexpo remains disabled, matching Modules/plugins.conf.
-- if hl.plugin.hyprexpo then
--   hl.plugin.hyprexpo.config({ columns = 3, gap_size = 10, bg_col = c.background, workspace_method = "center current", gesture_distance = 300 })
-- end

-- Hyprglass must already be loaded (for example via hyprpm reload) before this
-- module is evaluated. The guard keeps config verification and plugin-less
-- sessions safe while retaining every active Hyprglass setting.
--
if hl.plugin.hyprglass then
	local hg = hl.plugin.hyprglass
	hg.config({
		default_theme = "dark",
		default_preset = "liquid_glass",
		dark = { brightness = 0.88, contrast = 0.95, vibrancy = 0.25 },
		layers = { enabled = true },
	})
	hg.preset("liquid_glass", {
		glass_opacity = 0.85,
		blur_strength = 2.5,
		blur_iterations = 3,
		refraction_strength = 0.85,
		edge_thickness = 0.08,
		chromatic_aberration = 0.8,
		fresnel_strength = 0.9,
		specular_strength = 0.95,
		lens_distortion = 0.9,
		adaptive_boost = 0.1,
		vibrancy_darkness = 1,
		dark = { tint_color = tonumber(c.background), brightness = 1, contrast = 1.7, saturation = 1, vibrancy = 0.8 },
	})
	hg.layer("waybar", { preset = "liquid_glass", mask_threshold = 0.1 })
	hg.layer("swaync-control-center", { preset = "liquid_glass", mask_threshold = 0.5 })
	hg.layer("wlogout", { preset = "liquid_glass", mask_threshold = 0.5 })
	hg.layer("rofi", { preset = "liquid_glass" })
	hg.layer("swayosd", { preset = "liquid_glass" })
	hg.layer("debug-panel", { exclude = true })
end
