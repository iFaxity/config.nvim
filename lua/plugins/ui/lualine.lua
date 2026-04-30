vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local lualine = require("lualine")

lualine.setup({
  options = {
    -- Make lualine span entire window (over other ui elements)
    globalstatus = true,
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
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
