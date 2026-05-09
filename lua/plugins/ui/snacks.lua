vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
})

local snacks = require("snacks")

snacks.setup({
  bigfile = {
    enabled = true,
  },
  explorer = {
    enabled = true,
  },
  indent = {
    enabled = true,
  },
  input = {
    enabled = true,
  },
  quickfile = {
    enabled = true,
  },
  scope = {
    enabled = true,
  },
  words = {
    enabled = true,
  },
  lazygit = {
    enabled = true,
    win = {
      width = 0.9,
      height = 0.9,
    },
  },
  zen = {
    enabled = true,
    toggles = {
      dim = true,
      git_signs = false,
      mini_diff_signs = false,
      conceallevel = false,
    },
    show = {
      statusline = false, -- can only be shown when using the global statusline
      tabline = false,
    },
    win = {
      width = 0,
      backdrop = { transparent = true, blend = 25 },
    },
  },
  terminal = {
    enabled = true,
    win = {
      height = 0.25,
    },
  },
  notifier = {
    enabled = true,
    timeout = 5000,
  },
  dim = {
    enabled = true,
    scope = {
      min_size = 10,
      max_size = 50,
      siblings = true,
    },
  },
  scroll = {
    enabled = true,
    animate = {
      duration = { step = 10, total = 200 },
      easing = "linear",
    },
    -- faster animation when repeating scroll after delay
    animate_repeat = {
      delay = 100, -- delay in ms before using the repeat animation
      duration = { step = 5, total = 50 },
      easing = "linear",
    },
  },
  picker = {
    reverse = false,
    sources = {
      files = {
        hidden = true,
      },
      explorer = {
        hidden = true,
        git_status = true,
        auto_close = true,
        layout = {
          preset = "sidebar",
          hidden = { "input" },
          auto_hide = { "input" },
          layout = {
            position = "right",
            width = 50,
          },
        },
      },
    },
  },
  dashboard = {
    enabled = true,
    width = 60,
    row = nil, -- dashboard position. nil for center
    col = nil, -- dashboard position. nil for center
    pane_gap = 4, -- empty columns between vertical panes
    preset = {
      header = [[
 ________   _______   ________  ___      ___ ___  _____ ______
|\   ___  \|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \
\ \  \\ \  \ \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \
 \ \  \\ \  \ \  \_|/_\ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \
  \ \  \\ \  \ \  \_|\ \ \  \\\  \ \    / /   \ \  \ \  \    \ \  \
   \ \__\\ \__\ \_______\ \_______\ \__/ /     \ \__\ \__\    \ \__\
    \|__| \|__|\|_______|\|_______|\|__|/       \|__|\|__|     \|__|
]],
      keys = {
        {
          icon = " ",
          key = "f",
          desc = "Find file",
          action = ":lua Snacks.dashboard.pick('files')",
        },
        {
          icon = " ",
          key = "n",
          desc = "New file",
          action = ":ene | startinsert",
        },
        {
          icon = "󰭎 ",
          key = "g",
          desc = "Find text",
          action = ":lua Snacks.dashboard.pick('live_grep')",
        },
        {
          icon = " ",
          key = "r",
          desc = "Recent files",
          action = ":lua Snacks.dashboard.pick('oldfiles')",
        },
        {
          icon = " ",
          key = "c",
          desc = "Config",
          action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
        },
        {
          icon = " ",
          key = "p",
          desc = "Projects",
          action = ":lua Snacks.dashboard.pick('projects')",
        },
        {
          icon = "󰖲 ",
          key = "s",
          desc = "Sessions",
          action = ":AutoSession search",
        },
        {
          icon = " ",
          key = "S",
          desc = "Restore session",
          action = ":AutoSession restore",
        },
        {
          icon = " ",
          key = "q",
          desc = "Quit",
          action = ":qa",
        },
      },
    },
    sections = {
      {
        section = "header",
      },
      {
        icon = " ",
        title = "Keymaps",
        section = "keys",
        indent = 2,
        --gap = 0,
        padding = 1,
      },
      {
        icon = " ",
        title = "Recent Files",
        section = "recent_files",
        indent = 2,
        padding = 1,
      },
      {
        icon = " ",
        title = "Projects",
        section = "projects",
        indent = 2,
        padding = 1,
      },
    },
  },
})

--
-- Keymaps
--
local map = vim.keymap.set

--
-- General
--
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Explorer" })

map("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

map("n", "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Command history" })

map("n", "<leader><space>", function()
  Snacks.picker.files()
end, { desc = "Find" })

map({ "n", "t" }, "<C-/>", function()
  Snacks.terminal()
end, { desc = "Terminal" })

--
-- Terminal
--
map("n", "<leader>tf", function()
  Snacks.terminal()
end, { desc = "Terminal" })

map({ "n", "t" }, "<leader>tb", "<cmd>terminal<cr>", { desc = "Terminal (buffer)" })

--
-- Buffer
--
map("n", "<leader>bf", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<leader>bF", function()
  Snacks.picker.buffers({ hidden = true, nofile = true })
end, { desc = "Buffers (all)" })

map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete buffer" })

map("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete other buffers" })

map("n", "<leader>bA", function()
  Snacks.bufdelete.all()
end, { desc = "Delete all buffers" })

--
-- Files
--
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find" })

map("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

map("n", "<leader>fc", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find (config)" })

map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent" })

map("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Projects" })

map("n", "<leader>fd", function()
  local file_name = vim.api.nvim_buf_get_name(0)

  if file_name == "" then
    Snacks.notify.error("No file to delete")
    return
  end

  local confirm = vim.fn.confirm("Delete " .. vim.fn.fnamemodify(file_name, ":t") .. "?", "&Yes\n&No", 2, "Question")

  if confirm ~= 1 then
    return
  end

  local success, err = os.remove(file_name)
  if success then
    -- We still use Snacks for the clean buffer close and notification
    Snacks.bufdelete.delete()
    Snacks.notify.info("File deleted")
  else
    Snacks.notify.error("Error: " .. err)
  end
end, { desc = "Delete current file" })

--
-- Git
--
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

map("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, { desc = "Git diff (hunks)" })

map("n", "<leader>gD", function()
  Snacks.picker.git_diff({ base = "origin", group = true })
end, { desc = "Git diff (origin)" })

map("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git status" })

map("n", "<leader>gS", function()
  Snacks.picker.git_stash()
end, { desc = "Git stash" })

map("n", "<leader>gf", function()
  Snacks.picker.git_files()
end, { desc = "Git files" })

--
-- Search
--
map("n", "<leader>ss", function()
  Snacks.picker({
    layout = {
      hidden = { "preview" },
    },
  })
end, { desc = "Snacks" })

map({ "n", "x" }, "<leader>sw", function()
  Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

map("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

map("n", "<leader>sD", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Diagnostics (buffer)" })

map("n", "<leader>sh", function()
  Snacks.picker.help()
end, { desc = "Help pages" })

map("n", "<leader>sm", function()
  Snacks.picker.man()
end, { desc = "Man pages" })

map("n", "<leader>sR", function()
  Snacks.picker.resume()
end, { desc = "Resume" })

map("n", "<leader>sq", function()
  Snacks.picker.qflist()
end, { desc = "Quickfix List" })

map("n", "<leader>su", function()
  Snacks.picker.undo()
end, { desc = "Undotree" })

map("n", "<leader>sn", function()
  Snacks.picker.notifications()
end, { desc = "Notification history" })

--
-- TODO
--
map("n", "<leader>st", function()
  Snacks.picker.todo_comments()
end, { desc = "Todo" })

map("n", "<leader>sT", function()
  Snacks.picker.todo_comments({
    keywords = { "TODO", "FIX", "FIXME" },
  })
end, { desc = "Todo/Fix/Fixme" })

--
-- Toggles
--
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.scroll():map("<leader>uS")
Snacks.toggle.zen():map("<leader>uz")
Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle
  .option("conceallevel", {
    off = 0,
    on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
    name = "Conceal Level",
  })
  :map("<leader>uc")
Snacks.toggle
  .option("showtabline", {
    off = 0,
    on = vim.o.showtabline > 0 and vim.o.showtabline or 2,
    name = "Tabline",
  })
  :map("<leader>uA")
