-- Tabby.nvim theme for grandline.nvim
-- A One Piece-inspired tabline configuration
local icons = require("grandline.icons")

local M = {}

-- Nerd Font number icons (1-10)
local number_icons = {
  "󰲠", -- 1
  "󰲢", -- 2
  "󰲤", -- 3
  "󰲦", -- 4
  "󰲨", -- 5
  "󰲪", -- 6
  "󰲬", -- 7
  "󰲮", -- 8
  "󰲰", -- 9
  "󰿭", -- 10
}

-- Get tab number as Nerd Font icon
local function get_tab_icon(tab_num)
  if tab_num <= 10 then
    return number_icons[tab_num]
  else
    return tostring(tab_num)
  end
end

-- Get current file's folder path relative to project root
local function get_relative_folder()
  local file = vim.fn.expand("%:p")
  local cwd = vim.fn.getcwd()

  if file == "" then
    return "  " .. vim.fn.fnamemodify(cwd, ":t")
  end

  local relative = vim.fn.fnamemodify(file, ":.")
  local dir = vim.fn.fnamemodify(relative, ":h")

  if dir == "." or dir == "" then
    return "  " .. vim.fn.fnamemodify(cwd, ":t")
  end

  return "  " .. dir
end

-- Setup tabby with grandline theme
function M.setup()
  local ok, tabby = pcall(require, "tabby")
  if not ok then
    vim.notify("tabby.nvim not found", vim.log.levels.WARN)
    return
  end

  tabby.setup({
    line = function(line)
      return {
        -- Left header with pirate flag
        {
          { "  ", hl = "TabbyHead" },
          line.sep("", "TabbyHeadSep", "TabbyFill"),
        },

        -- Tabs
        line.tabs().foreach(function(tab)
          local is_current = tab.is_current()
          local tab_num = tab.number()
          local tab_icon = get_tab_icon(tab_num)

          local hl_tab = is_current and "TabbyTabActive" or "TabbyTabInactive"
          local hl_num = is_current and "TabbyTabActiveNum" or "TabbyTabInactiveNum"
          local hl_close = is_current and "TabbyTabActiveClose" or "TabbyTabInactiveClose"
          local hl_sep = is_current and "TabbyTabActiveSep" or "TabbyTabInactiveSep"

          return {
            line.sep("", hl_sep, "TabbyFill"),
            { " " .. tab_icon .. " ", hl = hl_num },
            { tab.name() .. " ", hl = hl_tab },
            tab.close_btn({ "󰅙 ", hl = hl_close }),
            line.sep("", hl_sep, "TabbyFill"),
            hl = hl_tab,
          }
        end),

        -- Spacer pushes folder path to the right
        line.spacer(),

        -- Right-aligned folder path
        {
          line.sep("", "TabbyTailSep", "TabbyFill"),
          { get_relative_folder() .. " ", hl = "TabbyTail" },
        },

        hl = "TabbyFill",
      }
    end,
    option = {
      buf_name = {
        mode = "unique",
      },
    },
  })
end

return M
