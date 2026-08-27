# CLAUDE.md

This file provides guidance for Claude Code when working with the grandline.nvim project.

## Project Overview

**grandline.nvim** is a dark, vibrant Neovim colorscheme inspired by One Piece anime (Post-Timeskip & Wano Arc). Each color in the palette is named after Straw Hat crew members or One Piece elements.

## Project Structure

```
grandline.nvim/
├── colors/grandline.lua       # Entry point: vim.cmd("colorscheme grandline")
├── lua/grandline/
│   ├── init.lua               # Main module: setup(), load(), config
│   ├── palette.lua            # Color definitions (M.colors, M.semantic)
│   └── highlights.lua         # Highlight group definitions
├── lua/lualine/themes/
│   └── grandline.lua          # Lualine statusline theme
├── extras/                    # Terminal configs (Ghostty, Alacritty, WezTerm)
└── docs/
    └── theme-definition.md    # Full color palette reference
```

## Key Files

- **`docs/theme-definition.md`**: Complete color reference with hex values, RGB, and One Piece inspirations.
- **`lua/grandline/palette.lua`**: All color hex values. Colors use One Piece naming (e.g., `gear_red`, `ichimonji`, `all_blue`). Also exports `M.semantic` for role-based aliases.
- **`lua/grandline/highlights.lua`**: Maps colors to Neovim highlight groups (syntax, LSP, Treesitter, plugins).
- **`lua/grandline/init.lua`**: Exposes `setup(opts)` and `load()` functions. Handles config merging and terminal colors.
* See as well the docs/neovim/ fodler for neovim customization of certain popular plugins

## Color Naming Convention

Colors are named after One Piece characters/elements:

| Color Name | Hex | Inspiration |
|------------|-----|-------------|
| `gear_red` | #e63946 | Luffy's signature |
| `ichimonji` | #2d9d4f | Zoro's haramaki |
| `clima_tact` | #f77f00 | Nami's hair |
| `all_blue` | #2f7ebf | Sanji's dream |
| `robin` | #9d4edd | Robin's color |
| `radical_beam_cyan` | #00c8d4 | Franky's tech |
| `jinbe_tide` | #58a6ff | Jinbe (sea) |
| `soul_king_teal` | #56d4dd | Brook |
| `gol_d` | #fcbf49 | Wano gold |
| `gear_fifth` | #ff6b7a | Luffy awakened |

Backgrounds: `new_world_night`, `calm_belt`, `thousand_sunny_deck`
Foregrounds: `ponegliff_white`, `log_pose`, `gray_terminal` (comments), `sea_stone` (UI chrome)

Diff backgrounds live in `palette.semantic` (`diff_add_bg`, `diff_change_bg`, `diff_delete_bg`,
`diff_text_bg`, `diff_add_text_bg`, `diff_delete_text_bg`) and are blended from the base
background at load time — keep them faint so comments stay readable inside a hunk.

## Development Guidelines

1. **Adding new highlight groups**: Edit `lua/grandline/highlights.lua`. Use colors from `palette.lua`.
2. **Adding new colors**: Add to `M.colors` in `palette.lua` with One Piece-themed name.
3. **Plugin support**: Add highlight groups in the plugin-specific section of `highlights.lua`.
4. **Terminal extras**: Update files in `extras/` when palette changes.

## Configuration Options

```lua
require("grandline").setup({
  transparent = false,       -- Transparent background
  italic_comments = true,    -- Italic comments
  terminal_colors = true,    -- Set terminal ANSI colors
})
```

## Testing the Theme

```vim
:colorscheme grandline
```

Or in Lua:
```lua
require("grandline").load()
```

## Semantic Color Roles

The `palette.semantic` table provides role-based aliases:
- `error` = fire_fist (orange-red)
- `warning` = straw_yellow
- `info` = jinbe_tide (blue)
- `hint` = soul_king_teal
- `success` / `add` = enma_glow (green)
- `delete` = kabuki_red
