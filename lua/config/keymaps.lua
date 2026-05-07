vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- Standard Quality of Life
map("i", "jk", "<Esc>", {
  desc = "Exit insert mode",
})
map("n", "<Esc>", "<cmd>nohlsearch<cr>", {
  desc = "Clear search highlights",
  silent = true,
})
map("t", "<Esc>", "<C-\\><C-n>", {
  desc = "Exit terminal mode",
})

-- Show float diagnostics for line
map("n", "<leader>cd", function()
  vim.diagnostic.open_float()
end, { desc = "Line diagnostics" })

-- Jump and stay in the middle of the page
map("n", "<C-d>", "<C-d>zz", {
  desc = "Keep cursor in middle in half page jumps",
  nowait = true,
})
map("n", "<C-u>", "<C-u>zz", {
  desc = "Keep cursor in middle in half page jumps",
  nowait = true,
})
-- map("n", "<S-Down>", "<S-Down>zz<cr>", {
--   desc = "Keep cursor in middle in page jumps",
--   nowait = true,
-- })
-- map("n", "<S-Up>", "<S-Up>zz<cr>", {
--   desc = "Keep cursor in middle in page jumps",
--   nowait = true,
-- })
--
-- Not sure about these....
map("n", "n", "nzzzv", {
  desc = "",
  silent = true,
})
map("n", "N", "Nzzzv", {
  desc = "",
  silent = true,
})

-- Greatest remap
map("x", "<leader>p", '"_dP', {
  desc = "Paste and keep clipboard",
  silent = true,
})

-- Better indenting (Keeps selection)
map("x", "<", "<gv", {
  desc = "Indent left",
  silent = true,
})
map("x", ">", ">gv", {
  desc = "Indent right",
  silent = true,
})

-- Files
map("n", "<leader>fn", "<cmd>enew<cr>", {
  desc = "New File",
})

-- Save & Quit
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>write<cr><esc>", {
  desc = "Save file",
})
map("n", "<leader>qq", "<cmd>quitall!<cr>", {
  desc = "Quit all",
})
map("n", "<leader>qa", "<cmd>xall!<cr>", {
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
map("n", "<leader>wq", "<cmd>exit<cr>", {
  desc = "Save and quit current window",
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

-- Move to window from terminal using <ctrl> hjkl
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], {
  desc = "Go to left window",
})
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], {
  desc = "Go to lower window",
})
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], {
  desc = "Go to upper window",
})
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], {
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

-- Buffer management
map("n", "<Tab>", "<cmd>bnext<cr>", {
  desc = "Next buffer",
})
map("n", "<S-Tab>", "<cmd>bprevious<cr>", {
  desc = "Prev buffer",
})
map("n", "<leader>bD", "<cmd>bdelete<cr>", {
  desc = "Delete Buffer and Window",
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
