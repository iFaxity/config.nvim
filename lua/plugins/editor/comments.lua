--
-- Improves comments functionality in nvim
--
vim.pack.add({
  { src = "https://github.com/folke/ts-comments.nvim" },
})

local ts_comments = require("ts-comments")

ts_comments.setup()
