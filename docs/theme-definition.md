# One Piece Color Scheme: "Grand Line"

A dark, vibrant color scheme inspired by One Piece for terminals and text editors.

---

## Base Background & Foreground

| Name | Hex | RGB | Use |
|------|-----|-----|-----|
| **New World Night** | `#0d1117` | `13, 17, 23` | Primary background |
| **Calm Belt** | `#161b22` | `22, 27, 34` | Secondary background / UI panels |
| **Thousand Sunny Deck** | `#21262d` | `33, 38, 45` | Selection / Highlighted lines |
| **Sea Stone** | `#484f58` | `72, 79, 88` | Muted UI chrome (line numbers, borders) |
| **Gray Terminal** | `#7d8590` | `125, 133, 144` | Comments |
| **Log Pose** | `#8b949e` | `139, 148, 158` | Secondary text |
| **Ponegliff White** | `#e6edf3` | `230, 237, 243` | Primary foreground text |

---

## ANSI 16-Color Palette

### Normal Colors (0-7)

| ANSI | Name | Hex | RGB | Inspiration |
|------|------|-----|-----|-------------|
| 0 | **Blackbeard** | `#0d1117` | `13, 17, 23` | Dark as the Yami Yami no Mi |
| 1 | **Gear Red** | `#e63946` | `230, 57, 70` | Luffy's signature color |
| 2 | **Ichimonji** | `#2d9d4f` | `45, 157, 79` | Zoro's haramaki |
| 3 | **Clima-Tact Orange** | `#f77f00` | `247, 127, 0` | Nami's hair |
| 4 | **All Blue** | `#2f7ebf` | `47, 126, 191` | Sanji's dream sea |
| 5 | **Nico Robin Purple** | `#9d4edd` | `157, 78, 221` | Robin's color scheme |
| 6 | **Radical Beam Cyan** | `#00c8d4` | `0, 200, 212` | Franky's tech |
| 7 | **Ponegliff White** | `#e6edf3` | `230, 237, 243` | Ancient text glow |

### Bright Colors (8-15)

| ANSI | Name | Hex | RGB | Inspiration |
|------|------|-----|-----|-------------|
| 8 | **Sea Stone** | `#484f58` | `72, 79, 88` | Seastone cuffs |
| 9 | **Gear Fifth** | `#ff6b7a` | `255, 107, 122` | Luffy's awakening glow |
| 10 | **Enma Glow** | `#5bda7c` | `91, 218, 124` | Zoro's cursed blade aura |
| 11 | **Gold Leaf** | `#fcbf49` | `252, 191, 73` | Wano gold / Straw hat |
| 12 | **Jinbe Tide** | `#58a6ff` | `88, 166, 255` | First Son of the Sea |
| 13 | **Sakura Bloom** | `#d970c4` | `217, 112, 196` | Wano cherry blossoms |
| 14 | **Soul King Teal** | `#56d4dd` | `86, 212, 221` | Brook's soul flames |
| 15 | **Snow White** | `#ffffff` | `255, 255, 255` | Pure white |

---

## Extended Accent Colors (Truecolor)

| Name | Hex | RGB | Inspiration |
|------|-----|-----|-------------|
| **Kabuki Red** | `#c41e3a` | `196, 30, 58` | Wano theater, deep dramatic red |
| **Fire Fist** | `#ff4500` | `255, 69, 0` | Ace's Mera Mera flames |
| **Beli Gold** | `#ffd700` | `255, 215, 0` | Berry currency |
| **Monster Point Pink** | `#ff69b4` | `255, 105, 180` | Chopper's rumble ball |
| **Indigo Kimono** | `#4b0082` | `75, 0, 130` | Traditional Wano fabric |
| **Kozuki Crest** | `#d4af37` | `212, 175, 55` | Wano's royal gold |
| **Marine Blue** | `#003f87` | `0, 63, 135` | Navy coat justice |
| **Haki Black** | `#1a1a2e` | `26, 26, 46` | Armament hardening |
| **Conqueror Lightning** | `#9d00ff` | `157, 0, 255` | Conqueror's Haki clash |
| **Straw Yellow** | `#e6c200` | `230, 194, 0` | The iconic hat |

---

## Syntax Highlighting Mapping

| Role | Color Name | Hex | Rationale |
|------|------------|-----|-----------|
| **Keywords** | Gear Red | `#e63946` | Commands stand out like Luffy leading the crew |
| **Strings** | Clima-Tact Orange | `#f77f00` | Text content, warm and readable |
| **Numbers / Constants** | Gold Leaf | `#fcbf49` | Treasure, precious values |
| **Functions / Methods** | Ichimonji | `#2d9d4f` | Actions, like Zoro's techniques |
| **Types / Classes** | All Blue | `#2f7ebf` | Structural, foundational |
| **Variables** | Ponegliff White | `#e6edf3` | Core readable text |
| **Comments** | Gray Terminal | `#7d8590` | Muted, but readable over diff hunks |
| **Operators** | Log Pose | `#8b949e` | Navigation symbols |
| **Errors** | Fire Fist | `#ff4500` | Urgent, fiery warning |
| **Warnings** | Straw Yellow | `#e6c200` | Attention-grabbing |
| **Success / Added** | Enma Glow | `#5bda7c` | Positive, victorious |
| **Deleted / Removed** | Kabuki Red | `#c41e3a` | Dramatic removal |

---

## UI Element Mapping

| Element | Color Name | Hex |
|---------|------------|-----|
| Background | New World Night | `#0d1117` |
| Panel / Sidebar | Calm Belt | `#161b22` |
| Visual Selection (fg) | Gear Fifth | `#ff6b7a` |
| Visual Selection (bg) | Dropdown Item BG | `#4b242c` |
| Current Line | Thousand Sunny Deck | `#21262d` |
| Cursor | Gear Fifth | `#ff6b7a` |
| Line Numbers | Sea Stone | `#484f58` |
| Matching Bracket | Conqueror Lightning | `#9d00ff` |
| Search Highlight | Beli Gold | `#ffd700` |
| Link | Jinbe Tide | `#58a6ff` |
| Active Tab | Gear Red | `#e63946` |
| Inactive Tab | Calm Belt | `#161b22` |

---

## Terminal Color Index (256-Color Approximations)

For terminals limited to 256 colors, use these closest indices:

| Name | Hex | 256 Index |
|------|-----|-----------|
| Blackbeard | `#0d1117` | 233 |
| Gear Red | `#e63946` | 167 |
| Ichimonji | `#2d9d4f` | 35 |
| Clima-Tact Orange | `#f77f00` | 208 |
| All Blue | `#2f7ebf` | 68 |
| Nico Robin Purple | `#9d4edd` | 135 |
| Radical Beam Cyan | `#00c8d4` | 44 |
| Ponegliff White | `#e6edf3` | 255 |
| Sea Stone | `#484f58` | 240 |
| Gear Fifth | `#ff6b7a` | 204 |
| Enma Glow | `#5bda7c` | 84 |
| Gold Leaf | `#fcbf49` | 220 |
| Jinbe Tide | `#58a6ff` | 75 |
| Sakura Bloom | `#d970c4` | 176 |
| Soul King Teal | `#56d4dd` | 80 |
| Snow White | `#ffffff` | 231 |

---

## Quick Reference Palette

```
Background:    #0d1117  â–ˆâ–ˆâ–ˆâ–ˆ  New World Night
Foreground:    #e6edf3  â–ˆâ–ˆâ–ˆâ–ˆ  Ponegliff White

Red:           #e63946  â–ˆâ–ˆâ–ˆâ–ˆ  Gear Red
Green:         #2d9d4f  â–ˆâ–ˆâ–ˆâ–ˆ  Ichimonji
Yellow:        #fcbf49  â–ˆâ–ˆâ–ˆâ–ˆ  Gold Leaf
Blue:          #2f7ebf  â–ˆâ–ˆâ–ˆâ–ˆ  All Blue
Purple:        #9d4edd  â–ˆâ–ˆâ–ˆâ–ˆ  Nico Robin Purple
Cyan:          #00c8d4  â–ˆâ–ˆâ–ˆâ–ˆ  Radical Beam Cyan
Orange:        #f77f00  â–ˆâ–ˆâ–ˆâ–ˆ  Clima-Tact Orange

Bright Red:    #ff6b7a  â–ˆâ–ˆâ–ˆâ–ˆ  Gear Fifth
Bright Green:  #5bda7c  â–ˆâ–ˆâ–ˆâ–ˆ  Enma Glow
Bright Blue:   #58a6ff  â–ˆâ–ˆâ–ˆâ–ˆ  Jinbe Tide
Bright Purple: #d970c4  â–ˆâ–ˆâ–ˆâ–ˆ  Sakura Bloom
Bright Cyan:   #56d4dd  â–ˆâ–ˆâ–ˆâ–ˆ  Soul King Teal

Muted:         #484f58  â–ˆâ–ˆâ–ˆâ–ˆ  Sea Stone
Comment:       #7d8590  â–ˆâ–ˆâ–ˆâ–ˆ  Gray Terminal
```

---

## Diff Backgrounds

Derived at load time by blending an accent into **New World Night**, so they
stay in sync with the palette. The ratios are deliberately low: diff lines keep
their own syntax highlighting, and plugins that brighten these to mark
word-level changes (codediff.nvim scales the line background by 1.4x) must
still land on a readable background.

| Group | Blend | Hex | Comment contrast |
|-------|-------|-----|------------------|
| `DiffAdd` | Ichimonji @ 17% | `#122820` | 4.17:1 |
| `DiffChange` | Gold Leaf @ 11% | `#27241c` | 4.15:1 |
| `DiffDelete` | Kabuki Red @ 26% | `#3c1420` | 4.29:1 |
| `DiffText` | Gold Leaf @ 22% | `#413722` | 3.14:1 |
| `GitSignsAddInline` | Ichimonji @ 32% | `#173d28` | 3.25:1 |
| `GitSignsDeleteInline` | Kabuki Red @ 46% | `#611627` | 3.41:1 |

---

## Usage Notes

- **High contrast**: All accent colors meet WCAG AA contrast against the dark backgrounds
- **Semantic colors**: Errors are warm (fire), success is cool (green glow), warnings are gold
- **Crew representation**: Core Straw Hats each have a signature color in the ANSI palette
- **Wano influence**: Gold Leaf, Kabuki Red, Sakura Bloom, and Indigo Kimono add traditional Japanese flair

---
