vim.pack.add({
  { src = "https://github.com/MagicDuck/grug-far.nvim" },
})

local grug = require("grug-far")

grug.setup({})

--
-- Keymaps
--
local map = vim.keymap.set

map("n", "<leader>.", function()
  grug.open({ transient = true })
end, { desc = "Ripgrep" })
