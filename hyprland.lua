-- Native Hyprland Lua configuration (Hyprland 0.55+).
--
-- The original Hyprlang configuration remains in hyprland.conf and Modules/.
-- It is deliberately retained, including every commented setting, as a
-- non-destructive reference while this Lua configuration is used.

require("lua.monitor")
require("lua.cursor")
require("lua.environment")
require("lua.permissions")
require("lua.appearance")
require("lua.animations")
require("lua.layout")
require("lua.misc")
require("lua.input")
require("lua.keybinds")
require("lua.windowrules")
require("lua.plugins")
require("lua.autostart")
-- require("lua.debug") -- Migrated Modules/debug.conf; formerly not sourced.
