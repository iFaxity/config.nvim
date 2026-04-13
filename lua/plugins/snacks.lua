vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
  bigfile = { enabled = true },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  words = { enabled = true },
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
    },
    keys = {
      {
        icon = " ",
        key = "f",
        desc = "Find File",
        action = ":lua Snacks.dashboard.pick('files')",
      },
      {
        icon = " ",
        key = "n",
        desc = "New File",
        action = ":ene | startinsert",
      },
      {
        icon = " ",
        key = "g",
        desc = "Find Text",
        action = ":lua Snacks.dashboard.pick('live_grep')",
      },
      {
        icon = " ",
        key = "r",
        desc = "Recent Files",
        action = ":lua Snacks.dashboard.pick('oldfiles')",
      },
      {
        icon = " ",
        key = "c",
        desc = "Config",
        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
      },
      {
        icon = " ",
        key = "s",
        desc = "Restore Session",
        section = "session",
      },
      {
        icon = " ",
        key = "q",
        desc = "Quit",
        action = ":qa",
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
})

local map = vim.keymap.set

map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "File Explorer (root dir)" })

map("n", "<leader>E", function()
  Snacks.picker.explorer({ cwd = vim.fn.getcwd() })
end, { desc = "Explorer (cwd)" })

-- General

map("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep (root dir)" })

map("n", "<leader>/:", function()
  Snacks.picker.command_history()
end, { desc = "Command history" })

map("n", "<leader><space>", function()
  Snacks.picker.files()
end, { desc = "Find Files (root dir)" })

map("n", "<leader>n", function()
  Snacks.picker.notifications()
end, { desc = "Notification history" })

-- Find

map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<leader>fB", function()
  Snacks.picker.buffers({ hidden = true, nofile = true })
end, { desc = "Buffers (all)" })

map("n", "<leader>fc", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find files (config)" })

map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find files (root dir)" })

map("n", "<leader>fF", function()
  Snacks.picker.files("files", { root = false })
end, { desc = "Find files (cwd)" })

map("n", "<leader>fg", function()
  Snacks.picker.git_files()
end, { desc = "Find files (git-files)" })

map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent" })

map("n", "<leader>fR", function()
  Snacks.picker.recent({ filter = { cwd = true } })
end, { desc = "Recent (cwd)" })

map("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Projects" })

--
-- Git
--

map("n", "<leader>gg", function()
  Snacks.lazygit({ cwd = vim.fn.getcwd() })
end, { desc = "Lazygit (Root Dir)" })

map("n", "<leader>gG", function()
  Snacks.lazygit()
end, { desc = "Lazygit (cwd)" })

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

--
-- GitHub
--

map("n", "<leader>gi", function()
  Snacks.picker.gh_issue()
end, { desc = "GitHub Issues (open)" })

map("n", "<leader>gI", function()
  Snacks.picker.gh_issue({ state = "all" })
end, { desc = "GitHub Issues (all)" })

map("n", "<leader>gp", function()
  Snacks.picker.gh_pr()
end, { desc = "GitHub Pull Requests (open)" })

map("n", "<leader>gP", function()
  Snacks.picker.gh_pr({ state = "all" })
end, { desc = "GitHub Pull Requests (all)" })

--
-- Grep
--

map("n", "<leader>sb", function()
  Snacks.picker.lines()
end, { desc = "Buffer Lines" })

map("n", "<leader>sB", function()
  Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })

map("n", "<leader>sg", function()
  Snacks.picker.grep()
end, { desc = "Grep (Root Dir)" })

map("n", "<leader>sG", function()
  Snacks.picker.grep({ root = false })
end, { desc = "Grep (cwd)" })

map("n", "<leader>sp", function()
  Snacks.picker.lazy()
end, { desc = "Search for plugin spec" })

map({ "n", "x" }, "<leader>sw", function()
  Snacks.picker.grep_word()
end, { desc = "Visual selection or word (Root Dir)" })

map({ "n", "x" }, "<leader>sW", function()
  Snacks.picker.grep_word({ root = false })
end, { desc = "Visual selection or word (cwd)" })

--
-- Search
--

map("n", '<leader>s"', function()
  Snacks.picker.registers()
end, { desc = "Registers" })

map("n", "<leader>s/", function()
  Snacks.picker.search_history()
end, { desc = "Search History" })

map("n", "<leader>sa", function()
  Snacks.picker.autocmds()
end, { desc = "Autocmds" })

map("n", "<leader>sc", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })

map("n", "<leader>sC", function()
  Snacks.picker.commands()
end, { desc = "Commands" })

map("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

map("n", "<leader>sD", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })

map("n", "<leader>sh", function()
  Snacks.picker.help()
end, { desc = "Help Pages" })

map("n", "<leader>sH", function()
  Snacks.picker.highlights()
end, { desc = "Highlights" })

map("n", "<leader>si", function()
  Snacks.picker.icons()
end, { desc = "Icons" })

map("n", "<leader>sj", function()
  Snacks.picker.jumps()
end, { desc = "Jumps" })

map("n", "<leader>sk", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })

map("n", "<leader>sl", function()
  Snacks.picker.loclist()
end, { desc = "Location List" })

map("n", "<leader>sM", function()
  Snacks.picker.man()
end, { desc = "Man Pages" })

map("n", "<leader>sm", function()
  Snacks.picker.marks()
end, { desc = "Marks" })

map("n", "<leader>sR", function()
  Snacks.picker.resume()
end, { desc = "Resume" })

map("n", "<leader>sq", function()
  Snacks.picker.qflist()
end, { desc = "Quickfix List" })

map("n", "<leader>su", function()
  Snacks.picker.undo()
end, { desc = "Undotree" })

--
-- UI
--
map("n", "<leader>uC", function()
  Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })
