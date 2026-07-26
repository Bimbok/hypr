-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.config({ animations = { enabled = true } })
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
-- Fluid & Bouncy curves
hl.curve("fluid", { type = "bezier", points = { {0.08, 0.95}, {0.2, 1.12} } })
hl.curve("md3_decel", { type = "bezier", points = { {0.12, 0.8}, {0.2, 1} } })
hl.curve("md3_accel", { type = "bezier", points = { {0.25, 0.05}, {0.4, 0.2} } })
hl.curve("md3_bounce", { type = "bezier", points = { {0.12, 0.9}, {0.2, 1.08} } })
for _, animation in ipairs({
  { leaf = "global", enabled = true, speed = 10, bezier = "default" },
  { leaf = "border", enabled = true, speed = 10, bezier = "default" },
  { leaf = "borderangle", enabled = true, speed = 8, bezier = "default" },
  { leaf = "windows", enabled = true, speed = 7, bezier = "fluid" },
  { leaf = "windowsIn", enabled = true, speed = 6, bezier = "md3_decel", style = "popin 10%" },
  { leaf = "windowsOut", enabled = true, speed = 6, bezier = "md3_accel", style = "popin 10%" },
  { leaf = "windowsMove", enabled = true, speed = 7, bezier = "fluid" },
  { leaf = "fadeIn", enabled = true, speed = 7, bezier = "default" },
  { leaf = "fadeOut", enabled = true, speed = 7, bezier = "default" },
  { leaf = "fade", enabled = true, speed = 7, bezier = "default" },
  { leaf = "workspaces", enabled = true, speed = 7, bezier = "fluid", style = "slidevert" },
  { leaf = "workspacesIn", enabled = true, speed = 7, bezier = "fluid", style = "slidevert" },
  { leaf = "workspacesOut", enabled = true, speed = 7, bezier = "fluid", style = "slidevert" },
  { leaf = "specialWorkspace", enabled = true, speed = 6, bezier = "md3_bounce", style = "slidevert" },
  { leaf = "layers", enabled = true, speed = 6, bezier = "md3_decel", style = "fade" },
  { leaf = "layersIn", enabled = true, speed = 6, bezier = "md3_decel", style = "slide" },
  { leaf = "layersOut", enabled = true, speed = 6, bezier = "md3_accel", style = "slide" },
}) do hl.animation(animation) end
