--- lazyvim customizations
return {

  -- add plugins
  { "nathangrigg/vim-beancount" },
  { "hrsh7th/cmp-omni" },
  { "ray-x/cmp-treesitter" },
  { "tpope/vim-sleuth" },
  { "ntpeters/vim-better-whitespace" },
  { "folke/twilight.nvim" },
  { "mbbill/undotree" },
  { "akinsho/toggleterm.nvim", version = "*", config = true },

  -- customize neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
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
        "rust",
        "css",
        "scss",
      },
    },
  },

  -- customize conform
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        beancount = { "bean-format" },
        javascript = { "prettier" },
      },
    },
  },
}
