# Grandline Icons Font

Custom icon font for grandline.nvim with One Piece-themed icons.

## Icons Included

| Name | Codepoint | Description | Suggested use |
|------|-----------|-------------|---------------|
| `straw_hat` | U+100000 | Luffy's straw hat | Tabline head, dashboard header |
| `jolly_roger` | U+100001 | Skull, hat and crossed bones | Project/brand mark |
| `going_merry` | U+100002 | Square-rigged caravel, sheep figurehead | Session, workspace |
| `thousand_sunny` | U+100003 | Lion-maned brig | Session, workspace |
| `devil_fruit` | U+100004 | Swirled fruit | Plugins, extensions |
| `log_pose` | U+100005 | Bubble compass on its band | Pickers, navigation, jumplist |
| `den_den_mushi` | U+100006 | Transponder snail | Notifications, LSP messages |
| `straw_hat_flag` | U+100007 | Hat on a swallowtail pennant | Git branch, marks |

All eight are drawn as a single solid path so the terminal or editor colours
them. See [Icon design guidelines](#icon-design-guidelines) before adding more.

## Building the Font

### Prerequisites

Install FontForge:

```bash
# macOS
brew install fontforge

# Ubuntu/Debian
sudo apt install fontforge python3-fontforge

# Arch Linux
sudo pacman -S fontforge
```

### Build

```bash
cd fonts/
./build.sh
```

Or manually:

```bash
fontforge -script build_font.py
```

The built fonts will be in `fonts/dist/`:
- `GrandlineIcons-Regular.ttf`
- `GrandlineIcons-Regular.otf`
- `codepoints.lua` - Lua table with icon characters

## Installation

After building, run the install script:

```bash
./install.sh
```

This automatically detects your OS and installs to the correct location.

### Manual Installation

#### macOS

```bash
cp dist/GrandlineIcons-Regular.ttf ~/Library/Fonts/
```

#### Linux

```bash
mkdir -p ~/.local/share/fonts
cp dist/GrandlineIcons-Regular.ttf ~/.local/share/fonts/
fc-cache -fv
```

#### Windows

```bash
cp dist/GrandlineIcons-Regular.ttf "$USERPROFILE/AppData/Local/Microsoft/Windows/Fonts/"
```

## Terminal Configuration

Configure your terminal to use Grandline Icons as a fallback font.

### WezTerm

```lua
-- ~/.config/wezterm/wezterm.lua
local wezterm = require("wezterm")

return {
  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",
    "Grandline Icons",
  }),
}
```

### Kitty

```conf
# ~/.config/kitty/kitty.conf
font_family JetBrainsMono Nerd Font
symbol_map U+100000-U+100FFF Grandline Icons
```

### Alacritty

```yaml
# ~/.config/alacritty/alacritty.yml
font:
  normal:
    family: JetBrainsMono Nerd Font
  # Alacritty doesn't support font fallback natively
  # Consider using fontconfig for fallback
```

### Ghostty

Ghostty supports multiple `font-family` declarations for fallback. The fonts are tried in order.

```conf
# ~/.config/ghostty/config

# Primary font (Nerd Font with icons)
font-family = "JetBrainsMono Nerd Font"

# Fallback for custom Grandline icons (straw hat, etc.)
font-family = "Grandline Icons"

# Optional: Additional fallbacks for emoji/symbols
font-family = "Apple Color Emoji"
font-family = "Symbols Nerd Font Mono"

# Font size
font-size = 14

# Ensure proper rendering of custom codepoints
# Grandline Icons uses U+100000+ (Supplementary Private Use Area-B)
adjust-cell-width = 0
adjust-cell-height = 0
```

#### Ghostty with Grandline Theme

For a complete setup with the grandline terminal theme:

```conf
# ~/.config/ghostty/config

# Fonts
font-family = "JetBrainsMono Nerd Font"
font-family = "Grandline Icons"
font-size = 14

# Grandline colorscheme (copy from extras/ghostty/grandline)
background = 0d1117
foreground = e6edf3
cursor-color = e6b422

# ... rest of grandline theme colors
```

### iTerm2

1. Go to Preferences → Profiles → Text
2. Set your main font to a Nerd Font
3. Check "Use a different font for non-ASCII text"
4. Set the non-ASCII font to "Grandline Icons"

## Usage in Neovim

### Direct Usage

```lua
-- Using the codepoint
local straw_hat = vim.fn.nr2char(0x100000)

-- Or with the provided codepoints file
local icons = require("grandline.icons")
local straw_hat = icons.straw_hat
```

### In grandline.nvim

The tabby theme can use the straw hat icon:

```lua
-- lua/grandline/tabby.lua
local icons = require("grandline.icons")

-- In the header section
{ icons.straw_hat .. " ", hl = "TabbyHead" }
```

## Adding New Icons

1. Create an SVG file in `icons/` (1024x1024 viewBox recommended)
2. Add the icon to the `ICONS` list in `build_font.py`, continuing the
   codepoints from U+100008:
   ```python
   ICONS = [
       # ... existing icons ...
       ("sea_king", 0x100008, "icons/sea-king.svg"),  # New icon
   ]
   ```
3. Add the matching entry to `lua/grandline/icons.lua`.
4. Rebuild the font: `./build.sh`

## Icon Design Guidelines

- **ViewBox**: Use 1024x1024 for consistency
- **Fill**: Use solid black (`#000`) - color is applied by the terminal/editor
- **One path**: Put the whole icon in a single `<path>`. FontForge imports
  outlines, not fills, so separate elements are the wrong tool for a hole.
- **Holes wind backwards**: A counter - an eye socket, the hatband, the
  compass face - must be a subpath wound *opposite* to the shape it sits in,
  and it must lie entirely inside that shape. Under the nonzero fill rule a
  reverse-wound subpath over empty canvas fills solid instead of cutting.
  Ellipses: `A rx ry 0 1 1` is clockwise (solid), `A rx ry 0 1 0` is
  counter-clockwise (hole).
- **A white shape is not a hole**: `fill="#fff"` reads as a hole in a browser
  but imports as another filled outline, so the glyph renders as a blob.
- **16px floor**: The font is read in a statusline. At 16px one em is 16
  pixels, so 1024 units map to 16px and **64 units = 1 device pixel**. Keep
  every stroke, gap and counter at **>= 80 units** (~1.25px) - below that a
  feature disappears at 16px and mushes at 32px. Check the icon at 16px
  before committing it; do not judge it at 1024.
- **Simplicity**: Keep designs simple for small sizes. Two or three masses
  that survive 16px beat six that only work at 128px.
- **Padding**: Leave ~10% padding around edges
- **Baseline**: Icons are centered; the build script adjusts baseline

### Colouring icons

The glyph is monochrome, so contrast is entirely the highlight group's job.
Against the darkest background (`new_world_night`, `#0d1117`) and the lightest
(`thousand_sunny_deck`, `#21262d`), these palette colours clear the WCAG 3:1
non-text minimum at every background in the theme:

| Colour | Hex | vs `#0d1117` | vs `#21262d` |
|--------|-----|--------------|--------------|
| `ponegliff_white` | `#e6edf3` | 16.02 | 12.88 |
| `beli_gold` | `#ffd700` | 13.49 | 10.85 |
| `gol_d` | `#fcbf49` | 11.43 | 9.20 |
| `soul_king_teal` | `#56d4dd` | 10.69 | 8.59 |
| `enma_glow` | `#5bda7c` | 10.60 | 8.53 |
| `straw` | `#e6b422` | 9.84 | 7.91 |
| `radical_beam_cyan` | `#00c8d4` | 9.20 | 7.40 |
| `jinbe_tide` | `#58a6ff` | 7.49 | 6.03 |
| `gray_terminal` | `#7d8590` | 5.07 | 4.08 |
| `gear_red` | `#e63946` | 4.54 | 3.65 |
| `all_blue` | `#2f7ebf` | 4.38 | 3.52 |
| `robin` | `#9d4edd` | 4.12 | 3.31 |

`straw` is the default: it is the theme's primary accent and holds 7.91:1
even on the lightest background.

**Do not tint an icon with `sea_stone` (`#484f58`).** It is UI-chrome, not
ink - 2.28:1 on `new_world_night` and 1.84:1 on `thousand_sunny_deck`, so it
fails 3:1 everywhere. For a muted or inactive icon use `gray_terminal`
(`#7d8590`) or `log_pose` (`#8b949e`) instead.

`robin` and `all_blue` clear 3:1 only just, so keep them off 16px glyphs and
off `thousand_sunny_deck` rows.

## Troubleshooting

### Icon not showing

1. Verify the font is installed: `fc-list | grep Grandline`
2. Check terminal font fallback configuration
3. Restart your terminal after installing

### Icon renders as box/tofu

The codepoint U+100000 is in the Supplementary Private Use Area-B. Ensure your terminal supports this Unicode range.

### FontForge errors

If SVG import fails, simplify the SVG:
- Remove transforms, use absolute coordinates
- Flatten groups
- Convert strokes to paths

## License

The icons and font are part of grandline.nvim and follow the same license.
