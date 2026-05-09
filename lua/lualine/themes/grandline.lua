-- Grand Line - Lualine Theme
-- One Piece inspired status line colors

local colors = {
  new_world_night = "#0d1117",
  calm_belt = "#161b22",
  thousand_sunny_deck = "#21262d",
  haki_black = "#1a1a2e",
  sea_stone = "#484f58",
  log_pose = "#8b949e",
  ponegliff_white = "#e6edf3",
  straw = "#e6b422",
  ichimonji = "#2d9d4f",
  clima_tact = "#f77f00",
  all_blue = "#2f7ebf",
  robin = "#9d4edd",
  gol_d = "#fcbf49",
  jinbe_tide = "#58a6ff",
}

return {
  normal = {
    a = { fg = colors.new_world_night, bg = colors.straw, gui = "bold" },
    b = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
    c = { fg = colors.log_pose, bg = colors.calm_belt },
    z = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
  },
  insert = {
    a = { fg = colors.new_world_night, bg = colors.ichimonji, gui = "bold" },
    b = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
    c = { fg = colors.log_pose, bg = colors.calm_belt },
    z = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
  },
  visual = {
    a = { fg = colors.new_world_night, bg = colors.robin, gui = "bold" },
    b = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
    c = { fg = colors.log_pose, bg = colors.calm_belt },
    z = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
  },
  replace = {
    a = { fg = colors.new_world_night, bg = colors.clima_tact, gui = "bold" },
    b = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
    c = { fg = colors.log_pose, bg = colors.calm_belt },
    z = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
  },
  command = {
    a = { fg = colors.new_world_night, bg = colors.gol_d, gui = "bold" },
    b = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
    c = { fg = colors.log_pose, bg = colors.calm_belt },
    z = { fg = colors.ponegliff_white, bg = colors.thousand_sunny_deck },
  },
  inactive = {
    a = { fg = colors.sea_stone, bg = colors.haki_black },
    b = { fg = colors.sea_stone, bg = colors.haki_black },
    c = { fg = colors.sea_stone, bg = colors.haki_black },
    z = { fg = colors.sea_stone, bg = colors.haki_black },
  },
}
