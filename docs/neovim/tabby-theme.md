# Tabby.nvim Theme for Grandline

This document describes the custom tabby.nvim theme included with grandline.nvim.

## Features

- **Tab number icons**: Nerd Font number icons (󰲠 󰲢 󰲤 󰲦 󰲨 󰲪 󰲬 󰲮 󰲰 󰿭) for tabs 1-10
- **Close button icon**: `󰅖` for closing tabs
- **Folder path display**: Right-aligned section showing current file's folder relative to project root
- **One Piece-themed colors**: Matches the grandline.nvim aesthetic

## Usage

After loading grandline, setup the tabby theme:

```lua
require("grandline").load()
require("grandline.tabby").setup()
```

With lazy.nvim:

```lua
{
  "gomezhyuuga/grandline.nvim",
  dependencies = { "nanozuki/tabby.nvim" },
  config = function()
    require("grandline").load()
    require("grandline.tabby").setup()
  end,
}
```

## Highlight Groups

### Main Elements

| Highlight Group | Description | Colors |
|-----------------|-------------|--------|
| `TabbyHead` | Left header section | `new_world_night` / `straw` **bold** |
| `TabbyHeadSep` | Header separator | `straw` / `haki_black` |
| `TabbyTail` | Right folder path section | `robin` #9d4edd / `calm_belt` |
| `TabbyTailSep` | Tail separator | `calm_belt` / `haki_black` |
| `TabbyFill` | Background fill | — / `haki_black` |

### Active Tab (Pirate King Style)

| Highlight Group | Description | Colors |
|-----------------|-------------|--------|
| `TabbyTabActive` | Active tab text | `ponegliff_white` / `new_world_night` **bold** |
| `TabbyTabActiveSep` | Active tab separator | `new_world_night` / `haki_black` |
| `TabbyTabActiveNum` | Tab number icon (active) | `gol_d` #fcbf49 / `new_world_night` **bold** |
| `TabbyTabActiveClose` | Close button (active) | `kabuki_red` / `new_world_night` |

### Inactive Tabs (Crew Members)

| Highlight Group | Description | Colors |
|-----------------|-------------|--------|
| `TabbyTabInactive` | Inactive tab text | `sea_stone` / `calm_belt` |
| `TabbyTabInactiveSep` | Inactive tab separator | `calm_belt` / `haki_black` |
| `TabbyTabInactiveNum` | Tab number icon (inactive) | `log_pose` / `calm_belt` |
| `TabbyTabInactiveClose` | Close button (inactive) | `sea_stone` / `calm_belt` |

### Modified Indicators

| Highlight Group | Description | Colors |
|-----------------|-------------|--------|
| `TabbyTabModified` | Modified file (active tab) | `clima_tact` #f77f00 / `new_world_night` |
| `TabbyTabInactiveModified` | Modified file (inactive tab) | `clima_tact` #f77f00 / `calm_belt` |

## Visual Layout

```
┌──────────────────────────────────────────────────────────────────────┐
│   󰲠 file.lua 󰅖   󰲢 config.lua 󰅖           lua/grandline │
│ ▲      ▲      ▲        ▲                              ▲              │
│ │      │      │        │                              │              │
│Head  Active  Close  Inactive                    Folder Path          │
└──────────────────────────────────────────────────────────────────────┘
```

## Tab Number Icons

| Tab | Icon |
|-----|------|
| 1 | 󰲠 |
| 2 | 󰲢 |
| 3 | 󰲤 |
| 4 | 󰲦 |
| 5 | 󰲨 |
| 6 | 󰲪 |
| 7 | 󰲬 |
| 8 | 󰲮 |
| 9 | 󰲰 |
| 10 | 󰿭 |
| 11+ | Number as text |

## Icons Used

| Element | Icon | Nerd Font Name |
|---------|------|----------------|
| Header | `` | Pirate flag |
| Folder | `` | nf-oct-file_directory |
| Close | `󰅖` | nf-md-close |
| Separators | `` `` | Powerline arrows |

## Color Philosophy

- **Active Tab**: Uses `new_world_night` background with bright `ponegliff_white` text and gold (`gol_d`) tab numbers — like the Pirate King standing out
- **Inactive Tabs**: Subdued `calm_belt` background with `sea_stone` text — crew members in the background
- **Tab Numbers**: Gold for active (treasure), muted for inactive
- **Close Button**: `kabuki_red` on active tabs for visibility
- **Folder Path**: `robin` purple in the right section — mysterious like Nico Robin

## Customization

To customize the theme, you can override the highlight groups after loading:

```lua
require("grandline").load()
require("grandline.tabby").setup()

-- Override specific highlights
vim.api.nvim_set_hl(0, "TabbyTabActiveNum", { fg = "#ff6b7a", bg = "#0a0e14", bold = true })
```

Or create your own theme by using `lua/grandline/tabby.lua` as a template.
