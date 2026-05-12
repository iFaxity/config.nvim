vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")

-- By efault
conform.setup({
  default_format_opts = {
    async = true,
    lsp_format = "fallback",
    timeout_ms = 500,
    stop_after_first = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run the first available formatter
    html = { "oxfmt", "prettier" },
    css = { "oxfmt", "prettier" },
    javascript = { "oxfmt", "prettier" },
    typescript = { "oxfmt", "prettier" },
    javascriptreact = { "oxfmt", "prettier" },
    typescriptreact = { "oxfmt", "prettier" },
    cs = { "csharpier" },
  },
})

--
-- Keymaps
--

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("format_keymaps", { clear = true }),
  pattern = "*",
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= "" then
      return
    end

    vim.keymap.set({ "n", "x" }, "<leader>cf", function()
      conform.format({
        force = true,
        async = true,
      })
    end, { buffer = ev.buf, desc = "Format" })
  end,
})
