vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})

local pairs = require("mini.pairs")
local icons = require("mini.icons")
local surround = require("mini.surround")

-- Auto pairs
-- Automatically inserts a matching closing character
-- when you type an opening character like `"`, `[`, or `(`.
pairs.setup({
  modes = {
    insert = true,
    command = false, --true,
    terminal = false,
  },
})

-- Icons
icons.setup()

-- Surround
surround.setup({
  -- Keymaps
  mappings = {
    add = "gsa",
    delete = "gsd",
    find = "gsf",
    find_left = "gsF",
    highlight = "gsh",
    replace = "gsr",
    suffix_last = "l",
    suffix_next = "n",
  },
  -- Max number of lines within which surrounding is searched
  n_lines = 20,
})
