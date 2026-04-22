vim.pack.add({
  { src = "https://github.com/akinsho/bufferline.nvim" },
})

local catppuccin = require("catppuccin.special.bufferline")
local palettes = require("catppuccin.palettes")
local frappe = palettes.get_palette("frappe")

require("bufferline").setup({
  --  -- stylua: ignore
  --  close_command = function(n) Snacks.bufdelete(n) end,
  --  -- stylua: ignore
  --  right_mouse_command = function(n) Snacks.bufdelete(n) end,
  --  diagnostics = "nvim_lsp",
  --  always_show_bufferline = false,
  highlights = catppuccin.get_theme({
    custom = {
      all = {
        fill = {
          bg = frappe.base,
        },
      },
    },
  }),
})
