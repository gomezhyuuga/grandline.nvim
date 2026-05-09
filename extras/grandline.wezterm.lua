-- Grand Line - One Piece Color Scheme for WezTerm
-- Inspired by Post-Timeskip & Wano Arc aesthetics
-- Add to your wezterm.lua config

return {
  -- Backgrounds
  background = "#0d1117",
  foreground = "#e6edf3",

  cursor_bg = "#ff6b7a",
  cursor_fg = "#0d1117",
  cursor_border = "#ff6b7a",

  selection_bg = "#21262d",
  selection_fg = "#e6edf3",

  scrollbar_thumb = "#484f58",
  split = "#21262d",

  -- ANSI Colors
  ansi = {
    "#0d1117", -- Black (Blackbeard)
    "#e63946", -- Red (Gear Red)
    "#2d9d4f", -- Green (Ichimonji)
    "#f77f00", -- Yellow (Clima-Tact Orange)
    "#2f7ebf", -- Blue (All Blue)
    "#9d4edd", -- Magenta (Nico Robin Purple)
    "#00c8d4", -- Cyan (Radical Beam Cyan)
    "#e6edf3", -- White (Ponegliff White)
  },

  -- Bright ANSI Colors
  brights = {
    "#484f58", -- Bright Black (Sea Stone)
    "#ff6b7a", -- Bright Red (Gear Fifth)
    "#5bda7c", -- Bright Green (Enma Glow)
    "#fcbf49", -- Bright Yellow (Gold Leaf)
    "#58a6ff", -- Bright Blue (Jinbe Tide)
    "#d970c4", -- Bright Magenta (Sakura Bloom)
    "#56d4dd", -- Bright Cyan (Soul King Teal)
    "#ffffff", -- Bright White (Snow White)
  },

  -- Tab bar colors (optional)
  tab_bar = {
    background = "#161b22",
    active_tab = {
      bg_color = "#0d1117",
      fg_color = "#e6edf3",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1a1a2e",
      fg_color = "#484f58",
    },
    inactive_tab_hover = {
      bg_color = "#21262d",
      fg_color = "#8b949e",
    },
    new_tab = {
      bg_color = "#161b22",
      fg_color = "#484f58",
    },
    new_tab_hover = {
      bg_color = "#21262d",
      fg_color = "#e6b422",
    },
  },
}
