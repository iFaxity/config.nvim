vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- Standard Quality of Life
map("i", "jk", "<Esc>", {
  desc = "Exit insert mode",
})
map("n", "<Esc><Esc>", "<cmd>nohlsearch<cr>", {
  desc = "Clear search highlights",
  silent = true,
})

-- Better indenting (Keeps selection)
map("x", "<", "<gv", {
  desc = "Indent left",
})
map("x", ">", ">gv", {
  desc = "Indent right",
})

-- Files
map("n", "<leader>fn", "<cmd>enew<cr>", {
  desc = "New File",
})

-- Save & Quit
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>write<cr><esc>", {
  desc = "Save file",
})
map("n", "<leader>wq", "<cmd>exit<cr>", {
  desc = "Save and quit current window",
})
map("n", "<leader>q", "<cmd>quit<cr>", {
  desc = "Quit current window",
})
map("n", "<leader>qa", "<cmd>exitall<cr>", {
  desc = "Save and quit all",
})

-- Window Management
map("n", "<leader>-", "<cmd>split<cr>", {
  desc = "Split window below",
})
map("n", "<leader>|", "<cmd>vsplit<cr>", {
  desc = "Split window right",
})
map("n", "<leader>wd", "<cmd>close<cr>", {
  desc = "Delete window",
})

-- Move to window using <ctrl> hjkl
map("n", "<C-h>", "<C-w>h", {
  desc = "Go to left window",
})
map("n", "<C-j>", "<C-w>j", {
  desc = "Go to lower window",
})
map("n", "<C-k>", "<C-w>k", {
  desc = "Go to upper window",
})
map("n", "<C-l>", "<C-w>l", {
  desc = "Go to right window",
})

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", {
  desc = "Increase window height",
})
map("n", "<C-Down>", "<cmd>resize -2<cr>", {
  desc = "Decrease window height",
})
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", {
  desc = "Decrease window width",
})
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", {
  desc = "Increase window width",
})

-- Tab management
map("n", "<leader><Tab><Tab>", "<cmd>tabnew<cr>", {
  desc = "New tab",
})
map("n", "<leader><Tab>d", "<cmd>tabclose<cr>", {
  desc = "Close tab",
})
map("n", "<leader><Tab>]", "<cmd>tabnext<cr>", {
  desc = "Next tab",
})
map("n", "<leader><Tab>[", "<cmd>tabprevious<cr>", {
  desc = "Previous tab",
})
map("n", "<leader><Tab>l", "<cmd>tablast<cr>", {
  desc = "Last Tab",
})
map("n", "<leader><Tab>f", "<cmd>tabfirst<cr>", {
  desc = "First Tab",
})
map("n", "<leader><Tab>o", "<cmd>tabonly<cr>", {
  desc = "Close other tabs",
})

-- Buffer navigation
map("n", "<S-Tab>", "<cmd>bprevious<cr>", {
  desc = "Prev Buffer",
})
map("n", "<Tab>", "<cmd>bnext<cr>", {
  desc = "Next Buffer",
})

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", {
  desc = "Down",
  expr = true,
  silent = true,
})
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", {
  desc = "Down",
  expr = true,
  silent = true,
})
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", {
  desc = "Up",
  expr = true,
  silent = true,
})
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", {
  desc = "Up",
  expr = true,
  silent = true,
})

-- Move Lines
map("n", "<A-j>", "<cmd>silent! move .+\\v:count1<cr>==", {
  desc = "Move down",
  silent = true,
})
map("n", "<A-k>", "<cmd>silent! move .-\\v:count1+1<cr>==", {
  desc = "Move up",
  silent = true,
})
map("i", "<A-j>", "<esc><cmd>silent! move .+1<cr>==gi", {
  desc = "Move down",
  silent = true,
})
map("i", "<A-k>", "<esc><cmd>silent! move .-2<cr>==gi", {
  desc = "Move up",
  silent = true,
})
map("v", "<A-j>", ":<C-u>silent! execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", {
  desc = "Move down",
  silent = true,
})
map("v", "<A-k>", ":<C-u>silent! execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", {
  desc = "Move up",
  silent = true,
})
