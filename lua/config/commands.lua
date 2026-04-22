local command = vim.api.nvim_create_user_command

command("PackUpdate", function()
  vim.pack.update()
end, { desc = "Update packages" })

command("PackUpdateForce", function()
  vim.pack.update(nil, { force = true })
end, { desc = "Update packages (force)" })

command("PackDelete", function(opts)
  vim.pack.del(opts.fargs)
end, { desc = "Delete package", nargs = "+" })

command("PackClean", function()
  local inactivePacks = vim
    .iter(vim.pack.get())
    :filter(function(pkg)
      return not pkg.active
    end)
    :map(function(pkg)
      return pkg.spec.name
    end)
    :totable()

  vim.pack.del(inactivePacks)
end, { desc = "Cleanup inactive packages" })
