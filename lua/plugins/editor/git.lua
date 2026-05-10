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
    local map = vim.keymap.set

    map("n", "]H", function()
      gitsigns.nav_hunk("last")
    end, { desc = "Last hunk", buf = bufnr })

    map("n", "[H", function()
      gitsigns.nav_hunk("first")
    end, { desc = "First hunk", buf = bufnr })

    map({ "o", "x" }, "ih", function()
      gitsigns.select_hunk()
    end, { desc = "GitSigns select hunk", buf = bufnr })

    map("n", "<leader>gb", function()
      gitsigns.blame_line({ full = true })
    end, { desc = "Blame line", buf = bufnr })

    map("n", "<leader>gB", function()
      gitsigns.blame()
    end, { desc = "Blame buffer", buf = bufnr })

    map({ "n", "x" }, "<leader>ghs", function()
      gitsigns.stage_hunk()
    end, { desc = "Stage/Unstage hunk", buf = bufnr })

    map({ "n", "x" }, "<leader>ghr", function()
      gitsigns.reset_hunk()
    end, { desc = "Reset hunk", buf = bufnr })

    map("n", "<leader>ghS", function()
      gitsigns.stage_buffer()
    end, { desc = "Stage buffer", buf = bufnr })

    map("n", "<leader>ghR", function()
      gitsigns.reset_buffer()
    end, { desc = "Reset buffer", buf = bufnr })

    map("n", "<leader>ghp", function()
      gitsigns.preview_hunk_inline()
    end, { desc = "Preview hunk inline", buf = bufnr })

    map("n", "<leader>ghd", function()
      gitsigns.diffthis()
    end, { desc = "Diff this", buf = bufnr })

    map("n", "<leader>ghD", function()
      gitsigns.diffthis("~")
    end, { desc = "Diff this ~", buf = bufnr })
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
