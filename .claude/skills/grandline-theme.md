---
name: grandline-theme
description: "Loads the full grandline.nvim color palette, semantic roles, and naming conventions into context. Use this skill before any task that needs to reference, generate, or modify theme colors — such as creating terminal configs, adding plugin highlight groups, generating color exports, or building UI components that match the theme."
---

# Grandline Color Scheme Reference

You now have the complete grandline.nvim color palette loaded. Use this reference for any color-related task.

## Theme Identity

**grandline.nvim** is a dark, vibrant Neovim colorscheme inspired by One Piece (Post-Timeskip & Wano Arc). Every color is named after a Straw Hat crew member or One Piece element.

## Color Palette

### Backgrounds
| Name | Key | Hex | Use |
|------|-----|-----|-----|
| New World Night | `new_world_night` | `#0d1117` | Primary background |
| Calm Belt | `calm_belt` | `#161b22` | Secondary background / UI panels |
| Thousand Sunny Deck | `thousand_sunny_deck` | `#21262d` | Selection / Highlighted lines |
| Haki Black | `haki_black` | `#1a1a2e` | Darker accent |

### Foregrounds
| Name | Key | Hex | Use |
|------|-----|-----|-----|
| Sea Stone | `sea_stone` | `#484f58` | Comments / Muted text |
| Log Pose | `log_pose` | `#8b949e` | Secondary text |
| Ponegliff White | `ponegliff_white` | `#e6edf3` | Primary foreground |
| Snow White | `snow_white` | `#ffffff` | Pure white |

### ANSI Normal (Straw Hat Crew)
| Name | Key | Hex | ANSI | Inspiration |
|------|-----|-----|------|-------------|
| Blackbeard | `blackbeard` | `#0d1117` | 0 | Yami Yami no Mi |
| Gear Red | `gear_red` | `#e63946` | 1 | Luffy's signature |
| Ichimonji | `ichimonji` | `#2d9d4f` | 2 | Zoro's haramaki |
| Clima-Tact | `clima_tact` | `#f77f00` | 3 | Nami's hair |
| All Blue | `all_blue` | `#2f7ebf` | 4 | Sanji's dream |
| Robin | `robin` | `#9d4edd` | 5 | Robin's color |
| Radical Beam Cyan | `radical_beam_cyan` | `#00c8d4` | 6 | Franky's tech |

### ANSI Bright
| Name | Key | Hex | ANSI | Inspiration |
|------|-----|-----|------|-------------|
| Gear Fifth | `gear_fifth` | `#ff6b7a` | 9 | Luffy Awakened |
| Enma Glow | `enma_glow` | `#5bda7c` | 10 | Zoro's Enma blade |
| Gol D | `gol_d` | `#fcbf49` | 11 | Wano gold |
| Jinbe Tide | `jinbe_tide` | `#58a6ff` | 12 | First Son of the Sea |
| Sakura Bloom | `sakura_bloom` | `#d970c4` | 13 | Wano cherry blossoms |
| Soul King Teal | `soul_king_teal` | `#56d4dd` | 14 | Brook's soul flames |

### Extended Accents
| Name | Key | Hex | Inspiration |
|------|-----|-----|-------------|
| Kabuki Red | `kabuki_red` | `#c41e3a` | Deep dramatic red |
| Fire Fist | `fire_fist` | `#ff4500` | Ace's flames |
| Beli Gold | `beli_gold` | `#ffd700` | Berry currency |
| Straw Yellow | `straw_yellow` | `#e6c200` | Warnings |
| Straw | `straw` | `#e6b422` | Primary accent - Luffy's Straw Hat |
| Conqueror Lightning | `conqueror_lightning` | `#9d00ff` | Conqueror's Haki |
| Marine Blue | `marine_blue` | `#003f87` | Navy blue |

## Semantic Role Mapping

These are role-based aliases defined in `palette.semantic`:

| Role | Color Key | Hex |
|------|-----------|-----|
| `bg` | new_world_night | `#0d1117` |
| `bg_float` | calm_belt | `#161b22` |
| `bg_highlight` | thousand_sunny_deck | `#21262d` |
| `bg_dark` | haki_black | `#1a1a2e` |
| `fg` | ponegliff_white | `#e6edf3` |
| `fg_muted` | log_pose | `#8b949e` |
| `fg_dark` | sea_stone | `#484f58` |
| `border` | soul_king_teal | `#56d4dd` |
| `border_contrast` | straw | `#e6b422` |
| `primary` | straw | `#e6b422` |
| `red` | gear_red | `#e63946` |
| `green` | ichimonji | `#2d9d4f` |
| `yellow` | gol_d | `#fcbf49` |
| `blue` | all_blue | `#2f7ebf` |
| `purple` | robin | `#9d4edd` |
| `cyan` | radical_beam_cyan | `#00c8d4` |
| `orange` | clima_tact | `#f77f00` |
| `bright_red` | gear_fifth | `#ff6b7a` |
| `bright_green` | enma_glow | `#5bda7c` |
| `bright_yellow` | gol_d | `#fcbf49` |
| `bright_blue` | jinbe_tide | `#58a6ff` |
| `bright_purple` | sakura_bloom | `#d970c4` |
| `bright_cyan` | soul_king_teal | `#56d4dd` |
| `error` | fire_fist | `#ff4500` |
| `warning` | straw_yellow | `#e6c200` |
| `info` | jinbe_tide | `#58a6ff` |
| `hint` | soul_king_teal | `#56d4dd` |
| `success` | enma_glow | `#5bda7c` |
| `add` | enma_glow | `#5bda7c` |
| `change` | gol_d | `#fcbf49` |
| `delete` | kabuki_red | `#c41e3a` |
| `scroll_thumb` | gol_d | `#fcbf49` |
| `scroll_gutter` | thousand_sunny_deck | `#21262d` |
| `dropdown_item_fg` | gear_fifth | `#ff6b7a` |
| `dropdown_item_bg` | — | `#4b242c` |

## Syntax Highlighting Roles

| Role | Color | Hex |
|------|-------|-----|
| Keywords | Gear Red | `#e63946` |
| Strings | Clima-Tact | `#f77f00` |
| Numbers / Constants | Gol D | `#fcbf49` |
| Functions / Methods | Ichimonji | `#2d9d4f` |
| Types / Classes | All Blue | `#2f7ebf` |
| Variables | Ponegliff White | `#e6edf3` |
| Comments | Sea Stone | `#484f58` |
| Operators | Log Pose | `#8b949e` |
| Errors | Fire Fist | `#ff4500` |
| Warnings | Straw Yellow | `#e6c200` |
| Success / Added | Enma Glow | `#5bda7c` |
| Deleted / Removed | Kabuki Red | `#c41e3a` |

## Key Source Files

- **Palette**: `lua/grandline/palette.lua` — all hex values in `M.colors` and `M.semantic`
- **Highlights**: `lua/grandline/highlights.lua` — Neovim highlight group definitions
- **Lualine**: `lua/lualine/themes/grandline.lua` — statusline theme
- **Extras**: `extras/` — terminal configs (Ghostty, Alacritty, WezTerm, iTerm)
- **Docs**: `docs/theme-definition.md` — full color reference with RGB and 256-color indices

## Guidelines

- Always use One Piece-themed names for new colors
- Reference colors by their palette key (e.g., `gear_red`, not raw hex)
- When generating configs for terminals or tools, use the exact hex values from this reference
- The palette source of truth is `lua/grandline/palette.lua` — always verify against it for the latest values
