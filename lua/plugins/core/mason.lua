vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
})

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")
local mason_dap = require("mason-nvim-dap")

mason.setup({
  registries = {
    "github:mason-org/mason-registry",
    -- Required for dotnet/roslyn
    "github:Crashdummyy/mason-registry",
  },
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  automatic_enable = true,
  ensure_installed = {
    -- HTML LSP
    "html",
    -- CSS LSP
    "cssls",
    -- Tailwind LSP
    "tailwindcss",
    -- JS / TS LSP
    "vtsls",
    -- Lua LSP
    "lua_ls",
    -- GraphQL LSP
    "graphql",
    -- Emmet LSP
    "emmet_ls",
    -- Dotnet / Roslyn
    -- "roslyn",
  },
})

mason_tool_installer.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "oxfmt",
    "oxlint",
    "csharpier",
  },
})

mason_dap.setup({
  automatic_installation = true,
  ensure_installed = {
    "netcoredbg",
  },
})
