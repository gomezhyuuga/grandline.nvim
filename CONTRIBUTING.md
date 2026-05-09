# Contributing to grandline.nvim

Thanks for your interest in contributing! grandline.nvim is a One Piece-inspired Neovim colorscheme, and every addition should feel like it belongs in the Grand Line.

## Getting Started

```sh
git clone https://github.com/gomezhyuuga/grandline.nvim
cd grandline.nvim
```

To test the theme while developing, open Neovim with the plugin loaded locally. With lazy.nvim you can add a `dev = true` entry pointing at your local clone, then reload with:

```lua
require("lazy").reload({ plugins = { "grandline.nvim" }, wait = true })
```

Or simply re-run `:colorscheme grandline` after saving your changes.

## Project Structure

```
lua/grandline/
  init.lua        -- setup() and load() entry points
  palette.lua     -- all color hex values + semantic aliases
  highlights.lua  -- all highlight group definitions
  agentic.lua     -- agentic.nvim plugin highlight support
  tabby.lua       -- tabby.nvim tab line support
lua/lualine/
  themes/grandline.lua       -- lualine theme
  components/grandline_lsp.lua
extras/           -- terminal / app configs (Ghostty, Alacritty, etc.)
examples/         -- sample source files for Treesitter preview
docs/             -- color reference and highlight documentation
```

## Adding Highlight Groups

1. Open `lua/grandline/highlights.lua`
2. Find the relevant section (Editor UI, Syntax, Treesitter, LSP, or a plugin section)
3. Use the `hi()` helper with colors from `palette.lua`:

```lua
hi("SomePluginHighlight", { fg = c.gear_red, bg = c.calm_belt, bold = true })
```

4. Test in Neovim: `:colorscheme grandline`

## Adding New Colors

Colors must follow the **One Piece naming convention** — each color should be named after a character, technique, location, or element from the series.

1. Add the hex value to `M.colors` in `lua/grandline/palette.lua`
2. Add a semantic alias to `M.semantic` if the color fills a role (error, warning, bg, etc.)
3. Update `docs/theme-definition.md` with the new entry (hex, RGB, and One Piece inspiration)

## Adding Plugin Support

1. Add a clearly commented section at the bottom of `lua/grandline/highlights.lua`
2. Reference the plugin's README for the expected highlight group names
3. Add the plugin to the "Supported Plugins" table in `README.md`

## Updating Terminal Extras

When the color palette changes, the `extras/` files should be updated to match. Each file uses the palette hex values directly — search for the old hex value and replace with the new one.

## Code Style

This project uses [StyLua](https://github.com/JohnnyMorganz/StyLua) for formatting. Run it before submitting a PR:

```sh
stylua lua/
```

Configuration is in `stylua.toml`.

## Pull Request Checklist

- [ ] Highlight groups tested in Neovim (`:colorscheme grandline`)
- [ ] New colors added to `docs/theme-definition.md`
- [ ] `extras/` updated if palette hex values changed
- [ ] No personal keymaps or debug code introduced
- [ ] Code formatted with `stylua`

## Opening Issues

**Bug reports** — please include:
- Neovim version (`:version`)
- OS and terminal emulator
- Output of `:checkhealth` (if relevant)
- Minimal config to reproduce

**Feature requests** — new plugin support, new terminal extras, and palette refinements are all welcome. Please include a screenshot or description of the expected result.
