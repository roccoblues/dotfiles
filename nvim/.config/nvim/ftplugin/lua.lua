vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

local augroup = vim.api.nvim_create_augroup('lua_format', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  group = augroup,
  callback = vim.lsp.buf.formatting_sync
})
