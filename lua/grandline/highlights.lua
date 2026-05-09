-- Grand Line - One Piece Color Scheme for Neovim
-- Highlight Group Definitions

local M = {}

---@param colors GrandlineColors
---@param colors_semantic GrandlineSemantic
function M.setup(colors, colors_semantic)
	local c = colors
	local c_sem = colors_semantic

	-- Helper function to set highlights
	local function hi(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- ============================================
	-- Editor UI
	-- ============================================

	-- Basic UI
	hi("Normal", { fg = c.ponegliff_white, bg = c.new_world_night })
	hi("NormalFloat", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("FloatBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("FloatTitle", { fg = c.straw, bg = c.calm_belt, bold = true })
	hi("Cursor", { fg = c.new_world_night, bg = c.gear_fifth })
	hi("CursorLine", { bg = c.thousand_sunny_deck })
	hi("CursorColumn", { bg = c.thousand_sunny_deck })
	hi("ColorColumn", { bg = c.calm_belt })
	hi("LineNr", { fg = c.sea_stone, bg = c.new_world_night })
	hi("CursorLineNr", { fg = c.gol_d, bg = c.thousand_sunny_deck, bold = true })
	hi("SignColumn", { fg = c.sea_stone, bg = c.new_world_night })
	hi("FoldColumn", { fg = c.sea_stone, bg = c.new_world_night })
	hi("Folded", { fg = c.log_pose, bg = c.calm_belt })
	hi("VertSplit", { fg = c.straw, bg = "NONE" })
	hi("WinSeparator", { fg = c.straw, bg = "NONE" })

	-- Status Line
	hi("StatusLine", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("StatusLineNC", { fg = c.sea_stone, bg = c.haki_black })
	hi("WildMenu", { fg = c.new_world_night, bg = c.gol_d })

	-- Tab Line
	hi("TabLine", { fg = c.sea_stone, bg = c.haki_black })
	hi("TabLineFill", { bg = c.calm_belt })
	hi("TabLineSel", { fg = c.ponegliff_white, bg = c.new_world_night, bold = true })

	-- Search & Visual
	hi("Search", { fg = c.new_world_night, bg = c.beli_gold })
	hi("IncSearch", { fg = c.new_world_night, bg = c.clima_tact })
	hi("CurSearch", { fg = c.ponegliff_white, bg = c.robin })
	hi("Visual", { fg = c.gear_fifth, bg = c_sem.dropdown_item_bg })
	hi("VisualNOS", { bg = c.thousand_sunny_deck })

	-- Popup Menu (Autocomplete)
	hi("Pmenu", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("PmenuSel", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })
	hi("PmenuSbar", { bg = c.calm_belt })
	hi("PmenuThumb", { bg = c.sea_stone })

	-- Messages
	hi("ErrorMsg", { fg = c.fire_fist, bold = true })
	hi("WarningMsg", { fg = c.straw_yellow, bold = true })
	hi("ModeMsg", { fg = c.enma_glow, bold = true })
	hi("MoreMsg", { fg = c.enma_glow })
	hi("Question", { fg = c.jinbe_tide })

	-- Diff
	hi("DiffAdd", { fg = c.enma_glow, bg = "#1a3d2e" })
	hi("DiffChange", { fg = c.gol_d, bg = "#3d3d1a" })
	hi("DiffDelete", { fg = c.kabuki_red, bg = "#3d1a1a" })
	hi("DiffText", { fg = c.clima_tact, bg = "#3d2a1a", bold = true })

	-- Spelling
	hi("SpellBad", { undercurl = true, sp = c.fire_fist })
	hi("SpellCap", { undercurl = true, sp = c.straw_yellow })
	hi("SpellLocal", { undercurl = true, sp = c.jinbe_tide })
	hi("SpellRare", { undercurl = true, sp = c.sakura_bloom })

	-- Misc UI
	hi("Directory", { fg = c.jinbe_tide })
	hi("MatchParen", { fg = c.blackbeard, bg = c.straw_yellow, bold = true })
	hi("SpecialKey", { fg = c.sea_stone })
	hi("Title", { fg = c.straw, bold = true })
	hi("NonText", { fg = c.sea_stone })
	hi("Conceal", { fg = c.sea_stone })
	hi("EndOfBuffer", { fg = c.sea_stone })
	hi("Whitespace", { fg = c.thousand_sunny_deck })

	-- ============================================
	-- Syntax Highlighting
	-- ============================================

	-- Comments
	hi("Comment", { fg = c.sea_stone, italic = true })

	-- Constants
	hi("Constant", { fg = c.gol_d })
	hi("String", { fg = c.clima_tact })
	hi("Character", { fg = c.clima_tact })
	hi("Number", { fg = c.gol_d })
	hi("Boolean", { fg = c.gol_d })
	hi("Float", { fg = c.gol_d })

	-- Identifiers
	hi("Identifier", { fg = c.ponegliff_white })
	hi("Function", { fg = c.ichimonji })

	-- Statements
	hi("Statement", { fg = c.straw })
	hi("Conditional", { fg = c.straw })
	hi("Repeat", { fg = c.straw })
	hi("Label", { fg = c.straw })
	hi("Operator", { fg = c.log_pose })
	hi("Keyword", { fg = c.straw })
	hi("Exception", { fg = c.straw })

	-- Preprocessor
	hi("PreProc", { fg = c.sakura_bloom })
	hi("Include", { fg = c.sakura_bloom })
	hi("Define", { fg = c.sakura_bloom })
	hi("Macro", { fg = c.sakura_bloom })
	hi("PreCondit", { fg = c.sakura_bloom })

	-- Types
	hi("Type", { fg = c.all_blue })
	hi("StorageClass", { fg = c.all_blue })
	hi("Structure", { fg = c.all_blue })
	hi("Typedef", { fg = c.all_blue })

	-- Special
	hi("Special", { fg = c.radical_beam_cyan })
	hi("SpecialChar", { fg = c.clima_tact })
	hi("Tag", { fg = c.straw })
	hi("Delimiter", { fg = c.log_pose })
	hi("SpecialComment", { fg = c.sea_stone, bold = true })
	hi("Debug", { fg = c.fire_fist })

	-- Underlined, Bold, Italic
	hi("Underlined", { fg = c.jinbe_tide, underline = true })
	hi("Bold", { bold = true })
	hi("Italic", { italic = true })

	-- Ignore & Error
	hi("Ignore", { fg = c.sea_stone })
	hi("Error", { fg = c.fire_fist, bold = true })
	hi("Todo", { fg = c.new_world_night, bg = c.straw_yellow, bold = true })

	-- ============================================
	-- Treesitter
	-- ============================================

	-- Identifiers
	hi("@variable", { fg = c.ponegliff_white })
	hi("@variable.builtin", { fg = c.gear_fifth })
	hi("@variable.parameter", { fg = c.ponegliff_white, italic = true })
	hi("@variable.member", { fg = c.radical_beam_cyan })

	hi("@constant", { fg = c.gol_d })
	hi("@constant.builtin", { fg = c.gol_d })
	hi("@constant.macro", { fg = c.gol_d })

	hi("@module", { fg = c.jinbe_tide })
	hi("@label", { fg = c.straw })

	-- Literals
	hi("@string", { fg = c.clima_tact })
	hi("@string.documentation", { fg = c.clima_tact, italic = true })
	hi("@string.regex", { fg = c.sakura_bloom })
	hi("@string.escape", { fg = c.gol_d })
	hi("@string.special", { fg = c.gol_d })

	hi("@character", { fg = c.clima_tact })
	hi("@character.special", { fg = c.gol_d })

	hi("@boolean", { fg = c.gol_d })
	hi("@number", { fg = c.gol_d })
	hi("@number.float", { fg = c.gol_d })

	-- Types
	hi("@type", { fg = c.all_blue })
	hi("@type.builtin", { fg = c.all_blue })
	hi("@type.definition", { fg = c.all_blue })
	hi("@type.qualifier", { fg = c.straw })

	hi("@attribute", { fg = c.robin })
	hi("@property", { fg = c.radical_beam_cyan })

	-- Functions
	hi("@function", { fg = c.ichimonji })
	hi("@function.builtin", { fg = c.ichimonji })
	hi("@function.call", { fg = c.ichimonji })
	hi("@function.macro", { fg = c.sakura_bloom })
	hi("@function.method", { fg = c.ichimonji })
	hi("@function.method.call", { fg = c.ichimonji })

	hi("@constructor", { fg = c.all_blue })

	-- Keywords
	hi("@keyword", { fg = c.gear_red })
	hi("@keyword.coroutine", { fg = c.straw })
	hi("@keyword.function", { fg = c.straw })
	hi("@keyword.operator", { fg = c.straw })
	hi("@keyword.import", { fg = c.gear_red })
	hi("@keyword.storage", { fg = c.straw })
	hi("@keyword.repeat", { fg = c.straw })
	hi("@keyword.return", { fg = c.straw })
	hi("@keyword.debug", { fg = c.fire_fist })
	hi("@keyword.exception", { fg = c.straw })
	hi("@keyword.conditional", { fg = c.straw })
	hi("@keyword.conditional.ternary", { fg = c.straw })
	hi("@keyword.directive", { fg = c.sakura_bloom })
	hi("@keyword.directive.define", { fg = c.sakura_bloom })

	-- Punctuation
	hi("@punctuation.delimiter", { fg = c.log_pose })
	hi("@punctuation.bracket", { fg = c.log_pose })
	hi("@punctuation.special", { fg = c.log_pose })

	-- Comments
	hi("@comment", { fg = c.sea_stone, italic = true })
	hi("@comment.documentation", { fg = c.sea_stone, italic = true })
	hi("@comment.error", { fg = c.fire_fist, bold = true })
	hi("@comment.warning", { fg = c.straw_yellow, bold = true })
	hi("@comment.todo", { fg = c.new_world_night, bg = c.straw_yellow, bold = true })
	hi("@comment.note", { fg = c.new_world_night, bg = c.jinbe_tide, bold = true })

	-- Markup
	hi("@markup.strong", { bold = true })
	hi("@markup.italic", { italic = true })
	hi("@markup.strikethrough", { strikethrough = true })
	hi("@markup.underline", { underline = true })
	hi("@markup.heading", { fg = c.straw, bold = true })
	hi("@markup.quote", { fg = c.log_pose, italic = true })
	hi("@markup.math", { fg = c.gol_d })
	hi("@markup.environment", { fg = c.sakura_bloom })
	hi("@markup.link", { fg = c.jinbe_tide, underline = true })
	hi("@markup.link.label", { fg = c.jinbe_tide })
	hi("@markup.link.url", { fg = c.jinbe_tide, underline = true })
	hi("@markup.raw", { fg = c.clima_tact })
	hi("@markup.list", { fg = c.straw })
	hi("@markup.list.checked", { fg = c.enma_glow })
	hi("@markup.list.unchecked", { fg = c.sea_stone })

	-- Diff
	hi("@diff.plus", { fg = c.enma_glow })
	hi("@diff.minus", { fg = c.kabuki_red })
	hi("@diff.delta", { fg = c.gol_d })

	-- Tags (HTML/JSX)
	hi("@tag", { fg = c.straw })
	hi("@tag.attribute", { fg = c.radical_beam_cyan })
	hi("@tag.delimiter", { fg = c.log_pose })
	hi("@tag.builtin.tsx", { fg = c.all_blue })

	-- ============================================
	-- LSP Semantic Tokens
	-- ============================================

	hi("@lsp.type.class", { fg = c.all_blue })
	hi("@lsp.type.decorator", { fg = c.robin })
	hi("@lsp.type.enum", { fg = c.all_blue })
	hi("@lsp.type.enumMember", { fg = c.gol_d })
	hi("@lsp.type.function", { fg = c.ichimonji })
	hi("@lsp.type.interface", { fg = c.all_blue })
	hi("@lsp.type.macro", { fg = c.sakura_bloom })
	hi("@lsp.type.method", { fg = c.ichimonji })
	hi("@lsp.type.namespace", { fg = c.jinbe_tide })
	hi("@lsp.type.parameter", { fg = c.ponegliff_white, italic = true })
	hi("@lsp.type.property", { fg = c.radical_beam_cyan })
	hi("@lsp.type.struct", { fg = c.all_blue })
	hi("@lsp.type.type", { fg = c.all_blue })
	hi("@lsp.type.typeParameter", { fg = c.all_blue, italic = true })
	hi("@lsp.type.variable", { fg = c.ponegliff_white })

	-- ============================================
	-- Diagnostics
	-- ============================================

	hi("DiagnosticError", { fg = c.fire_fist })
	hi("DiagnosticWarn", { fg = c.straw_yellow })
	hi("DiagnosticInfo", { fg = c.jinbe_tide })
	hi("DiagnosticHint", { fg = c.soul_king_teal })
	hi("DiagnosticOk", { fg = c.enma_glow })

	hi("DiagnosticVirtualTextError", { fg = c.fire_fist, bg = "#2d1a1a", italic = true })
	hi("DiagnosticVirtualTextWarn", { fg = c.straw_yellow, bg = "#2d2a1a", italic = true })
	hi("DiagnosticVirtualTextInfo", { fg = c.jinbe_tide, bg = "#1a2a2d", italic = true })
	hi("DiagnosticVirtualTextHint", { fg = c.soul_king_teal, bg = "#1a2d2d", italic = true })
	hi("DiagnosticVirtualTextOk", { fg = c.enma_glow, bg = "#1a2d1a", italic = true })

	hi("DiagnosticUnderlineError", { undercurl = true, sp = c.fire_fist })
	hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.straw_yellow })
	hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.jinbe_tide })
	hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.soul_king_teal })
	hi("DiagnosticUnderlineOk", { undercurl = true, sp = c.enma_glow })

	hi("DiagnosticFloatingError", { fg = c.fire_fist })
	hi("DiagnosticFloatingWarn", { fg = c.straw_yellow })
	hi("DiagnosticFloatingInfo", { fg = c.jinbe_tide })
	hi("DiagnosticFloatingHint", { fg = c.soul_king_teal })
	hi("DiagnosticFloatingOk", { fg = c.enma_glow })

	hi("DiagnosticSignError", { fg = c.fire_fist })
	hi("DiagnosticSignWarn", { fg = c.straw_yellow })
	hi("DiagnosticSignInfo", { fg = c.jinbe_tide })
	hi("DiagnosticSignHint", { fg = c.soul_king_teal })
	hi("DiagnosticSignOk", { fg = c.enma_glow })

	-- ============================================
	-- Git Signs
	-- ============================================

	hi("GitSignsAdd", { fg = c.enma_glow })
	hi("GitSignsChange", { fg = c.gol_d })
	hi("GitSignsDelete", { fg = c.kabuki_red })
	hi("GitSignsAddNr", { fg = c.enma_glow })
	hi("GitSignsChangeNr", { fg = c.gol_d })
	hi("GitSignsDeleteNr", { fg = c.kabuki_red })
	hi("GitSignsAddLn", { bg = "#1a3d2e" })
	hi("GitSignsChangeLn", { bg = "#3d3d1a" })
	hi("GitSignsDeleteLn", { bg = "#3d1a1a" })

	-- ============================================
	-- Telescope
	-- ============================================

	hi("TelescopeNormal", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("TelescopeBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("TelescopeTitle", { fg = c.straw, bold = true })
	hi("TelescopePromptNormal", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })
	hi("TelescopePromptBorder", { fg = c.thousand_sunny_deck, bg = c.thousand_sunny_deck })
	hi("TelescopePromptTitle", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("TelescopePromptPrefix", { fg = c.straw })
	hi("TelescopePromptCounter", { fg = c.sea_stone })
	hi("TelescopeResultsNormal", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("TelescopeResultsBorder", { fg = c.calm_belt, bg = c.calm_belt })
	hi("TelescopeResultsTitle", { fg = c.calm_belt, bg = c.calm_belt })
	hi("TelescopePreviewNormal", { fg = c.ponegliff_white, bg = c.new_world_night })
	hi("TelescopePreviewBorder", { fg = c.new_world_night, bg = c.new_world_night })
	hi("TelescopePreviewTitle", { fg = c.new_world_night, bg = c.ichimonji, bold = true })
	hi("TelescopeSelection", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })
	hi("TelescopeSelectionCaret", { fg = c.straw, bg = c.thousand_sunny_deck })
	hi("TelescopeMatching", { fg = c.clima_tact, bold = true })

	-- ============================================
	-- Neo-tree
	-- ============================================

	hi("NeoTreeNormal", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("NeoTreeNormalNC", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("NeoTreeDirectoryName", { fg = c.jinbe_tide })
	hi("NeoTreeDirectoryIcon", { fg = c.gol_d })
	hi("NeoTreeRootName", { fg = c.straw, bold = true })
	hi("NeoTreeFileName", { fg = c.ponegliff_white })
	hi("NeoTreeFileIcon", { fg = c.log_pose })
	hi("NeoTreeGitAdded", { fg = c.enma_glow })
	hi("NeoTreeGitModified", { fg = c.gol_d })
	hi("NeoTreeGitDeleted", { fg = c.kabuki_red })
	hi("NeoTreeGitUntracked", { fg = c.clima_tact })
	hi("NeoTreeIndentMarker", { fg = c.thousand_sunny_deck })
	hi("NeoTreeCursorLine", { bg = c.thousand_sunny_deck })

	-- ============================================
	-- nvim-cmp
	-- ============================================

	hi("CmpItemAbbr", { fg = c.ponegliff_white })
	hi("CmpItemAbbrDeprecated", { fg = c.sea_stone, strikethrough = true })
	hi("CmpItemAbbrMatch", { fg = c.clima_tact, bold = true })
	hi("CmpItemAbbrMatchFuzzy", { fg = c.clima_tact })
	hi("CmpItemMenu", { fg = c.sea_stone })
	hi("CmpItemKindText", { fg = c.log_pose })
	hi("CmpItemKindMethod", { fg = c.ichimonji })
	hi("CmpItemKindFunction", { fg = c.ichimonji })
	hi("CmpItemKindConstructor", { fg = c.all_blue })
	hi("CmpItemKindField", { fg = c.radical_beam_cyan })
	hi("CmpItemKindVariable", { fg = c.ponegliff_white })
	hi("CmpItemKindClass", { fg = c.all_blue })
	hi("CmpItemKindInterface", { fg = c.all_blue })
	hi("CmpItemKindModule", { fg = c.jinbe_tide })
	hi("CmpItemKindProperty", { fg = c.radical_beam_cyan })
	hi("CmpItemKindUnit", { fg = c.gol_d })
	hi("CmpItemKindValue", { fg = c.gol_d })
	hi("CmpItemKindEnum", { fg = c.all_blue })
	hi("CmpItemKindKeyword", { fg = c.straw })
	hi("CmpItemKindSnippet", { fg = c.robin })
	hi("CmpItemKindColor", { fg = c.sakura_bloom })
	hi("CmpItemKindFile", { fg = c.ponegliff_white })
	hi("CmpItemKindReference", { fg = c.jinbe_tide })
	hi("CmpItemKindFolder", { fg = c.gol_d })
	hi("CmpItemKindEnumMember", { fg = c.gol_d })
	hi("CmpItemKindConstant", { fg = c.gol_d })
	hi("CmpItemKindStruct", { fg = c.all_blue })
	hi("CmpItemKindEvent", { fg = c.robin })
	hi("CmpItemKindOperator", { fg = c.log_pose })
	hi("CmpItemKindTypeParameter", { fg = c.all_blue })

	-- ============================================
	-- Indent Blankline
	-- ============================================

	hi("IndentBlanklineChar", { fg = c.thousand_sunny_deck })
	hi("IndentBlanklineContextChar", { fg = c.sea_stone })
	hi("IblIndent", { fg = c.thousand_sunny_deck })
	hi("IblScope", { fg = c.sea_stone })

	-- ============================================
	-- Which-key
	-- ============================================

	hi("WhichKey", { fg = c.straw })
	hi("WhichKeyGroup", { fg = c.jinbe_tide })
	hi("WhichKeyDesc", { fg = c.ponegliff_white })
	hi("WhichKeySeparator", { fg = c.sea_stone })
	hi("WhichKeyFloat", { bg = c.calm_belt })
	hi("WhichKeyValue", { fg = c.log_pose })

	-- ============================================
	-- Lazy.nvim
	-- ============================================

	hi("LazyH1", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("LazyH2", { fg = c.straw, bold = true })
	hi("LazyButton", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })
	hi("LazyButtonActive", { fg = c.new_world_night, bg = c.straw })
	hi("LazySpecial", { fg = c.clima_tact })
	hi("LazyProgressDone", { fg = c.enma_glow })
	hi("LazyProgressTodo", { fg = c.thousand_sunny_deck })

	-- ============================================
	-- Mason
	-- ============================================

	hi("MasonNormal", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("MasonHeader", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("MasonHighlight", { fg = c.jinbe_tide })
	hi("MasonHighlightBlock", { fg = c.new_world_night, bg = c.ichimonji })
	hi("MasonHighlightBlockBold", { fg = c.new_world_night, bg = c.ichimonji, bold = true })
	hi("MasonMuted", { fg = c.sea_stone })
	hi("MasonMutedBlock", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })

	-- ============================================
	-- Notify
	-- ============================================

	hi("NotifyERRORBorder", { fg = c.fire_fist })
	hi("NotifyWARNBorder", { fg = c.straw_yellow })
	hi("NotifyINFOBorder", { fg = c.jinbe_tide })
	hi("NotifyDEBUGBorder", { fg = c.sea_stone })
	hi("NotifyTRACEBorder", { fg = c.robin })
	hi("NotifyERRORIcon", { fg = c.fire_fist })
	hi("NotifyWARNIcon", { fg = c.straw_yellow })
	hi("NotifyINFOIcon", { fg = c.jinbe_tide })
	hi("NotifyDEBUGIcon", { fg = c.sea_stone })
	hi("NotifyTRACEIcon", { fg = c.robin })
	hi("NotifyERRORTitle", { fg = c.fire_fist })
	hi("NotifyWARNTitle", { fg = c.straw_yellow })
	hi("NotifyINFOTitle", { fg = c.jinbe_tide })
	hi("NotifyDEBUGTitle", { fg = c.sea_stone })
	hi("NotifyTRACETitle", { fg = c.robin })

	-- ============================================
	-- Noice
	-- ============================================

	hi("NoiceCmdline", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("NoiceCmdlinePopup", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("NoiceCmdlinePopupBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("NoiceCmdlineIcon", { fg = c.straw })
	hi("NoicePopupmenu", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("NoicePopupmenuSelected", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })
	hi("NoicePopupmenuMatch", { fg = c.clima_tact, bold = true })

	-- ============================================
	-- Bufferline
	-- ============================================

	hi("BufferLineFill", { bg = c.haki_black })
	hi("BufferLineBackground", { fg = c.sea_stone, bg = c.haki_black })
	hi("BufferLineBuffer", { fg = c.sea_stone, bg = c.haki_black })
	hi("BufferLineBufferSelected", { fg = c.ponegliff_white, bg = c.new_world_night, bold = true })
	hi("BufferLineBufferVisible", { fg = c.log_pose, bg = c.calm_belt })
	hi("BufferLineCloseButton", { fg = c.sea_stone, bg = c.haki_black })
	hi("BufferLineCloseButtonSelected", { fg = c.straw, bg = c.new_world_night })
	hi("BufferLineCloseButtonVisible", { fg = c.log_pose, bg = c.calm_belt })
	hi("BufferLineIndicatorSelected", { fg = c.straw, bg = c.new_world_night })
	hi("BufferLineModified", { fg = c.clima_tact, bg = c.haki_black })
	hi("BufferLineModifiedSelected", { fg = c.clima_tact, bg = c.new_world_night })
	hi("BufferLineModifiedVisible", { fg = c.clima_tact, bg = c.calm_belt })
	hi("BufferLineSeparator", { fg = c.haki_black, bg = c.haki_black })
	hi("BufferLineSeparatorSelected", { fg = c.haki_black, bg = c.new_world_night })
	hi("BufferLineSeparatorVisible", { fg = c.haki_black, bg = c.calm_belt })

	-- ============================================
	-- nvim-dap-view
	-- ============================================

	-- Values
	hi("NvimDapViewBoolean", { fg = c.gol_d })
	hi("NvimDapViewConstant", { fg = c.gol_d })
	hi("NvimDapViewNumber", { fg = c.gol_d })
	hi("NvimDapViewFloat", { fg = c.gol_d })
	hi("NvimDapViewString", { fg = c.clima_tact })
	hi("NvimDapViewFunction", { fg = c.ichimonji })

	-- Controls (toolbar)
	hi("NvimDapViewControlPlay", { fg = c.enma_glow, bold = true })
	hi("NvimDapViewControlPause", { fg = c.straw_yellow, bold = true })
	hi("NvimDapViewControlRunLast", { fg = c.straw, bold = true })
	hi("NvimDapViewControlStepInto", { fg = c.jinbe_tide })
	hi("NvimDapViewControlStepOver", { fg = c.jinbe_tide })
	hi("NvimDapViewControlStepOut", { fg = c.jinbe_tide })
	hi("NvimDapViewControlStepBack", { fg = c.soul_king_teal })
	hi("NvimDapViewControlTerminate", { fg = c.kabuki_red, bold = true })
	hi("NvimDapViewControlDisconnect", { fg = c.kabuki_red })
	hi("NvimDapViewControlNC", { fg = c.sea_stone, italic = true })

	-- Threads & frames
	hi("NvimDapViewThread", { fg = c.straw })
	hi("NvimDapViewThreadStopped", { fg = c.straw_yellow, italic = true })
	hi("NvimDapViewThreadError", { fg = c.fire_fist })
	hi("NvimDapViewFrameCurrent", { fg = c.clima_tact, bold = true })

	-- Watch & exceptions
	hi("NvimDapViewWatchExpr", { fg = c.radical_beam_cyan })
	hi("NvimDapViewWatchUpdated", { fg = c.gol_d, italic = true })
	hi("NvimDapViewWatchError", { fg = c.fire_fist })
	hi("NvimDapViewExceptionFilterEnabled", { fg = c.enma_glow })
	hi("NvimDapViewExceptionFilterDisabled", { fg = c.fire_fist })

	-- Misc UI
	hi("NvimDapViewFileName", { fg = c.jinbe_tide })
	hi("NvimDapViewLineNumber", { fg = c.gol_d })
	hi("NvimDapViewMissingData", { fg = c.sea_stone, italic = true })
	hi("NvimDapViewSeparator", { fg = c.sea_stone })

	-- Tabs (Alt 3: Wano gold — gold active, orange inactive, dark saturated text)
	local dap_view_bg = c.all_blue
	hi("NvimDapViewTab", { fg = c.blackbeard, bg = dap_view_bg, bold = true })
	hi("NvimDapViewTabSelected", { fg = c.blackbeard, bg = c.gol_d, bold = true })
	hi("NvimDapViewTabFill", { fg = c.blackbeard, bg = dap_view_bg })

	-- Virtual text (Neovim 0.12+)
	hi("NvimDapViewVirtualText", { link = "NonText" })
	hi("NvimDapViewVirtualTextUpdated", { link = "NvimDapViewWatchUpdated" })

	-- ============================================
	-- Tabby.nvim
	-- ============================================

	-- Main tabline elements
	hi("TabbyHead", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("TabbyHeadSep", { fg = c.straw, bg = c.haki_black })
	hi("TabbyTail", { fg = c.blackbeard, bg = c.soul_king_teal })
	hi("TabbyTailSep", { fg = c.calm_belt, bg = c.haki_black })
	hi("TabbyFill", { bg = c.calm_belt })

	-- Active tab (Pirate King style)
	hi("TabbyTabActive", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("TabbyTabActiveSep", { fg = c.straw, bg = c.haki_black })
	hi("TabbyTabActiveNum", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("TabbyTabActiveClose", { fg = c.new_world_night, bg = c.straw })

	-- Inactive tabs (Crew members waiting)
	hi("TabbyTabInactive", { fg = c.sea_stone, bg = c.blackbeard })
	hi("TabbyTabInactiveSep", { fg = c.calm_belt, bg = c.haki_black })
	hi("TabbyTabInactiveNum", { fg = c.log_pose, bg = c.blackbeard })
	hi("TabbyTabInactiveClose", { fg = c.sea_stone, bg = c.blackbeard })

	-- Modified indicator
	hi("TabbyTabModified", { fg = c.clima_tact, bg = c.new_world_night })
	hi("TabbyTabInactiveModified", { fg = c.clima_tact, bg = c.calm_belt })

	-- ============================================
	-- Lualine (highlight groups for custom components)
	-- ============================================

	hi("LualineNormalA", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("LualineNormalB", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })
	hi("LualineNormalC", { fg = c.log_pose, bg = c.calm_belt })
	hi("LualineInsertA", { fg = c.new_world_night, bg = c.ichimonji, bold = true })
	hi("LualineVisualA", { fg = c.new_world_night, bg = c.robin, bold = true })
	hi("LualineReplaceA", { fg = c.new_world_night, bg = c.clima_tact, bold = true })
	hi("LualineCommandA", { fg = c.new_world_night, bg = c.gol_d, bold = true })

	-- ============================================
	-- fzf-lua
	-- ============================================

	hi("FzfLuaNormal", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("FzfLuaBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("FzfLuaTitle", { fg = c.straw, bg = c.calm_belt, bold = true })
	hi("FzfLuaPreviewNormal", { fg = c.ponegliff_white, bg = c.new_world_night })
	hi("FzfLuaPreviewBorder", { fg = c.new_world_night, bg = c.new_world_night })
	hi("FzfLuaPreviewTitle", { fg = c.new_world_night, bg = c.ichimonji, bold = true })
	hi("FzfLuaCursorLine", { bg = c.thousand_sunny_deck })
	hi("FzfLuaCursorLineNr", { fg = c.gol_d, bg = c.thousand_sunny_deck, bold = true })
	hi("FzfLuaSearch", { fg = c.new_world_night, bg = c.clima_tact })
	hi("FzfLuaScrollBorderEmpty", { fg = c.sea_stone, bg = c.calm_belt })
	hi("FzfLuaScrollBorderFull", { fg = c.straw, bg = c.calm_belt })
	hi("FzfLuaScrollFloatEmpty", { fg = c.sea_stone, bg = c.calm_belt })
	hi("FzfLuaScrollFloatFull", { fg = c.straw, bg = c.calm_belt })
	hi("FzfLuaHelpNormal", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("FzfLuaHelpBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("FzfLuaHeaderBind", { fg = c.straw })
	hi("FzfLuaHeaderText", { fg = c.log_pose })
	hi("FzfLuaPathColNr", { fg = c.gol_d })
	hi("FzfLuaPathLineNr", { fg = c.ichimonji })
	hi("FzfLuaBufName", { fg = c.jinbe_tide })
	hi("FzfLuaBufNr", { fg = c.gol_d })
	hi("FzfLuaBufFlagCur", { fg = c.straw })
	hi("FzfLuaBufFlagAlt", { fg = c.clima_tact })
	hi("FzfLuaTabTitle", { fg = c.straw, bold = true })
	hi("FzfLuaTabMarker", { fg = c.ichimonji })
	hi("FzfLuaLiveSym", { fg = c.clima_tact })
	hi("FzfLuaFzfMatch", { fg = c.clima_tact, bold = true })
	hi("FzfLuaFzfPrompt", { fg = c.straw })
	hi("FzfLuaFzfInfo", { fg = c.sea_stone })
	hi("FzfLuaFzfPointer", { fg = c.straw })
	hi("FzfLuaFzfMarker", { fg = c.ichimonji })
	hi("FzfLuaFzfSpinner", { fg = c.gol_d })
	hi("FzfLuaFzfHeader", { fg = c.log_pose })
	hi("FzfLuaFzfGutter", { bg = c.calm_belt })

	-- ============================================
	-- blink.cmp
	-- ============================================

	hi("BlinkCmpMenu", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("BlinkCmpMenuBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("BlinkCmpMenuSelection", { fg = c.gear_fifth, bg = c_sem.dropdown_item_bg })
	hi("BlinkCmpScrollBarThumb", { bg = c.gol_d })
	hi("BlinkCmpScrollBarGutter", { bg = c.thousand_sunny_deck })
	hi("BlinkCmpLabel", { fg = c.ponegliff_white })
	hi("BlinkCmpLabelDeprecated", { fg = c.sea_stone, strikethrough = true })
	hi("BlinkCmpLabelMatch", { fg = c.clima_tact, bold = true })
	hi("BlinkCmpLabelDetail", { fg = c.log_pose })
	hi("BlinkCmpLabelDescription", { fg = c.log_pose })
	hi("BlinkCmpSource", { fg = c.sea_stone })
	hi("BlinkCmpGhostText", { fg = c.sea_stone, italic = true })
	hi("BlinkCmpDoc", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("BlinkCmpDocBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("BlinkCmpDocSeparator", { fg = c.sea_stone, bg = c.calm_belt })
	hi("BlinkCmpDocCursorLine", { bg = c.thousand_sunny_deck })
	hi("BlinkCmpSignatureHelp", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("BlinkCmpSignatureHelpBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("BlinkCmpSignatureHelpActiveParameter", { fg = c.clima_tact, bold = true })

	-- blink.cmp Kind Icons
	hi("BlinkCmpKind", { fg = c.log_pose })
	hi("BlinkCmpKindText", { fg = c.log_pose })
	hi("BlinkCmpKindMethod", { fg = c.ichimonji })
	hi("BlinkCmpKindFunction", { fg = c.ichimonji })
	hi("BlinkCmpKindConstructor", { fg = c.all_blue })
	hi("BlinkCmpKindField", { fg = c.radical_beam_cyan })
	hi("BlinkCmpKindVariable", { fg = c.ponegliff_white })
	hi("BlinkCmpKindClass", { fg = c.all_blue })
	hi("BlinkCmpKindInterface", { fg = c.all_blue })
	hi("BlinkCmpKindModule", { fg = c.jinbe_tide })
	hi("BlinkCmpKindProperty", { fg = c.radical_beam_cyan })
	hi("BlinkCmpKindUnit", { fg = c.gol_d })
	hi("BlinkCmpKindValue", { fg = c.gol_d })
	hi("BlinkCmpKindEnum", { fg = c.all_blue })
	hi("BlinkCmpKindKeyword", { fg = c.straw })
	hi("BlinkCmpKindSnippet", { fg = c.robin })
	hi("BlinkCmpKindColor", { fg = c.sakura_bloom })
	hi("BlinkCmpKindFile", { fg = c.ponegliff_white })
	hi("BlinkCmpKindReference", { fg = c.jinbe_tide })
	hi("BlinkCmpKindFolder", { fg = c.gol_d })
	hi("BlinkCmpKindEnumMember", { fg = c.gol_d })
	hi("BlinkCmpKindConstant", { fg = c.gol_d })
	hi("BlinkCmpKindStruct", { fg = c.all_blue })
	hi("BlinkCmpKindEvent", { fg = c.robin })
	hi("BlinkCmpKindOperator", { fg = c.log_pose })
	hi("BlinkCmpKindTypeParameter", { fg = c.all_blue })
	hi("BlinkCmpKindCopilot", { fg = c.soul_king_teal })

	-- ============================================
	-- snacks.nvim picker
	-- ============================================

	-- Main picker window
	hi("SnacksPickerNormal", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("SnacksPickerBorder", { fg = c.sea_stone, bg = c.calm_belt })
	hi("SnacksPickerTitle", { fg = c.straw, bg = c.calm_belt, bold = true })
	hi("SnacksPickerFooter", { fg = c.log_pose, bg = c.calm_belt })

	-- Input/Prompt area
	hi("SnacksPickerInput", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })
	hi("SnacksPickerInputBorder", { fg = c.thousand_sunny_deck, bg = c.thousand_sunny_deck })
	hi("SnacksPickerInputTitle", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("SnacksPickerInputIcon", { fg = c.straw, bg = c.thousand_sunny_deck })

	-- Results list
	hi("SnacksPickerList", { fg = c.ponegliff_white, bg = c.calm_belt })
	hi("SnacksPickerCursor", { fg = c.ponegliff_white, bg = c.thousand_sunny_deck })
	hi("SnacksPickerCursorLine", { bg = c.thousand_sunny_deck })

	-- Preview window
	hi("SnacksPickerPreview", { fg = c.ponegliff_white, bg = c.new_world_night })
	hi("SnacksPickerPreviewBorder", { fg = c.new_world_night, bg = c.new_world_night })
	hi("SnacksPickerPreviewTitle", { fg = c.new_world_night, bg = c.ichimonji, bold = true })

	-- Matching highlights
	hi("SnacksPickerMatch", { fg = c.clima_tact, bold = true })
	hi("SnacksPickerFuzzyMatch", { fg = c.clima_tact })

	-- Special elements
	hi("SnacksPickerDir", { fg = c.jinbe_tide })
	hi("SnacksPickerFile", { fg = c.ponegliff_white })
	hi("SnacksPickerIcon", { fg = c.log_pose })
	hi("SnacksPickerIconDir", { fg = c.gol_d })

	-- Status indicators
	hi("SnacksPickerInfo", { fg = c.jinbe_tide })
	hi("SnacksPickerHint", { fg = c.soul_king_teal })
	hi("SnacksPickerCount", { fg = c.sea_stone })
	hi("SnacksPickerSelected", { fg = c.ichimonji, bold = true })
	hi("SnacksPickerMarked", { fg = c.straw })

	-- Git integration
	hi("SnacksPickerGitAdd", { fg = c.enma_glow })
	hi("SnacksPickerGitChange", { fg = c.gol_d })
	hi("SnacksPickerGitDelete", { fg = c.kabuki_red })
	hi("SnacksPickerGitUntracked", { fg = c.clima_tact })

	-- Diagnostic indicators
	hi("SnacksPickerDiagnosticError", { fg = c.fire_fist })
	hi("SnacksPickerDiagnosticWarn", { fg = c.straw_yellow })
	hi("SnacksPickerDiagnosticInfo", { fg = c.jinbe_tide })
	hi("SnacksPickerDiagnosticHint", { fg = c.soul_king_teal })

	-- LSP and symbols
	hi("SnacksPickerLspKind", { fg = c.log_pose })
	hi("SnacksPickerLspKindFunction", { fg = c.ichimonji })
	hi("SnacksPickerLspKindMethod", { fg = c.ichimonji })
	hi("SnacksPickerLspKindClass", { fg = c.all_blue })
	hi("SnacksPickerLspKindInterface", { fg = c.all_blue })
	hi("SnacksPickerLspKindModule", { fg = c.jinbe_tide })
	hi("SnacksPickerLspKindVariable", { fg = c.ponegliff_white })
	hi("SnacksPickerLspKindConstant", { fg = c.gol_d })
	hi("SnacksPickerLspKindProperty", { fg = c.radical_beam_cyan })

	-- Special picker types
	hi("SnacksPickerHelp", { fg = c.robin })
	hi("SnacksPickerKey", { fg = c.straw })
	hi("SnacksPickerValue", { fg = c.log_pose })

	-- ============================================
	-- Command Palette (commands.nvim)
	-- ============================================

	hi("CmdPaletteNormal", { fg = c.ponegliff_white, bg = c.haki_black })
	hi("CmdPaletteBorder", { fg = c.conqueror_lightning, bg = c.haki_black })
	hi("CmdPaletteTitle", { fg = c.straw, bg = c.haki_black, bold = true })
	hi("CmdPaletteInput", { fg = c.ponegliff_white, bg = c.haki_black })
	hi("CmdPaletteInputBorder", { fg = c.conqueror_lightning, bg = c.haki_black })
	hi("CmdPaletteInputTitle", { fg = c.new_world_night, bg = c.beli_gold, bold = true })
	hi("CmdPaletteInputIcon", { fg = c.beli_gold, bg = c.thousand_sunny_deck })
	hi("CmdPaletteCursorLine", { fg = c.new_world_night, bg = c.straw, bold = true })
	hi("CmdPaletteMatch", { fg = c.gear_fifth, bold = true })
end

return M
