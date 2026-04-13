local opt = vim.opt

-- Hide nvim standard statusbar
opt.cmdheight = 0

-- Show relative line numbers in gutter
opt.relativenumber = true
opt.number = true

--
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Wrap text
opt.wrap = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

opt.autowrite = false -- Disable auto write

-- Show invisible characters
opt.list = true
opt.listchars = {
  tab = "→ ",
  extends = "⟩",
  precedes = "⟨",
  lead = "·",
  trail = "·",
  nbsp = "␣",
  --  eol = "↲",
}
--vim.opt.listchars = "tab:»-,trail:·,lead:·,nbsp:·"
