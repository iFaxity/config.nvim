vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})

-- Auto pairs
-- Automatically inserts a matching closing character
-- when you type an opening character like `"`, `[`, or `(`.
require("mini.pairs").setup({
  modes = {
    insert = true,
    command = false, --true,
    terminal = false,
  },
})

-- Icons
require("mini.icons").setup()

-- Notification system
require("mini.notify").setup()
