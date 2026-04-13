vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- Aliases for save
map({"n", "i"}, "<C-s>", '<cmd>silent write<cr>')

-- Aliases for quit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>qa", ":qa<CR>")

-- Tab Navigation
map("n", "<leader>to", "<cmd>tabnew<CR>")
map("n", "<leader>tx", "<cmd>tabclose<CR>")
map("n", "<S-l>", "<cmd>tabn<CR>")
map("n", "<S-h>", "<cmd>tabp<CR>")

-- Navigate buffers with TAB
map("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
