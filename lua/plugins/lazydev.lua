vim.pack.add({
  { src = "https://github.com/folke/lazydev.nvim" },
})

require("lazydev").setup({
  -- Configures LuaLS to support auto-completion and type checking
  -- While editing your Neovim configuration.
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = "snacks.nvim", words = { "Snacks" } },
    { path = "nvim-lspconfig", words = { "lspconfig.settings" } },
  },
})
