vim.pack.add({
  { src = "https://github.com/folke/todo-comments.nvim" },
})

local todo_comments = require("todo-comments")

todo_comments.setup()

--
-- Keymaps
--

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("todo_comments_keys", { clear = true }),
  pattern = "*",
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= "" then
      return
    end
    vim.keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { buffer = ev.buf, desc = "Next todo comment" })
    vim.keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { buffer = ev.buf, desc = "Previous todo comment" })
  end,
})
