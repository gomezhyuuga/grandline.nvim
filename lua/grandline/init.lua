-- Grand Line - One Piece Color Scheme for Neovim
-- Inspired by Post-Timeskip & Wano Arc aesthetics

local M = {}

M.config = {
  transparent = false,
  italic_comments = true,
  terminal_colors = true,
  lsp_icons = {},
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  -- Reset highlighting
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "grandline"

  -- Load palette and highlights
  local palette = require("grandline.palette")
  local highlights = require("grandline.highlights")

  -- Apply highlights
  highlights.setup(palette.colors, palette.semantic)

  -- Plugin-specific highlights
  require("grandline.agentic").setup(palette.colors, palette.semantic)

  -- Set terminal colors if enabled
  if M.config.terminal_colors then
    M.set_terminal_colors(palette.colors)
  end
end

function M.set_terminal_colors(c)
  -- ANSI Normal (0-7)
  vim.g.terminal_color_0 = c.blackbeard           -- Black
  vim.g.terminal_color_1 = c.gear_red             -- Red
  vim.g.terminal_color_2 = c.ichimonji       -- Green
  vim.g.terminal_color_3 = c.clima_tact    -- Yellow/Orange
  vim.g.terminal_color_4 = c.all_blue             -- Blue
  vim.g.terminal_color_5 = c.robin    -- Purple
  vim.g.terminal_color_6 = c.radical_beam_cyan    -- Cyan
  vim.g.terminal_color_7 = c.ponegliff_white      -- White

  -- ANSI Bright (8-15)
  vim.g.terminal_color_8 = c.sea_stone            -- Bright Black
  vim.g.terminal_color_9 = c.gear_fifth           -- Bright Red
  vim.g.terminal_color_10 = c.enma_glow           -- Bright Green
  vim.g.terminal_color_11 = c.gol_d           -- Bright Yellow
  vim.g.terminal_color_12 = c.jinbe_tide          -- Bright Blue
  vim.g.terminal_color_13 = c.sakura_bloom        -- Bright Purple
  vim.g.terminal_color_14 = c.soul_king_teal      -- Bright Cyan
  vim.g.terminal_color_15 = c.snow_white          -- Bright White
end

-- Expose colors for external use
M.colors = require("grandline.palette").colors
M.semantic = require("grandline.palette").semantic

return M
