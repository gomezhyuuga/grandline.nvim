# Lualine Highlight Groups

This document lists all highlight groups supported for the lualine.nvim statusline plugin.

## Theme File

The main lualine theme is defined in `lua/lualine/themes/grandline.lua`.

## Section Layout

Lualine divides the statusline into 6 sections:

```
+-------------------------------------------------+
| A | B | C                             X | Y | Z |
+-------------------------------------------------+
```

- **Left side**: A, B, C (mode, branch, filename)
- **Right side**: X, Y, Z (encoding, filetype, location)

## Custom Highlight Groups

These highlight groups are available for custom lualine components:

### Mode Indicators (Sections A & Z)

Sections A and Z use the same mode-specific colors:

| Highlight Group | Mode | Background Color |
|-----------------|------|------------------|
| `LualineNormalA` | Normal mode | `straw` (#e6b422) |
| `LualineInsertA` | Insert mode | `ichimonji` (#2d9d4f) |
| `LualineVisualA` | Visual mode | `robin` (#9d4edd) |
| `LualineReplaceA` | Replace mode | `clima_tact` (#f77f00) |
| `LualineCommandA` | Command mode | `gol_d` (#fcbf49) |

### Secondary Sections (B & Y)

Sections B and Y share the same styling:

| Highlight Group | Description |
|-----------------|-------------|
| `LualineNormalB` | Section B (branch, diff info) |
| `LualineNormalY` | Section Y (filetype, progress) |

### Tertiary Sections (C & X)

Sections C and X share the same styling:

| Highlight Group | Description |
|-----------------|-------------|
| `LualineNormalC` | Section C (filename) |
| `LualineNormalX` | Section X (encoding, fileformat) |

## Section Styling

| Section | Position | Background | Foreground | Typical Content |
|---------|----------|------------|------------|-----------------|
| A | Left | Mode-specific | `new_world_night` (#0d1117) | Mode indicator |
| B | Left | `thousand_sunny_deck` (#21262d) | `ponegliff_white` (#e6edf3) | Git branch, diff |
| C | Left | `calm_belt` (#161b22) | `log_pose` (#8b949e) | Filename |
| X | Right | `calm_belt` (#161b22) | `log_pose` (#8b949e) | Encoding |
| Y | Right | `thousand_sunny_deck` (#21262d) | `ponegliff_white` (#e6edf3) | Filetype |
| Z | Right | Mode-specific | `new_world_night` (#0d1117) | Line:Column |

## Inactive Window

When a window is inactive, all sections use muted colors:

| Property | Value |
|----------|-------|
| Background | `haki_black` (#1a1a2e) |
| Foreground | `sea_stone` (#484f58) |

## Color Mapping

| Mode | Color | Hex | One Piece Reference |
|------|-------|-----|---------------------|
| Normal | `straw` | #e6b422 | Luffy's straw hat |
| Insert | `ichimonji` | #2d9d4f | Zoro's haramaki |
| Visual | `robin` | #9d4edd | Robin's color |
| Replace | `clima_tact` | #f77f00 | Nami's hair |
| Command | `gol_d` | #fcbf49 | Wano gold |
| Inactive | `haki_black` | #1a1a2e | Armament Haki |

## Usage

The theme is automatically available when you set grandline as your colorscheme:

```lua
require('lualine').setup({
  options = {
    theme = 'grandline'
  }
})
```

Or use the custom highlight groups for advanced customization:

```lua
require('lualine').setup({
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  }
})
```

## Visual Demo

See `docs/lualine-demo.html` for an interactive visual preview of all modes and sections.
