-- Grand Line - Hyprland palette
-- Mirrors lua/grandline/palette.lua from https://github.com/gomezhyuuga/grandline.nvim
-- Hex values are stored bare (no leading '#') so they compose directly into
-- Hyprland's rgba()/rgb() color strings.

local M = {}

M.colors = {
	-- Backgrounds
	new_world_night = "0d1117", -- Primary background
	calm_belt = "161b22", -- Secondary background / UI panels
	thousand_sunny_deck = "21262d", -- Selection / Highlighted lines
	haki_black = "1a1a2e", -- Darker accent

	-- Foregrounds
	sea_stone = "484f58", -- Comments / Muted text
	log_pose = "8b949e", -- Secondary text
	ponegliff_white = "e6edf3", -- Primary foreground
	snow_white = "ffffff",

	-- ANSI normal
	straw = "e6b422", -- Luffy's Straw Hat
	gear_red = "e63946", -- Luffy's Gear
	ichimonji = "2d9d4f", -- Zoro
	clima_tact = "f77f00", -- Nami
	all_blue = "2f7ebf", -- Sanji
	robin = "9d4edd", -- Robin
	radical_beam_cyan = "00c8d4", -- Franky

	-- ANSI bright
	gear_fifth = "ff6b7a",
	enma_glow = "5bda7c",
	gol_d = "fcbf49", -- Wano gold
	jinbe_tide = "58a6ff",
	sakura_bloom = "d970c4",
	soul_king_teal = "56d4dd", -- Brook

	-- Extended
	kabuki_red = "c41e3a",
	fire_fist = "ff4500",
	beli_gold = "ffd700",
	straw_yellow = "e6c200",
	conqueror_lightning = "9d00ff",
	marine_blue = "003f87",
	ember_shade = "4b242c", -- Muted gear_fifth backdrop
}

--- Build a Hyprland color string.
--- @param name string key of M.colors
--- @param alpha string|nil two hex digits, e.g. "ee"; omitted yields rgb()
--- @return string
function M.rgba(name, alpha)
	local hex = M.colors[name]
	if not hex then
		error("grandline: unknown color '" .. tostring(name) .. "'")
	end
	if alpha then
		return "rgba(" .. hex .. alpha .. ")"
	end
	return "rgb(" .. hex .. ")"
end

--- Build an HL.Gradient from a list of {name, alpha} pairs.
--- @param stops table list of { name, alpha }
--- @param angle number|nil degrees, defaults to 45
--- @return table
function M.gradient(stops, angle)
	local colors = {}
	for i, stop in ipairs(stops) do
		colors[i] = M.rgba(stop[1], stop[2])
	end
	return { colors = colors, angle = angle or 45 }
end

return M
