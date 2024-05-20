-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<F8>", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
map("n", "<F4>", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" })
map("n", "<F5>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
map("n", "<leader>td", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
map("n", "<leader>t2h", "<cmd>2ToggleTerm<CR>", { desc = "Toggle Terminal" })
map("n", "<leader>t2v", "<cmd>2ToggleTerm direction=vertical<CR>", { desc = "Toggle Terminal" })
map("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })
map("n", "<leader>uu", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
map("n", "<F9>", ":make<CR>", { desc = "Run :make" })

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
