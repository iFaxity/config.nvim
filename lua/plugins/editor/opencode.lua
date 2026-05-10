vim.pack.add({
  { src = "https://github.com/nickjvandyke/opencode.nvim" },
})

local opencode = require("opencode")

-- Required for `opts.events.reload`
vim.o.autoread = true

--
-- Snacks integration
--

local opencode_cmd = "opencode --port"

---@type snacks.terminal.Opts
local snacks_terminal_opts = {
  interactive = true,
  win = {
    position = "float",
    enter = false,
    height = 0.9,
    width = 0.9,
    on_win = function(win)
      -- Set up keymaps and cleanup for an arbitrary terminal
      local term = require("opencode.terminal")

      term.setup(win.win)
      win:focus()
      vim.cmd("startinsert")
    end,
  },
}

---@type opencode.Opts
vim.g.opencode_opts = {
  server = {
    start = function()
      local terminal = require("snacks.terminal")

      terminal.open(opencode_cmd, snacks_terminal_opts)
    end,
    stop = function()
      local terminal = require("snacks.terminal")

      terminal.get(opencode_cmd, snacks_terminal_opts):close()
    end,
    toggle = function()
      local terminal = require("snacks.terminal")

      terminal.toggle(opencode_cmd, snacks_terminal_opts)
    end,
  },
}

--
-- Keymaps
--
local map = vim.keymap.set

map("n", "<leader>oo", function()
  opencode.toggle()
end, { desc = "Toggle" })

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
