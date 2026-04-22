vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})

local mini_pairs = require("mini.pairs")
local mini_icons = require("mini.icons")

-- Auto pairs
-- Automatically inserts a matching closing character
-- when you type an opening character like `"`, `[`, or `(`.
mini_pairs.setup({
  modes = {
    insert = true,
    command = false, --true,
    terminal = false,
  },
})

-- Icons
mini_icons.setup()
