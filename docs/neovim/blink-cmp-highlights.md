# blink.cmp Highlight Groups

This document lists all highlight groups supported for the blink.cmp completion plugin.

## Categories and Groups

### Menu Window

| Highlight Group | Description | Color (fg/bg) |
|-----------------|-------------|---------------|
| `BlinkCmpMenu` | Completion menu background and text | `ponegliff_white` #e6edf3 / `calm_belt` #161b22 |
| `BlinkCmpMenuBorder` | Completion menu border | `sea_stone` #484f58 / `calm_belt` #161b22 |
| `BlinkCmpMenuSelection` | Selected item in menu | `gear_fifth` #ff6b7a / `dropdown_item_bg` #4b242c |
| `BlinkCmpScrollBarThumb` | Scrollbar thumb | — / `sea_stone` #484f58 |
| `BlinkCmpScrollBarGutter` | Scrollbar gutter/track | — / `calm_belt` #161b22 |

### Labels

| Highlight Group | Description | Color (fg) |
|-----------------|-------------|------------|
| `BlinkCmpLabel` | Completion item label | `ponegliff_white` #e6edf3 |
| `BlinkCmpLabelDeprecated` | Deprecated item (strikethrough) | `sea_stone` #484f58 |
| `BlinkCmpLabelMatch` | Matched characters in label | `clima_tact` #f77f00 **bold** |
| `BlinkCmpLabelDetail` | Additional label details | `log_pose` #8b949e |
| `BlinkCmpLabelDescription` | Item description | `log_pose` #8b949e |

### Source and Ghost Text

| Highlight Group | Description | Color (fg) |
|-----------------|-------------|------------|
| `BlinkCmpSource` | Completion source indicator | `sea_stone` #484f58 |
| `BlinkCmpGhostText` | Inline ghost text preview | `sea_stone` #484f58 *italic* |

### Documentation

| Highlight Group | Description | Color (fg/bg) |
|-----------------|-------------|---------------|
| `BlinkCmpDoc` | Documentation popup | `ponegliff_white` #e6edf3 / `calm_belt` #161b22 |
| `BlinkCmpDocBorder` | Documentation border | `sea_stone` #484f58 / `calm_belt` #161b22 |
| `BlinkCmpDocSeparator` | Separator in documentation | `sea_stone` #484f58 / `calm_belt` #161b22 |
| `BlinkCmpDocCursorLine` | Cursor line in documentation | — / `thousand_sunny_deck` #21262d |

### Signature Help

| Highlight Group | Description | Color (fg/bg) |
|-----------------|-------------|---------------|
| `BlinkCmpSignatureHelp` | Signature help popup | `ponegliff_white` #e6edf3 / `calm_belt` #161b22 |
| `BlinkCmpSignatureHelpBorder` | Signature help border | `sea_stone` #484f58 / `calm_belt` #161b22 |
| `BlinkCmpSignatureHelpActiveParameter` | Active parameter highlight | `clima_tact` #f77f00 **bold** |

### Kind Icons

| Highlight Group | Description | Color (fg) |
|-----------------|-------------|------------|
| `BlinkCmpKind` | Default kind icon | `log_pose` #8b949e |
| `BlinkCmpKindText` | Text completions | `log_pose` #8b949e |
| `BlinkCmpKindMethod` | Method completions | `ichimonji` #2d9d4f |
| `BlinkCmpKindFunction` | Function completions | `ichimonji` #2d9d4f |
| `BlinkCmpKindConstructor` | Constructor completions | `all_blue` #2f7ebf |
| `BlinkCmpKindField` | Field completions | `radical_beam_cyan` #00c8d4 |
| `BlinkCmpKindVariable` | Variable completions | `ponegliff_white` #e6edf3 |
| `BlinkCmpKindClass` | Class completions | `all_blue` #2f7ebf |
| `BlinkCmpKindInterface` | Interface completions | `all_blue` #2f7ebf |
| `BlinkCmpKindModule` | Module completions | `jinbe_tide` #58a6ff |
| `BlinkCmpKindProperty` | Property completions | `radical_beam_cyan` #00c8d4 |
| `BlinkCmpKindUnit` | Unit completions | `gol_d` #fcbf49 |
| `BlinkCmpKindValue` | Value completions | `gol_d` #fcbf49 |
| `BlinkCmpKindEnum` | Enum completions | `all_blue` #2f7ebf |
| `BlinkCmpKindKeyword` | Keyword completions | `straw` #e6b422 |
| `BlinkCmpKindSnippet` | Snippet completions | `robin` #9d4edd |
| `BlinkCmpKindColor` | Color completions | `sakura_bloom` #d970c4 |
| `BlinkCmpKindFile` | File completions | `ponegliff_white` #e6edf3 |
| `BlinkCmpKindReference` | Reference completions | `jinbe_tide` #58a6ff |
| `BlinkCmpKindFolder` | Folder completions | `gol_d` #fcbf49 |
| `BlinkCmpKindEnumMember` | Enum member completions | `gol_d` #fcbf49 |
| `BlinkCmpKindConstant` | Constant completions | `gol_d` #fcbf49 |
| `BlinkCmpKindStruct` | Struct completions | `all_blue` #2f7ebf |
| `BlinkCmpKindEvent` | Event completions | `robin` #9d4edd |
| `BlinkCmpKindOperator` | Operator completions | `log_pose` #8b949e |
| `BlinkCmpKindTypeParameter` | Type parameter completions | `all_blue` #2f7ebf |
| `BlinkCmpKindCopilot` | Copilot suggestions | `soul_king_teal` #56d4dd |

## Color Mapping

| Element | Color | Hex | One Piece Reference |
|---------|-------|-----|---------------------|
| Matches | `clima_tact` | #f77f00 | Nami's hair |
| Selection | `gear_fifth` / `dropdown_item_bg` | #ff6b7a / #4b242c | Luffy awakened |
| Functions/Methods | `ichimonji` | #2d9d4f | Zoro's haramaki |
| Classes/Types | `all_blue` | #2f7ebf | Sanji's dream |
| Modules | `jinbe_tide` | #58a6ff | Jinbe (sea) |
| Properties/Fields | `radical_beam_cyan` | #00c8d4 | Franky's tech |
| Keywords | `straw` | #e6b422 | Luffy's straw hat |
| Snippets/Events | `robin` | #9d4edd | Robin's color |
| Constants/Values | `gol_d` | #fcbf49 | Wano gold |
| Copilot | `soul_king_teal` | #56d4dd | Brook |
| Deprecated | `sea_stone` | #484f58 | Muted/disabled |
