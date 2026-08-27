-- Grand Line - Hyprland Color Theme
-- A dark, vibrant color scheme inspired by One Piece (Post-Timeskip & Wano Arc)
-- https://github.com/gomezhyuuga/grandline.nvim
--
-- Colors only: no gaps, rounding, blur, animations or keybinds are touched, so
-- this is safe to require after your own appearance config.
--
--   require("grandline").setup()
--
-- Options (all default to true unless noted):
--   borders     window border colors
--   shadows     decoration shadow colors
--   groups      group border + groupbar colors
--   background  misc.background_color (shown behind windows)
--   accent      name of the active-border gradient, see M.accents ("kabuki_tide")
--   gradients   use the accent's two stops; false = flat, first stop only
--   angle       gradient angle in degrees (default 45)

-- Resolve the sibling module regardless of what the directory is named.
local palette = require((... or "grandline") .. ".palette")

local M = {}

M.colors = palette.colors
M.rgba = palette.rgba
M.gradient = palette.gradient

--- Named two-stop gradients for the active window border.
M.accents = {
	kabuki_tide = { { "kabuki_red", "ee" }, { "all_blue", "ee" } }, -- deep red into Sanji's blue
	wano_night = { { "marine_blue", "ee" }, { "kabuki_red", "ee" } }, -- navy burning into red
	straw = { { "straw", "ee" }, { "gear_red", "ee" } }, -- the original, warmest
	devil_fruit = { { "robin", "ee" }, { "sakura_bloom", "ee" } }, -- purple into pink
	all_blue = { { "soul_king_teal", "ee" }, { "jinbe_tide", "ee" } }, -- teal into blue
	conqueror = { { "gear_red", "ee" }, { "robin", "ee" } }, -- red into purple
	enma = { { "enma_glow", "ee" }, { "soul_king_teal", "ee" } }, -- green into teal
	zoro = { { "ichimonji", "ee" }, { "all_blue", "ee" } }, -- deep green into blue
	gear_fifth = { { "gear_fifth", "ee" }, { "sakura_bloom", "ee" } }, -- coral into magenta
}

M.defaults = {
	borders = true,
	shadows = true,
	groups = true,
	background = true,
	accent = "kabuki_tide",
	gradients = true,
	angle = 45,
}

local rgba = palette.rgba
local gradient = palette.gradient

--- The active window accent, per opts.accent.
local function active_accent(opts)
	local stops = M.accents[opts.accent]
	if not stops then
		error("grandline: unknown accent '" .. tostring(opts.accent) .. "'")
	end
	if opts.gradients then
		return gradient(stops, opts.angle)
	end
	return rgba(stops[1][1], stops[1][2])
end

--- Locked groups burn orange-red: fire_fist -> clima_tact.
local function locked_accent(opts)
	if opts.gradients then
		return gradient({ { "fire_fist", "ee" }, { "clima_tact", "ee" } }, opts.angle)
	end
	return rgba("fire_fist", "ee")
end

--- @param opts table|nil see M.defaults
function M.setup(opts)
	opts = opts or {}
	for key, value in pairs(M.defaults) do
		if opts[key] == nil then
			opts[key] = value
		end
	end

	local config = {}

	if opts.borders then
		config.general = {
			col = {
				active_border = active_accent(opts),
				inactive_border = rgba("thousand_sunny_deck", "aa"),
				nogroup_border = rgba("sea_stone", "aa"),
				nogroup_border_active = rgba("gol_d", "ee"),
			},
		}
	end

	if opts.shadows then
		config.decoration = {
			shadow = {
				color = rgba("new_world_night", "ff"),
				color_inactive = rgba("haki_black", "aa"),
			},
		}
	end

	if opts.groups then
		config.group = {
			col = {
				border_active = active_accent(opts),
				border_inactive = rgba("thousand_sunny_deck", "aa"),
				border_locked_active = locked_accent(opts),
				border_locked_inactive = rgba("ember_shade", "aa"),
			},
			groupbar = {
				text_color = rgba("ponegliff_white", "ff"),
				text_color_inactive = rgba("log_pose", "ff"),
				text_color_locked_active = rgba("new_world_night", "ff"),
				text_color_locked_inactive = rgba("log_pose", "ff"),
				col = {
					active = rgba("gear_red", "ff"),
					inactive = rgba("calm_belt", "ff"),
					locked_active = rgba("fire_fist", "ff"),
					locked_inactive = rgba("haki_black", "ff"),
				},
			},
		}
	end

	if opts.background then
		config.misc = {
			background_color = rgba("new_world_night", "ff"),
		}
	end

	hl.config(config)

	return M
end

return M
