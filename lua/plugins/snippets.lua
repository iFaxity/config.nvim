vim.pack.add({
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").setup()
