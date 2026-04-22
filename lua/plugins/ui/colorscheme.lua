vim.pack.add({
  { src = "https://github.com/catppuccin/nvim" },
})

local catppuccin = require("catppuccin")

catppuccin.setup({
  flavour = "frappe",
  lsp_styles = {
    underlines = {
      errors = { "undercurl" },
      hints = { "undercurl" },
      warnings = { "undercurl" },
      information = { "undercurl" },
    },
  },
  integrations = {
    blink_cmp = {
      style = "bordered",
    },
    dap = true,
    dap_ui = true,
    gitsigns = true,
    lualine = {},
    lsp_trouble = true,
    mason = true,
    mini = true,
    neotest = true,
    noice = true,
    snacks = {
      enabled = true,
      indent_scope_color = "lavender",
    },
    which_key = true,
  },
})

vim.cmd.colorscheme("catppuccin")
