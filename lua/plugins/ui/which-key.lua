vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
})

local which_key = require("which-key")
local which_key_extras = require("which-key.extras")

which_key.setup({
  preset = "helix",
  delay = 300,
  icons = {
    --rules = true,
    breadcrumb = " ",
    separator = "󱦰  ",
    --group = "󰹍 ",
    group = nil,
  },
  plugins = {
    spelling = {
      enabled = false,
    },
  },
  win = {
    height = {
      max = math.huge,
    },
  },
  spec = {
    mode = { "n", "v" },
    { "[", group = "Prev" },
    { "]", group = "Next" },
    { "g", group = "Goto" },
    { "z", group = "Fold" },
    { "<leader><TAB>", group = "Tabs" },
    { "<leader>f", group = "Find" },
    { "<leader>s", group = "Search" },
    { "<leader>G", group = "Git" },
    { "<leader>g", group = "Gitsigns" },
    { "<leader>R", group = "Replace" },
    { "<leader>c", group = "Code" },
    { "<leader>d", group = "Debug" },
    { "<leader>u", group = "UI" },
    {
      "<leader>b",
      group = "Buffer",
      expand = function()
        return which_key_extras.expand.buf()
      end,
    },
    {
      "<leader>w",
      group = "Windows",
      --proxy = "<c-w>",
      expand = function()
        return which_key_extras.expand.win()
      end,
    },
  },
})

--
-- Keymaps
--

local map = vim.keymap.set

map("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
