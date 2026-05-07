vim.pack.add({
  { src = "https://github.com/akinsho/bufferline.nvim" },
})

local catppuccin = require("catppuccin.special.bufferline")
local palettes = require("catppuccin.palettes")
local frappe = palettes.get_palette("frappe")
local bufferline = require("bufferline")

bufferline.setup({
  highlights = catppuccin.get_theme({
    custom = {
      all = {
        fill = {
          bg = frappe.base,
        },
      },
    },
  }),
  options = {
    close_command = function(buf)
      Snacks.bufdelete(buf)
    end,
    right_mouse_command = function(buf)
      Snacks.bufdelete(buf)
    end,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diag)
      if diag.error then
        return ""
      end

      if diag.warning then
        return " "
      end

      return ""
    end,
  },
})
