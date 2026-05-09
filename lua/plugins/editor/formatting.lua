vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run the first available formatter
    javascript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    typescript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
    cs = { "csharpier" },
  },

  format_on_save = function(bufnr)
    if vim.bo[bufnr].filetype == "cs" then
      return
    end

    return {
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  end,

  format_after_save = function(bufnr)
    if vim.bo[bufnr].filetype ~= "cs" then
      return
    end

    return {
      lsp_format = "fallback",
    }
  end,
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
