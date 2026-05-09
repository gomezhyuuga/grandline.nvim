---
name: Bug report
about: Something looks wrong or broken
labels: bug
---

## Description

<!-- What's wrong? A highlight group looks off, a color is missing, etc. -->

## Steps to reproduce

<!-- Minimal config and steps to see the issue -->

```lua
-- minimal init.lua
vim.opt.termguicolors = true
require("grandline").setup()
vim.cmd("colorscheme grandline")
```

## Expected vs actual

<!-- What did you expect to see? What do you see instead? -->

## Environment

- Neovim version (`:version`):
- OS / terminal emulator:
- Truecolor supported? (`:checkhealth`):
- grandline.nvim version / commit:
