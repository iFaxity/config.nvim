vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/f-person/git-blame.nvim" },
  { src = "https://github.com/akinsho/git-conflict.nvim" },
})

local gitsigns = require("gitsigns")
local gitblame = require("gitblame")
local git_conflict = require("git-conflict")

-- Setup gutter indicators
gitsigns.setup()

-- Setup inline blames
gitblame.setup({
  enabled = true,
})

-- Setup prettier conflicts
git_conflict.setup({})

--
-- Keymaps
--
local map = vim.keymap.set

map("n", "]H", function()
  gitsigns.nav_hunk("last")
end, { desc = "Last hunk" })

map("n", "[H", function()
  gitsigns.nav_hunk("first")
end, { desc = "First hunk" })

map({ "o", "x" }, "ih", function()
  gitsigns.select_hunk()
end, { desc = "GitSigns select hunk" })

map("n", "<leader>gb", function()
  gitsigns.blame_line({ full = true })
end, { desc = "Blame line" })

map("n", "<leader>gB", function()
  gitsigns.blame()
end, { desc = "Blame buffer" })

--
-- Hunk
--

map({ "n", "x" }, "<leader>ghs", function()
  gitsigns.stage_hunk()
end, { desc = "Stage/Unstage hunk" })

map({ "n", "x" }, "<leader>ghr", function()
  gitsigns.reset_hunk()
end, { desc = "Reset hunk" })

map("n", "<leader>ghS", function()
  gitsigns.stage_buffer()
end, { desc = "Stage buffer" })

map("n", "<leader>ghR", function()
  gitsigns.reset_buffer()
end, { desc = "Reset buffer" })

map("n", "<leader>ghp", function()
  gitsigns.preview_hunk_inline()
end, { desc = "Preview hunk inline" })

map("n", "<leader>ghd", function()
  gitsigns.diffthis()
end, { desc = "Diff this" })

map("n", "<leader>ghD", function()
  gitsigns.diffthis("~")
end, { desc = "Diff this ~" })

--
-- Toggles
--
Snacks.toggle({
  name = "Git signs",
  get = function()
    local config = require("gitsigns.config").config

    return config.signcolumn
  end,
  set = function(state)
    gitsigns.toggle_signs(state)
  end,
}):map("<leader>uG")
