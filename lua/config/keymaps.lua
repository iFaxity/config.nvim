vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- Not sure what these are
map("i", "jk", "<ESC>")
--keymap.set("n", "<leader>nh", ":nohl<CR>")
map("n", "<ESC><ESC>", ":nohl<CR>", {
  silent = true,
  desc = "which_key_ignore",
})

-- Aliases for save
map({ "n", "i" }, "<C-s>", "<CMD>silent write<CR>")
map({ "n", "i" }, "ZZ", "<CMD>silent wqa!<CR>")

-- Aliases for quit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>qa", ":qa<CR>")

-- Window Split Command
map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")
map("n", "<leader>se", "<C-w>=")
map("n", "<leader>sx", "<cmd>close<CR>")

-- Tab Navigation
map("n", "<leader>to", "<cmd>tabnew<CR>")
map("n", "<leader>tx", "<cmd>tabclose<CR>")
map("n", "<S-l>", "<cmd>tabn<CR>")
map("n", "<S-h>", "<cmd>tabp<CR>")

map("n", "<leader>tf", "<cmd>tabnew %<CR>")

-- Zen mode toggle
map("n", "<leader>zm", ":ZenMode<CR>")

-- Silicon command
map("v", "<leader>ss", ":Silicon<CR>")

-- Markdown preview toggle
map("n", "<leader>md", ":MarkdownPreviewToggle<CR>")

-- Resize window commands
map("n", "<C-Up>", ":resize -3<CR>")
map("n", "<C-Down>", ":resize +3<CR>")
map("n", "<C-Left>", ":vertical resize -3<CR>")
map("n", "<C-Right>", ":vertical resize +3<CR>")

-- Copilot suggestions commands
--map("i", "<C-a>", "copilot#Accept('<CR>')", { expr = true, silent = true, script = true })
--map("i", "<C-r>", "<Plug>(copilot-dismiss)", { silent = true })
--map("n", "<leader>cd", ":Copilot disable<CR>")

-- DSA commands
map("n", "<leader>cr", ":!./run.sh %<CR>")

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Navigate buffers with TAB
map("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
