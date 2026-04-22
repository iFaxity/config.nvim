vim.pack.add({
  { src = "https://github.com/folke/todo-comments.nvim" },
})

local todo_comments = require("todo-comments")

todo_comments.setup()

--
-- Keymaps
--

local map = vim.keymap.set

map("n", "]t", function()
  todo_comments.jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  todo_comments.jump_prev()
end, { desc = "Previous todo comment" })
