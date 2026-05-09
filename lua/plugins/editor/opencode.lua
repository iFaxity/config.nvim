vim.pack.add({
  { src = "https://github.com/nickjvandyke/opencode.nvim" },
})

local opencode = require("opencode")

-- Required for `opts.events.reload`
vim.o.autoread = true

--
-- Keymaps
--
local map = vim.keymap.set

map("n", "<leader>oo", function()
  opencode.toggle()
end, { desc = "Open" })

map({ "n", "x" }, "<leader>oa", function()
  opencode.ask("@this: ", { submit = true })
end, { desc = "Ask" })

map({ "n", "x" }, "<leader>ob", function()
  opencode.ask("@buffer: ", { submit = true })
end, { desc = "Ask buffer" })

map({ "n", "x" }, "<leader>oB", function()
  opencode.ask("@buffers: ", { submit = true })
end, { desc = "Ask buffers" })

map({ "n", "x" }, "<leader>ox", function()
  opencode.select()
end, { desc = "Execute" })

map({ "n", "x" }, "<leader>or", function()
  return opencode.operator("@this ")
end, { desc = "Add range", expr = true })

map("n", "<leader>ol", function()
  return opencode.operator("@this ") .. "_"
end, { desc = "Add line", expr = true })

map("n", "<S-C-u>", function()
  opencode.command("session.half.page.up")
end, { desc = "OpenCode: Scroll up" })

map("n", "<S-C-d>", function()
  opencode.command("session.half.page.down")
end, { desc = "OpenCode: Scroll down" })
