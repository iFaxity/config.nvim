vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua", stop_after_first = true },
    -- Conform will run the first available formatter
    javascript = { "oxfmt", "prettier", stop_after_first = true },
    typescript = { "oxfmt", "prettier", stop_after_first = true },
    javascriptreact = { "oxfmt", "prettier", stop_after_first = true },
    typescriptreact = { "oxfmt", "prettier", stop_after_first = true },
    cs = { "csharpier", stop_after_first = true },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters = {
    csharpier = {
      -- Adding this flag ensures it works even if your
      -- .csproj uses a different CSharpier NuGet version
      args = { "--no-msbuild-check", "--write-stdout" },
    },
  },
})

--
-- Keymaps
--
local map = vim.keymap.set

map({ "n", "x" }, "<leader>cf", function()
  conform.format({ force = true })
end, { desc = "Format" })
