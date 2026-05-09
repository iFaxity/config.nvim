vim.pack.add({
  { src = "https://github.com/folke/flash.nvim" },
})

local flash = require("flash")

flash.setup({})

--
-- Keymaps
--
local map = vim.keymap.set

map({ "n", "x", "o" }, "s", function()
  flash.jump()
end, { desc = "Flash: Jump" })

map({ "n", "x", "o" }, "S", function()
  flash.treesitter()
end, { desc = "Flash: Treesitter" })

map("o", "r", function()
  flash.remote()
end, { desc = "Flash: Remote" })

map({ "o", "x" }, "R", function()
  flash.treesitter_search()
end, { desc = "Flash: Treesitter search" })

map("c", "<C-s>", function()
  flash.toggle()
end, { desc = "Flash: Toggle" })
