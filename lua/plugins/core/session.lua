vim.pack.add({
  { src = "https://github.com/rmagatti/auto-session" },
})

local auto_session = require("auto-session")

auto_session.setup({
  auto_restore = false,
  lsp_stop_on_restore = true,
  git_use_branch_name = false,
  --allowed_dirs = { "~/projects/**", "~/.config/*" },
  suppressed_dirs = { "~/", "~/projects", "~/downloads", "/" },
  bypass_save_filetypes = { "dashboard", "snacks_dashboard" },
  session_lens = {
    picker = "snacks",
    load_on_setup = false,
    picker_opts = {
      preset = "dropdown",
      preview = false,
      layout = {
        width = 0.4,
        height = 0.4,
      },
    },
  },
})

--
-- Keymaps
--
local map = vim.keymap.set

map("n", "<leader>fs", function()
  auto_session.search()
end, { desc = "Sessions" })
