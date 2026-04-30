local opt = vim.opt

-- Configure line numbers and relative spacing for navigation
opt.number = true
opt.relativenumber = true

-- Disable line wrapping and set boundary logic
opt.wrap = false
opt.linebreak = true

-- Set indentation to 2 spaces and ensure consistent spacing logic
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true

-- Configure search to be case-sensitive only when capitals are used
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"

-- Set code folding to use indentation and start expanded
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = ""

-- Custom symbols for invisible characters
opt.list = true
opt.listchars = {
  tab = "→ ",
  extends = "⟩",
  precedes = "⟨",
  lead = "·",
  trail = "·",
  nbsp = "␣",
}

-- Custom symbols for folds, diffs, etc.
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Control how windows behave when splitting or resizing
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.winminwidth = 5

-- Hide the command line and mode text
opt.laststatus = 3
opt.cmdheight = 0
opt.showmode = false
opt.ruler = false

-- Maintain visual context while scrolling or jumping through files
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.smoothscroll = true
opt.cursorline = true
opt.jumpoptions = "view"

-- Sync with system clipboard
opt.clipboard = "unnamedplus"

-- Persist undos
opt.undofile = true
opt.undolevels = 10000

-- Optimize update speeds
opt.updatetime = 200
opt.timeoutlen = 300
opt.ttimeoutlen = 10

-- Set language, completion, and text formatting preferences
opt.spelllang = { "en", "sv" }
opt.completeopt = "menu,menuone,noselect"
opt.virtualedit = "block"
opt.formatoptions = "jcroqlnt"
opt.conceallevel = 2

-- Configure external grep behavior to use Ripgrep
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- Apply general visual enhancements and transparency
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.pumblend = 10
opt.pumheight = 10
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Session options for auto_session
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
