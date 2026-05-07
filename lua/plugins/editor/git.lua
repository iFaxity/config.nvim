vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/f-person/git-blame.nvim" },
  { src = "https://github.com/akinsho/git-conflict.nvim" },
})

local gitsigns = require("gitsigns")
local gitblame = require("gitblame")
local git_conflict = require("git-conflict")

-- Setup gutter indicators with buffer-local keymaps
gitsigns.setup({
  on_attach = function(bufnr)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("n", "]H", function() gitsigns.nav_hunk("last") end, "Last hunk")
    map("n", "[H", function() gitsigns.nav_hunk("first") end, "First hunk")
    map({ "o", "x" }, "ih", function() gitsigns.select_hunk() end, "GitSigns select hunk")
    map("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, "Blame line")
    map("n", "<leader>gB", function() gitsigns.blame() end, "Blame buffer")
    map({ "n", "x" }, "<leader>ghs", function() gitsigns.stage_hunk() end, "Stage/Unstage hunk")
    map({ "n", "x" }, "<leader>ghr", function() gitsigns.reset_hunk() end, "Reset hunk")
    map("n", "<leader>ghS", function() gitsigns.stage_buffer() end, "Stage buffer")
    map("n", "<leader>ghR", function() gitsigns.reset_buffer() end, "Reset buffer")
    map("n", "<leader>ghp", function() gitsigns.preview_hunk_inline() end, "Preview hunk inline")
    map("n", "<leader>ghd", function() gitsigns.diffthis() end, "Diff this")
    map("n", "<leader>ghD", function() gitsigns.diffthis("~") end, "Diff this ~")
  end,
})

-- Setup inline blames
gitblame.setup({
  enabled = true,
})

-- Setup prettier conflicts
git_conflict.setup({})

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
