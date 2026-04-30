vim.pack.add({
  { src = "https://github.com/akinsho/bufferline.nvim" },
})

local catppuccin = require("catppuccin.special.bufferline")
local palettes = require("catppuccin.palettes")
local frappe = palettes.get_palette("frappe")
local bufferline = require("bufferline")

bufferline.setup({
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
  options = {

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

--
-- Keymaps
--

local map = vim.keymap.set

map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete buffer" })
