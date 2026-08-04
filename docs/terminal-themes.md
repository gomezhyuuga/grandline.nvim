# Terminal Themes

Grand Line provides pre-configured themes for popular terminal emulators and shell applications. All themes use the same color palette to ensure a consistent experience across your development environment.

---

## Supported Applications

| Application | File | Location |
|-------------|------|----------|
| Ghostty | `grandline.ghostty` | `~/.config/ghostty/themes/` |
| Alacritty | `grandline.alacritty.toml` | `~/.config/alacritty/themes/` |
| Kitty | `grandline.kitty.conf` | `~/.config/kitty/themes/` |
| WezTerm | `grandline.wezterm.lua` | `~/.config/wezterm/colors/` |
| Tmux | `grandline.tmux.conf` | Source in `~/.tmux.conf` |
| Fish Shell | `grandline-fish.theme` | `~/.config/fish/themes/` |
| Hyprland | `hypr/grandline/` | `~/.config/hypr/grandline/` |
| Hyprlock | `grandline.hyprlock.conf` | `~/.config/hypr/` |

---

## Installation

### Ghostty

Copy the theme file to your Ghostty themes directory:

```bash
mkdir -p ~/.config/ghostty/themes
cp extras/grandline.ghostty ~/.config/ghostty/themes/
```

Then add to your `~/.config/ghostty/config`:

```
theme = grandline
```

### Alacritty

Copy the theme file to your Alacritty themes directory:

```bash
mkdir -p ~/.config/alacritty/themes
cp extras/grandline.alacritty.toml ~/.config/alacritty/themes/
```

Then import in your `~/.config/alacritty/alacritty.toml`:

```toml
[general]
import = ["~/.config/alacritty/themes/grandline.alacritty.toml"]
```

### Kitty

Copy the theme file to your Kitty themes directory:

```bash
mkdir -p ~/.config/kitty/themes
cp extras/grandline.kitty.conf ~/.config/kitty/themes/
```

Then include in your `~/.config/kitty/kitty.conf`:

```
include themes/grandline.kitty.conf
```

### WezTerm

Copy the theme file to your WezTerm colors directory:

```bash
mkdir -p ~/.config/wezterm/colors
cp extras/grandline.wezterm.lua ~/.config/wezterm/colors/
```

Then use in your `~/.config/wezterm/wezterm.lua`:

```lua
local wezterm = require("wezterm")
local grandline = require("colors.grandline.wezterm")

return {
  colors = grandline,
}
```

### Tmux

Source the theme file in your `~/.tmux.conf`:

```bash
source-file /path/to/grandline.nvim/extras/grandline.tmux.conf
```

Or copy it to your config directory:

```bash
cp extras/grandline.tmux.conf ~/.config/tmux/
```

Then in `~/.tmux.conf`:

```
source-file ~/.config/tmux/grandline.tmux.conf
```

### Fish Shell

Copy the theme file to your Fish themes directory:

```bash
mkdir -p ~/.config/fish/themes
cp extras/grandline-fish.theme ~/.config/fish/themes/
```

Then activate with:

```fish
fish_config theme save "Grand Line"
```

### Hyprland

Hyprland 0.53+ configures itself with Lua, so the theme ships as a requireable
module rather than a `.conf`. Copy (or symlink) it next to your `hyprland.lua`:

```bash
mkdir -p ~/.config/hypr
cp -r extras/hypr/grandline ~/.config/hypr/
# or, to track upstream changes:
ln -s "$PWD/extras/hypr/grandline" ~/.config/hypr/grandline
```

Then require it from your `hyprland.lua` (or whichever module holds your
appearance settings):

```lua
require("grandline").setup()
```

The theme only sets color values (borders, shadows, group borders, groupbar,
background), so your gaps, rounding, blur and animations are left untouched.
Require it **after** your own `hl.config` calls so its colors win.

Options, all optional:

```lua
require("grandline").setup({
  borders = true,           -- window border colors
  shadows = true,           -- decoration shadow colors
  groups = true,            -- group border + groupbar colors
  background = true,        -- misc.background_color
  accent = "kabuki_tide",   -- active border gradient, see below
  gradients = true,         -- use both stops; false = flat, first stop only
  angle = 45,               -- gradient angle in degrees
})
```

### Accents

The active window border is the theme's loudest element, so it ships as a set of
named gradients. `kabuki_tide` is the default.

| Accent | Gradient | Character |
|--------|----------|-----------|
| `kabuki_tide` | Kabuki Red → All Blue | Deep red into Sanji's blue |
| `wano_night` | Marine Blue → Kabuki Red | Navy burning into red |
| `straw` | Straw → Gear Red | The warmest, most "One Piece" |
| `devil_fruit` | Robin → Sakura Bloom | Purple into pink |
| `all_blue` | Soul King Teal → Jinbe Tide | Cool and bright |
| `conqueror` | Gear Red → Robin | Widest hue travel |
| `enma` | Enma Glow → Soul King Teal | Green into teal |
| `zoro` | Ichimonji → All Blue | Muted green into blue |
| `gear_fifth` | Gear Fifth → Sakura Bloom | Coral into magenta |

To preview one without editing files (Hyprland's Lua parser rejects
`hyprctl keyword`, so use `eval`):

```bash
hyprctl eval 'require("grandline").setup({ accent = "conqueror" })'
```

`hyprctl reload` restores whatever your config declares.

The palette is exported for reuse elsewhere in your config:

```lua
local grandline = require("grandline")
grandline.rgba("gol_d", "ee")                              --> "rgba(fcbf49ee)"
grandline.gradient({ { "straw", "ee" }, { "robin", "ee" } }, 90)
```

### Hyprlock

Copy the theme file to your Hyprland config directory:

```bash
mkdir -p ~/.config/hypr
cp extras/grandline.hyprlock.conf ~/.config/hypr/
```

Then source it at the top of your `~/.config/hypr/hyprlock.conf`:

```
source = ~/.config/hypr/grandline.hyprlock.conf
```

Or use it directly as your `hyprlock.conf` — it ships a complete lock screen
with clock, date and greeting labels.

---

## Color Mapping

All terminal themes use the standard ANSI 16-color palette mapped to Grand Line colors:

### Normal Colors (0-7)

| ANSI | Color | Hex | Name | Inspiration |
|------|-------|-----|------|-------------|
| 0 | Black | `#0d1117` | Blackbeard | Dark as the Yami Yami no Mi |
| 1 | Red | `#e63946` | Gear Red | Luffy's signature color |
| 2 | Green | `#2d9d4f` | Ichimonji | Zoro's haramaki |
| 3 | Yellow | `#f77f00` | Clima-Tact | Nami's hair |
| 4 | Blue | `#2f7ebf` | All Blue | Sanji's dream sea |
| 5 | Magenta | `#9d4edd` | Robin | Nico Robin's color |
| 6 | Cyan | `#00c8d4` | Radical Beam | Franky's tech |
| 7 | White | `#e6edf3` | Ponegliff White | Ancient text glow |

### Bright Colors (8-15)

| ANSI | Color | Hex | Name | Inspiration |
|------|-------|-----|------|-------------|
| 8 | Bright Black | `#484f58` | Sea Stone | Seastone cuffs |
| 9 | Bright Red | `#ff6b7a` | Gear Fifth | Luffy's awakening |
| 10 | Bright Green | `#5bda7c` | Enma Glow | Zoro's cursed blade |
| 11 | Bright Yellow | `#fcbf49` | Gold Leaf | Wano gold |
| 12 | Bright Blue | `#58a6ff` | Jinbe Tide | First Son of the Sea |
| 13 | Bright Magenta | `#d970c4` | Sakura Bloom | Wano cherry blossoms |
| 14 | Bright Cyan | `#56d4dd` | Soul King Teal | Brook's soul flames |
| 15 | Bright White | `#ffffff` | Snow White | Pure white |

### UI Colors

| Element | Hex | Name |
|---------|-----|------|
| Background | `#0d1117` | New World Night |
| Foreground | `#e6edf3` | Ponegliff White |
| Selection BG | `#21262d` | Thousand Sunny Deck |
| Cursor | `#ff6b7a` | Gear Fifth |
| URL/Link | `#58a6ff` | Jinbe Tide |

### Scrollbar Colors

| Element | Hex | Name | Source |
|---------|-----|------|--------|
| Thumb | `#fcbf49` | Gold Leaf | `semantic.scroll_thumb` |
| Track/Gutter | `#feebc8` | Gold Leaf (lightened 70%) | `semantic.scroll_gutter` |

The scrollbar uses a golden theme inspired by Wano's gold leaf aesthetic. The track is a lightened version of the thumb color for subtle contrast.

**CSS Implementation:**

```css
::-webkit-scrollbar {
  width: 10px;
}

::-webkit-scrollbar-track {
  background: #feebc8; /* scroll_gutter - lightened gold */
  border-radius: 5px;
}

::-webkit-scrollbar-thumb {
  background: #fcbf49; /* scroll_thumb - Gold Leaf */
  border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
  background: #ffd700; /* beli_gold - brighter on hover */
}
```

**Lua access:**

```lua
local palette = require("grandline.palette")

-- Direct access
local thumb = palette.semantic.scroll_thumb   -- #fcbf49
local gutter = palette.semantic.scroll_gutter -- #feebc8 (computed)

-- Or compute manually
local gutter = palette.lighten(palette.colors.gol_d, 70)
```

---

## Theme Features

### Ghostty

- Full ANSI 16-color palette
- Custom cursor colors
- Selection highlighting

### Alacritty

- Full ANSI 16-color palette
- Cursor and vi mode cursor colors
- Selection colors
- Search match highlighting (gold/orange)

### Kitty

- Full ANSI 16-color palette with One Piece-inspired comments
- Tab bar styling (active: Gear Red, inactive: Calm Belt)
- URL underline color (Jinbe Tide)
- Mark colors for search highlighting

### WezTerm

- Full ANSI 16-color palette with inline comments
- Scrollbar and split colors
- Complete tab bar configuration:
  - Active tab: Bold with primary colors
  - Inactive tab: Muted Haki Black
  - Hover states with golden accents

### Tmux

Full status bar theming with powerline-style segments:

- **Left status**: Session name on Ichimonji green
- **Right status**: Date, time, and hostname with Gold Leaf accent
- **Window tabs**: Active windows in All Blue, inactive in muted style
- **Pane borders**: Golden (Wano-inspired)
- **Copy mode**: Gear Fifth highlighting with search match colors
- **Clock**: Jinbe Tide blue, 24-hour format

### Fish Shell

Complete syntax highlighting:

| Element | Color | Name |
|---------|-------|------|
| Commands | `#2d9d4f` | Ichimonji |
| Strings/Quotes | `#f77f00` | Clima-Tact |
| Options | `#58a6ff` | Jinbe Tide |
| Errors | `#ff4500` | Fire Fist |
| Keywords | `#e63946` | Gear Red |
| Redirections | `#9d4edd` | Robin |
| Escapes | `#00c8d4` | Radical Beam |
| User prompt | `#5bda7c` | Enma Glow |
| Host prompt | `#56d4dd` | Soul King Teal |
| CWD | `#fcbf49` | Gold Leaf |

### Hyprland

- **Active border**: Kabuki Red → All Blue gradient at 45° (switchable, see Accents)
- **Inactive border**: Thousand Sunny Deck, dimmed
- **Shadows**: New World Night (active) / Haki Black (inactive)
- **Groups**: Same accent gradient, with Fire Fist gradients for locked groups
- **Groupbar**: Gear Red active tab on Calm Belt inactive tabs

### Hyprlock

- **Input field**: Straw outline on Calm Belt, Jinbe Tide while checking
- **Failed attempt**: Fire Fist ring with Gear Fifth text
- **Caps/Num lock**: Gold Leaf / Soul King Teal indicators
- **Labels**: Ponegliff White clock, Log Pose date, Straw greeting

---

## Customization

All theme files are plain text and can be easily modified. The color values are consistent across all files, so you can adjust them to your preference while maintaining visual harmony.

To create a variant (e.g., lighter background), update these values across all theme files:

| Role | Default | Description |
|------|---------|-------------|
| Primary BG | `#0d1117` | Main background |
| Secondary BG | `#161b22` | Panels, status bars |
| Tertiary BG | `#21262d` | Selection, highlights |

---

## Screenshots

*Coming soon*
