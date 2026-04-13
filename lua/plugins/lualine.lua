vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
  options = {
    -- Make lualine span entire window (over other ui elements)
    globalstatus = true,
  },
})
