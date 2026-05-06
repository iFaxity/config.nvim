vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local noice = require("noice")
local lualine = require("lualine")

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    -- Make lualine span entire window (over other ui elements)
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        "WinEnter",
        "BufEnter",
        "BufWritePost",
        "SessionLoadPost",
        "FileChangedShellPost",
        "VimResized",
        "Filetype",
        "CursorMoved",
        "CursorMovedI",
        "ModeChanged",
      },
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      'filename',
      {
        'diff',
        symbols = {
          added    = " ",
          modified = " ",
          removed  = " ",
        },
      },
      {
        'diagnostics',
        symbols = {
          error = " ",
          warn  = " ",
          hint  = " ",
          info  = " ",
        }
      },
    },
    lualine_x = {
      {
        noice.api.status.message.get_hl,
        cond = noice.api.status.message.has,
      },
      {
        noice.api.status.command.get,
        cond = noice.api.status.command.has,
        color = { fg = "#ff9e64" },
      },
      {
        noice.api.status.search.get,
        cond = noice.api.status.search.has,
        color = { fg = "#ff9e64" },
      },
      "encoding",
      "fileformat",
      "filetype",
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
