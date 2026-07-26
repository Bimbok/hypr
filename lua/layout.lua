-- See the Dwindle, Scrolling, and Master layout documentation.
hl.config({
  dwindle = { preserve_split = true }, -- You probably want this
  scrolling = { fullscreen_on_one_column = true, column_width = .90, follow_focus = true, focus_fit_method = 1, explicit_column_widths = ".75, .75, .75, .75" },
  master = { new_status = "master" },
})
