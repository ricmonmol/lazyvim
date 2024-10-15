-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "U", "<C-R>", { desc = "Redo last change" })
vim.keymap.set("n", "<C-p>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-n>", "<Cmd>bNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-x>", "<Cmd>bdelete<CR>")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
