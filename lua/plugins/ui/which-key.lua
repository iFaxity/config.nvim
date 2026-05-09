vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
})

local which_key = require("which-key")
local which_key_extras = require("which-key.extras")

which_key.setup({
  preset = "helix",
  delay = 200,
  icons = {
    --rules = true,
    --breadcrumb = " ",
    --separator = "󱦰 ",
    --group = "󰹍 ",
    breadcrumb = "",
    separator = "",
    group = "",
  },
  plugins = {
    spelling = {
      enabled = false,
    },
  },
  spec = {
    mode = { "n", "v" },
    {
      "[",
      group = "Prev",
      icon = { icon = "󰙣 ", color = "red" },
    },
    {
      "]",
      group = "Next",
      icon = { icon = "󰙡 ", color = "green" },
    },
    {
      "g",
      group = "Goto",
      icon = { icon = "󰈿 ", color = "cyan" },
    },
    {
      "z",
      group = "Fold",
      icon = { icon = "󰘖 ", color = "yellow" },
    },
    {
      "<leader>?",
      icon = { icon = "󰌌 ", color = "azure" },
    },
    {
      "<leader>/",
      icon = { icon = "󰭎 ", color = "azure" },
    },
    {
      "<leader>:",
      icon = { icon = "󰋚 ", color = "orange" },
    },
    {
      "<leader>.",
      icon = { icon = " ", color = "green" },
    },
    {
      "<leader>e",
      icon = { icon = "󰝰 ", color = "purple" },
    },
    {
      "<leader><TAB>",
      group = "Tabs",
      icon = { icon = "󰓩 ", color = "purple" },
    },
    {
      "<leader>f",
      group = "Files",
      icon = { icon = "󰉓 ", color = "cyan" },
    },
    {
      "<leader>s",
      group = "Search",
      icon = { icon = "󰍉 ", color = "green" },
    },
    {
      "<leader>g",
      group = "Git",
      icon = { icon = "󰊢 ", color = "orange" },
    },
    {
      "<leader>q",
      group = "Quit",
      icon = { icon = "󰍃 ", color = "red" },
    },
    {
      "<leader>gh",
      group = "Hunks",
      icon = { icon = "󰊢 ", color = "orange" },
    },
    {
      "<leader>c",
      group = "Code",
      icon = { icon = "󰅩 ", color = "azure" },
    },
    {
      "<leader>t",
      group = "Terminal",
      icon = { icon = "󰞷 ", color = "grey" },
    },
    {
      "<leader>d",
      group = "Debug",
      icon = { icon = "󰃤 ", color = "red" },
    },
    {
      "<leader>u",
      group = "UI",
      icon = { icon = "󰙵 ", color = "cyan" },
    },
    {
      "<leader>o",
      group = "OpenCode",
      icon = { icon = "󰚩 ", color = "cyan" },
    },
    {
      "<leader>b",
      group = "Buffer",
      icon = { icon = "󰈙 ", color = "blue" },
      expand = function()
        return which_key_extras.expand.buf()
      end,
    },
    {
      "<leader>w",
      group = "Window",
      icon = { icon = "󰖲 ", color = "green" },
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
  which_key.show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
