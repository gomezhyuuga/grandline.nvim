-- Grandline Icons
-- Custom One Piece-themed icons for use with the Grandline Icons font
-- See fonts/README.md for font installation instructions

local M = {}

-- Custom icons (requires Grandline Icons font as fallback)
-- These use the Supplementary Private Use Area-B (U+100000+)
M.straw_hat = vim.fn.nr2char(0x100000)
M.jolly_roger = vim.fn.nr2char(0x100001)

-- Fallback: Use a similar Nerd Font icon if custom font not installed
-- M.straw_hat_fallback = "" -- nf-fa-circle or similar

-- Future icons (uncomment when added to the font)
-- M.going_merry = vim.fn.nr2char(0x100002)
-- M.thousand_sunny = vim.fn.nr2char(0x100003)
-- M.devil_fruit = vim.fn.nr2char(0x100004)
-- M.log_pose = vim.fn.nr2char(0x100005)
-- M.den_den_mushi = vim.fn.nr2char(0x100006)
-- M.straw_hat_flag = vim.fn.nr2char(0x100007)

return M
