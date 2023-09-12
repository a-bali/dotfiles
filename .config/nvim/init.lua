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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
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
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons'
},
{
  "lukas-reineke/indent-blankline.nvim"
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
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim'
  }
},
{
    'numToStr/Comment.nvim',
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
vim.opt.termguicolors = true
vim.opt.laststatus = 3

bind('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- WhichKey config
bind('n','<F1>', ':WhichKey<CR>')

-- Neo-tree config
bind('n', '<F8>', ':Neotree toggle<CR>')

require("nvim-web-devicons").setup({
  default = true
})

vim.g.extra_whitespace_ignored_filetypes = {"neo-tree"}

require("neo-tree").setup({
  window = {
    mappings = {
      ["<Tab>"] = "next_source"
    }
  },
  default_component_configs = {
   name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      folder_empty_open = "",
    },
    modified = { symbol = "" },
    git_status = {
      symbols = {
        added = "",
        modified = "",
        removed = "",
        renamed = "➜",
        untracked = "",
        ignored = "",
        unstaged = "U",
        staged = "",
        conflict = "",
        deleted = "",
      }
    }
  },
  source_selector = {
      winbar = true,
    },
  filesystem = {
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["a"] = { "add", config = { show_path = "relative" } },
      },
    },
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    follow_current_file = {
      enabled = true,
    },
    group_empty_dirs = false,
  },
  async_directory_scan = "always",
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

-- telescope setup

require('telescope').setup()
bind("n", "<c-t>",      [[<cmd>lua require"telescope.builtin".find_files()<cr>]], {})
bind("n", "<leader>bf", [[<cmd>lua require"telescope.builtin".buffers()<cr>]], {})
bind("n", "<leader>bu", [[<cmd>lua require"telescope.builtin".builtin()<cr>]], {})
bind("n", "<leader>lg", [[<Cmd>lua require"telescope.builtin".live_grep()<CR>]], {})
bind("n", "<leader>gr", [[<Cmd>lua require"telescope.builtin".grep_string()<CR>]], {})
bind("n", "<leader>gf", [[<Cmd>lua require"telescope.builtin".git_status()<CR>]], {})
bind("n", "<leader>gl", [[<Cmd>lua require"telescope.builtin".git_commits()<CR>]], {})
bind("n", "<leader>fn", [[<Cmd>lua require"telescope.builtin".treesitter {}<CR>]], {})

require('gitsigns').setup()
require('hardline').setup()
require('bufferline').setup()

require('aerial').setup()
bind("n", "<F4>", '<cmd>AerialToggle!<CR>')

require('Comment').setup()

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}


