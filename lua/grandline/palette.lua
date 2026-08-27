-- Grand Line - One Piece Color Scheme for Neovim
-- Color Palette Definitions

local M = {}

-- ─────────────────────────────────────────────────────────────
-- Color Utility Functions
-- ─────────────────────────────────────────────────────────────

--- Parse a hex color string to RGB values
---@param hex string Hex color (e.g., "#e63946" or "e63946")
---@return number, number, number r, g, b values (0-255)
function M.hex_to_rgb(hex)
  hex = hex:gsub("^#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

--- Convert RGB values to hex string
---@param r number Red (0-255)
---@param g number Green (0-255)
---@param b number Blue (0-255)
---@return string Hex color string with # prefix
function M.rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

--- Clamp a value between min and max
---@param val number
---@param min number
---@param max number
---@return number
local function clamp(val, min, max)
  return math.max(min, math.min(max, val))
end

--- Lighten a hex color by a percentage
---@param hex string Hex color (e.g., "#e63946")
---@param amount number Percentage to lighten (0-100)
---@return string Lightened hex color
function M.lighten(hex, amount)
  local r, g, b = M.hex_to_rgb(hex)
  local factor = amount / 100
  r = clamp(r + (255 - r) * factor, 0, 255)
  g = clamp(g + (255 - g) * factor, 0, 255)
  b = clamp(b + (255 - b) * factor, 0, 255)
  return M.rgb_to_hex(r, g, b)
end

--- Darken a hex color by a percentage
---@param hex string Hex color (e.g., "#e63946")
---@param amount number Percentage to darken (0-100)
---@return string Darkened hex color
function M.darken(hex, amount)
  local r, g, b = M.hex_to_rgb(hex)
  local factor = 1 - (amount / 100)
  r = clamp(r * factor, 0, 255)
  g = clamp(g * factor, 0, 255)
  b = clamp(b * factor, 0, 255)
  return M.rgb_to_hex(r, g, b)
end

--- Blend two colors together
---@param hex1 string First hex color
---@param hex2 string Second hex color
---@param ratio number Blend ratio (0 = hex1, 1 = hex2)
---@return string Blended hex color
function M.blend(hex1, hex2, ratio)
  ratio = clamp(ratio, 0, 1)
  local r1, g1, b1 = M.hex_to_rgb(hex1)
  local r2, g2, b2 = M.hex_to_rgb(hex2)
  local r = r1 + (r2 - r1) * ratio
  local g = g1 + (g2 - g1) * ratio
  local b = b1 + (b2 - b1) * ratio
  return M.rgb_to_hex(r, g, b)
end

--- Adjust color saturation
---@param hex string Hex color
---@param amount number Percentage to adjust (-100 to 100, negative = desaturate)
---@return string Adjusted hex color
function M.saturate(hex, amount)
  local r, g, b = M.hex_to_rgb(hex)
  local gray = 0.2989 * r + 0.5870 * g + 0.1140 * b
  local factor = 1 + (amount / 100)
  r = clamp(gray + (r - gray) * factor, 0, 255)
  g = clamp(gray + (g - gray) * factor, 0, 255)
  b = clamp(gray + (b - gray) * factor, 0, 255)
  return M.rgb_to_hex(r, g, b)
end

-- ─────────────────────────────────────────────────────────────
-- Color Palette
-- ─────────────────────────────────────────────────────────────

---@class GrandlineColors
M.colors = {
  -- Backgrounds
  new_world_night = "#0d1117",      -- Primary background
  calm_belt = "#161b22",            -- Secondary background / UI panels
  thousand_sunny_deck = "#21262d",  -- Selection / Highlighted lines
  haki_black = "#1a1a2e",           -- Darker accent

  -- Foregrounds
  sea_stone = "#484f58",            -- Muted UI chrome (line numbers, borders)
  gray_terminal = "#7d8590",        -- Comments - Gray Terminal, Goa Kingdom
  log_pose = "#8b949e",             -- Secondary text
  ponegliff_white = "#e6edf3",      -- Primary foreground
  snow_white = "#ffffff",           -- Pure white

  -- ANSI Normal (Straw Hat Crew)
  blackbeard = "#0d1117",           -- Black
  straw = "#e6b422",                -- Primary accent - Luffy's Straw Hat
  gear_red = "#e63946",             -- Red - Luffy's Gear
  ichimonji = "#2d9d4f",            -- Green - Zoro
  clima_tact = "#f77f00",           -- Orange - Nami
  all_blue = "#2f7ebf",             -- Blue - Sanji
  robin = "#9d4edd",                -- Purple - Robin
  radical_beam_cyan = "#00c8d4",    -- Cyan - Franky

  -- ANSI Bright
  gear_fifth = "#ff6b7a",           -- Bright Red - Luffy Awakened
  enma_glow = "#5bda7c",            -- Bright Green - Zoro's Enma
  gol_d = "#fcbf49",                -- Bright Yellow - Wano gold
  jinbe_tide = "#58a6ff",           -- Bright Blue - Jinbe
  sakura_bloom = "#d970c4",         -- Bright Purple - Wano blossoms
  soul_king_teal = "#56d4dd",       -- Bright Cyan - Brook

  -- Extended Accents
  kabuki_red = "#c41e3a",           -- Deep dramatic red
  fire_fist = "#ff4500",            -- Ace's flames - Errors
  beli_gold = "#ffd700",            -- Berry currency
  straw_yellow = "#e6c200",         -- Warnings
  conqueror_lightning = "#9d00ff",  -- Conqueror's Haki
  marine_blue = "#003f87",          -- Navy blue

  -- Utility
  none = "NONE",
}

---@class GrandlineSemantic
M.semantic = {
  bg = M.colors.new_world_night,
  bg_float = M.colors.calm_belt,
  bg_highlight = M.colors.thousand_sunny_deck,
  bg_dark = M.colors.haki_black,

	scroll_thumb = M.colors.gol_d,
	scroll_gutter = M.colors.thousand_sunny_deck,

  fg = M.colors.ponegliff_white,
  fg_muted = M.colors.log_pose,
  fg_dark = M.colors.sea_stone,
  fg_comment = M.colors.gray_terminal,

	border = M.colors.soul_king_teal,
	border_contrast = M.colors.straw,

  primary = M.colors.straw,
  red = M.colors.gear_red,
  green = M.colors.ichimonji,
  yellow = M.colors.gol_d,
  blue = M.colors.all_blue,
  purple = M.colors.robin,
  cyan = M.colors.radical_beam_cyan,
  orange = M.colors.clima_tact,

  bright_red = M.colors.gear_fifth,
  bright_green = M.colors.enma_glow,
  bright_yellow = M.colors.gol_d,
  bright_blue = M.colors.jinbe_tide,
  bright_purple = M.colors.sakura_bloom,
  bright_cyan = M.colors.soul_king_teal,

	dropdown_item_fg = M.colors.gear_fifth,
	dropdown_item_bg = "#4b242c",

  error = M.colors.fire_fist,
  warning = M.colors.straw_yellow,
  info = M.colors.jinbe_tide,
  hint = M.colors.soul_king_teal,
  success = M.colors.enma_glow,

  add = M.colors.enma_glow,
  change = M.colors.gol_d,
  delete = M.colors.kabuki_red,

  -- Diff backgrounds: faint tints of the base background. Kept low-contrast on
  -- purpose so comments and dim syntax stay legible on top of a diff hunk, and
  -- so plugins that brighten these to mark word-level changes (codediff.nvim
  -- scales the line background by 1.4x) still land in a readable range.
  diff_add_bg = M.blend(M.colors.new_world_night, M.colors.ichimonji, 0.17),
  diff_change_bg = M.blend(M.colors.new_world_night, M.colors.gol_d, 0.11),
  diff_delete_bg = M.blend(M.colors.new_world_night, M.colors.kabuki_red, 0.26),
  diff_text_bg = M.blend(M.colors.new_world_night, M.colors.gol_d, 0.22),
  diff_add_text_bg = M.blend(M.colors.new_world_night, M.colors.ichimonji, 0.32),
  diff_delete_text_bg = M.blend(M.colors.new_world_night, M.colors.kabuki_red, 0.46),
}

return M
