-- Remove keymaps from the builtin sqlcomplete plugin
-- See: https://github.com/neovim/neovim/issues/26977
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.keymap.del("i", "<left>", { buffer = true })
    vim.keymap.del("i", "<right>", { buffer = true })
  end,
})
