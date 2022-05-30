vim.opt.expandtab = false
vim.opt.tabstop = 4

-- test shortcuts
vim.keymap.set('n', '<leader>t', '<cmd>TestNearest<cr>', { silent = true })
vim.keymap.set('n', '<leader>T', '<cmd>TestFile<cr>', { silent = true })
vim.keymap.set('n', '<leader>a', '<cmd>TestSuite<cr>', { silent = true })
vim.keymap.set('n', 'ga', '<cmd>A<cr>', { silent = true })

local util = require('util')

local augroup = vim.api.nvim_create_augroup('lsp_buf_format', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre',
  { pattern = '<buffer>', group = augroup, callback = function() vim.lsp.buf.formatting_sync(nil, 3000) end }
)

vim.api.nvim_create_autocmd('BufWritePre',
  { pattern = '<buffer>', group = augroup, callback = function() util.org_imports(3000) end }
)
