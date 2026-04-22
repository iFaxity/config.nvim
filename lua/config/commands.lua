local command = vim.api.nvim_create_user_command

command("PackUpdate", function()
  vim.pack.update()
end, { desc = "Update packages" })

command("PackUpdateForce", function()
  vim.pack.update(nil, { force = true })
end, { desc = "Update packages (force)" })
