# 🏴‍☠️ Grand Line

A dark, vibrant Neovim colorscheme inspired by **One Piece** (Post-Timeskip & Wano Arc).

<!-- Screenshots coming soon -->

## ✨ Features

- 🎨 **Full 24-bit truecolor support**
- 🌲 **Treesitter highlighting** for modern syntax
- 🔧 **LSP semantic tokens** support
- 🔌 **Plugin integrations**: Telescope, Neo-tree, nvim-cmp, Bufferline, Lualine, Which-key, Lazy, Mason, Notify, Noice, and more
- 🖥️ **Terminal colors** included
- ⚡ **Lualine theme** included

## 🎭 Color Philosophy

Each color in the palette represents a Straw Hat crew member or One Piece element:

| Color | Name | Inspiration |
|-------|------|-------------|
| 🔴 | Gear Red | Luffy's signature color |
| 🟢 | Ichimonji | Zoro's haramaki |
| 🟠 | Clima-Tact Orange | Nami's hair |
| 🔵 | All Blue | Sanji's dream sea |
| 🟣 | Nico Robin Purple | Robin's color scheme |
| 🩵 | Radical Beam Cyan | Franky's tech |
| 🌸 | Sakura Bloom | Wano cherry blossoms |
| 🥇 | Gold Leaf | Wano gold / Straw hat |

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "gomezhyuuga/grandline.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("grandline").setup({
      -- your config here (optional)
    })
    vim.cmd("colorscheme grandline")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "gomezhyuuga/grandline.nvim",
  config = function()
    vim.cmd("colorscheme grandline")
  end,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'gomezhyuuga/grandline.nvim'

" then in your config:
colorscheme grandline
```

## ⚙️ Configuration

```lua
require("grandline").setup({
  transparent = false,       -- Enable transparent background
  italic_comments = true,    -- Use italic for comments
  terminal_colors = true,    -- Set terminal colors
})
```

## 🚀 Lualine

Grand Line includes a matching lualine theme:

```lua
require('lualine').setup({
  options = {
    theme = 'grandline'
  }
})
```

### Mode Colors

| Mode | Color | Character |
|------|-------|-----------|
| Normal | Gear Red | Luffy |
| Insert | Ichimonji | Zoro |
| Visual | Nico Robin Purple | Robin |
| Replace | Clima-Tact Orange | Nami |
| Command | Gold Leaf | Wano |

## 🎨 Syntax Highlighting

| Element | Color | Rationale |
|---------|-------|-----------|
| Keywords | Gear Red | Commands stand out like Luffy leading |
| Functions | Ichimonji | Actions, like Zoro's techniques |
| Strings | Clima-Tact Orange | Text content, warm and readable |
| Types | All Blue | Structural, foundational |
| Constants | Gold Leaf | Treasure, precious values |
| Comments | Sea Stone | Muted, non-essential |

## 🔌 Supported Plugins

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Which-key](https://github.com/folke/which-key.nvim)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [Noice](https://github.com/folke/noice.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)

## 📁 Extras

The `extras/` folder contains configs for other applications:

| File | Application |
|------|-------------|
| `grandline.ghostty` | [Ghostty](https://ghostty.org/) terminal |
| `grandline.alacritty.toml` | [Alacritty](https://alacritty.org/) terminal |
| `grandline.wezterm.lua` | [WezTerm](https://wezfurlong.org/wezterm/) terminal |
| `grandline.kitty.conf` | [Kitty](https://sw.kovidgoyal.net/kitty/) terminal |
| `grandline.lazygit.yml` | [Lazygit](https://github.com/jesseduffield/lazygit) |
| `grandline-fish.theme` | [Fish](https://fishshell.com/) shell |
| `grandline.yazi.toml` | [Yazi](https://yazi-rs.github.io/) file manager |

### Tmux (TPM)

Install via [TPM](https://github.com/tmux-plugins/tpm) by adding to your `~/.tmux.conf`:

```bash
set -g @plugin 'gomezhyuuga/grandline.nvim'
```

Or source the config directly:

```bash
source-file /path/to/grandline.nvim/extras/grandline.tmux.conf
```

## 🔭 Syntax Preview

The `examples/` folder contains sample files for various languages. Open them in Neovim to preview how grandline highlights each filetype via Treesitter:

```sh
nvim examples/react/react-example.tsx
nvim examples/ruby/file.rb
```

## 🤝 Contributing

Contributions are welcome — new plugin integrations, terminal extras, and palette refinements especially. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 🙏 Credits

Inspired by the incredible world of [One Piece](https://onepiece.fandom.com/) by Eiichiro Oda.

## ⚠️ Disclaimer

grandline.nvim is a **fan-made, open-source project** and is not affiliated with, endorsed by, or connected to Shueisha, Toei Animation, or any official One Piece entities.

**One Piece** © Eiichiro Oda / Shueisha. All One Piece characters, names, and related indicia are trademarks and copyrights of their respective owners. The One Piece-inspired color naming is purely a creative theme for color identification — no ownership over the original intellectual property is claimed.

## 📜 License

MIT — see [LICENSE](LICENSE) for details.

---

*"I'm gonna be King of the Pirates!"* — Now your code can look the part. 🏴‍☠️
