-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.filetype.add({
  extension = {
    journal = "beancount",
  },
})

local lspconfig = require("lspconfig")
lspconfig.beancount.setup({
  init_options = {
    journal_file = "/home/bali/beancount/beancount.journal",
  },
 })

local cmp = require("cmp")
cmp.setup.filetype("beancount", {
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "omni" },
  }, {
    -- { name = "treesitter" },
  }),
})

