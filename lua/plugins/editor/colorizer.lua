--
-- Plugin for rendering colors in text/code
--

vim.pack.add({
  { src = "https://github.com/catgoose/nvim-colorizer.lua" },
})

local colorizer = require("colorizer")

colorizer.setup({
  filetypes = {
    --    "*",
    --    "!markdown",
    "css",
    "javascript",
    html = {
      mode = "foreground",
    },
  },
  options = {
    parser = {
      css = true,
      css_color = { enable = true },
      sass = { enable = true },
      css_var_rgb = { enable = true },
      tailwind = {
        enable = true,
        update_names = true,
        lsp = true,
      },
    },
  },
})
