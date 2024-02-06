--- lazyvim customizations
return {

  -- add plugins
  { "nathangrigg/vim-beancount" },
  { "hrsh7th/cmp-omni" },
  { "ray-x/cmp-treesitter" },
  { "tpope/vim-sleuth" },
  { "ntpeters/vim-better-whitespace"},

  -- disable all LSP related lazyvim plugins
  { "neovim/nvim-lspconfig", enabled = false },
  { "folke/neodev.nvim", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "cmp-nvim-lsp", enabled = false },
  -- disable snippets
  { "L3MON4D3/LuaSnip", enabled = false},
  { "rafamadriz/friendly-snippets" , enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },

  -- customize neo-tree
  { "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false
        }
      }
    }
  },

  -- remove treesitter and "cmp-nvim-lsp"
  { "RRethy/vim-illuminate",
    opts = {
      providers = { "regex" },
      large_file_overrides = nil
    }
  },

  -- add more treesitter parsers
  { "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "c",
        "go",
        "beancount",
        "terraform",
        "svelte",
        "xml",
        "rust"
      },
    },
  },

  -- customize conform."nvim-neo-tree/neo-tree.nvim"
  { "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        beancount = { "bean-format"}
      }
    }
  },

}
