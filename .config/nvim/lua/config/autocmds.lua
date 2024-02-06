-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.filetype.add({
  extension = {
    journal = 'beancount',
  }
})

local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "treesitter" },
    { name = "buffer" },
    { name = "path" },
    { name = "omni" }
  },
})

cmp.setup.filetype('beancount', {
  sources = cmp.config.sources({
    { name = 'omni' },
    }, {
    { name = 'buffer' },
  })
 })
