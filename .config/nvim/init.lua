-- Install Lazy plugin manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install/load plugins

require("lazy").setup({
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {}
},
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
},
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
},
{
  "tpope/vim-fugitive",
  lazy = true,
  cmd = "Git"
},
{
  "lewis6991/gitsigns.nvim"
},
{
  "ojroques/nvim-hardline",
  lazy = false
}
}
)

vim.cmd[[colorscheme tokyonight]]

local bind = vim.keymap.set
local remap = {remap = true}

-- General config
vim.opt.tabstop = 2

-- WhichKey config
bind('n','<F1>', ':WhichKey<CR>')

-- Nvim-tree config
bind('n', '<F8>', ':NvimTreeToggle<CR>')
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = false,
    highlight_git = true,
    highlight_opened_files = "all",
    icons = {
      git_placement = "after",
      show = {
        git = true,
        file = false,
        folder = false,
        folder_arrow = true,
      },
      glyphs = {
        bookmark = "🔖",
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        },
      git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "★",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = true,
    git_ignored = false
  }
})

-- Nvim-treesitter setup
require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "go", "python"},
  sync_install = false,
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  indent = { enable = true },  
})

require('gitsigns').setup()
require('hardline').setup()
