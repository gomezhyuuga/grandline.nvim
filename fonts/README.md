# Grandline Icons Font

Custom icon font for grandline.nvim with One Piece-themed icons.

## Icons Included

| Icon | Name | Codepoint | Description |
|------|------|-----------|-------------|
| 󿿿 | `straw_hat` | U+100000 | Luffy's iconic straw hat |
| 󿿿 | `jolly_roger` | U+100001 | Pirate flag icon |

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
2. Add the icon to `ICONS` list in `build_font.py`:
   ```python
   ICONS = [
       ("straw_hat", 0x100000, "icons/straw-hat.svg"),
       ("jolly_roger", 0x100001, "icons/jolly-roger.svg"),  # New icon
   ]
   ```
3. Rebuild the font: `./build.sh`

## Icon Design Guidelines

- **ViewBox**: Use 1024x1024 for consistency
- **Fill**: Use solid black (`#000`) - color is applied by the terminal/editor
- **Simplicity**: Keep designs simple for small sizes
- **Padding**: Leave ~10% padding around edges
- **Baseline**: Icons are centered; the build script adjusts baseline

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
