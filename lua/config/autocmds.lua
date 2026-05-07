--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {
    clear = true,
  }),
  callback = function()
    vim.hl.on_yank({
      timeout = 300,
    })
  end,
})

-- Close help pages and qf with `q`
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", {
    clear = true,
  }),
  pattern = { "help", "qf", "man" },
  callback = function(args)
    vim.keymap.set("n", "q", "<cmd>quit<cr>", {
      buf = args.buf,
      silent = true,
    })
  end,
})

-- Remove keymaps from the builtin sqlcomplete plugin
-- See: https://github.com/neovim/neovim/issues/26977
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.keymap.del("i", "<left>", { buffer = true })
    vim.keymap.del("i", "<right>", { buffer = true })
  end,
})
