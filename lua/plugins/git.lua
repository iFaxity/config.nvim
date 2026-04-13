vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/f-person/git-blame.nvim" },
  { src = "https://github.com/akinsho/git-conflict.nvim" },
})

-- Setup gutter indicators
require("gitsigns").setup()

-- Setup inline blames
require("gitblame").setup({
  enabled = true,
})

-- Setup prettier conflicts
require("git-conflict").setup()
