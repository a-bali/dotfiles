-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<F8>", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
map("n", "<F4>", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" })
map("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })
map("n", "<leader>uu", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
