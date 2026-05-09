-- Grand Line - agentic.nvim highlight groups

local M = {}

---@param colors GrandlineColors
---@param colors_semantic GrandlineSemantic
function M.setup(colors, colors_semantic)
  local c = colors

  local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Window title (winbar)
  hi("AgenticTitle", { fg = c.new_world_night, bg = c.jinbe_tide, bold = true })

  -- Diff highlights
  hi("AgenticDiffAdd", { fg = c.enma_glow, bg = "#1a3d2e" })
  hi("AgenticDiffDelete", { fg = c.kabuki_red, bg = "#3d1a1a" })
  hi("AgenticDiffAddWord", { bg = "#1a4d2a", bold = true })
  hi("AgenticDiffDeleteWord", { bg = "#5a2020", bold = true })

  -- Tool call status indicators
  hi("AgenticStatusPending", { fg = c.sakura_bloom, bg = "#2a1f3d" })
  hi("AgenticStatusCompleted", { fg = c.enma_glow, bg = "#1a3d2a" })
  hi("AgenticStatusFailed", { fg = c.gear_fifth, bg = "#3d1a1a" })

  -- Code block fence (left border on tool calls)
  hi("AgenticCodeBlockFence", { fg = c.jinbe_tide })

  -- Spinner status indicators
  hi("AgenticSpinnerGenerating", { fg = c.ichimonji, bold = true })
  hi("AgenticSpinnerThinking", { fg = c.jinbe_tide, bold = true })
  hi("AgenticSpinnerSearching", { fg = c.gol_d, bold = true })
  hi("AgenticSpinnerBusy", { fg = c.clima_tact, bold = true })

  -- Distinct window background for contrast with the editor
  -- Apply via agentic's win_opts config, not autocmd (plugin uses noautocmd)
  hi("AgenticNormal", { fg = c.ponegliff_white, bg = c.calm_belt })
end

return M
