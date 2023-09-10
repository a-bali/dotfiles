-- TODO
-- Beancount completion
-- Completion

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
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
},
{
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {},
},
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
},
{
  "tpope/vim-fugitive",
  cmd = "Git"
},
{
  "lewis6991/gitsigns.nvim"
},
{
  "ibhagwan/fzf-lua"
},
{
  "nvim-treesitter/nvim-treesitter-context"
},
{
  "tpope/vim-sleuth"
},
{
  "nathangrigg/vim-beancount"
},
{
  "bronson/vim-trailing-whitespace"
},

{
  "ojroques/nvim-hardline",
},
{
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
},
{
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' }
}
}
)

vim.cmd[[colorscheme tokyonight]]

local bind = vim.keymap.set
local remap = {remap = true}

-- General config
vim.opt.number = true
vim.opt.tabstop = 2
vim.g.mapleader = ","

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
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "go", "python",
    "bash", "yaml", "beancount", "terraform", "svelte", "xml"},
  sync_install = false,
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  indent = { enable = false },
})

-- fzf-lua setup

bind("n", "<leader>bf", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
bind("n", "<leader>bu", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
bind("n", "<leader>t", [[<Cmd>lua require"fzf-lua".files({ cwd="~" } )<CR>]], {})
bind("n", "<leader>lg", [[<Cmd>lua require"fzf-lua".live_grep_glob({ cwd=vim.fn.expand('%:p:h') })<CR>]], {})
bind("n", "<leader>gr", [[<Cmd>lua require"fzf-lua".grep_project({ cwd=vim.fn.expand('%:p:h') })<CR>]], {})
bind("n", "<leader>gf", [[<Cmd>lua require"fzf-lua".git_files({ cwd=vim.fn.expand('%:p:h') })<CR>]], {})
bind("n", "<leader>gl", [[<Cmd>lua require"fzf-lua".git_commits({ cwd=vim.fn.expand('%:p:h') })<CR>]], {})

require('gitsigns').setup()
require('hardline').setup()
require('fzf-lua').setup({'fzf-native'})

require('aerial').setup()
bind("n", "<F4>", '<cmd>AerialToggle!<CR>')

require('telescope').setup()
bind("n", "<leader>fn", [[<Cmd>lua require"telescope.builtin".treesitter {}<CR>]], {})

