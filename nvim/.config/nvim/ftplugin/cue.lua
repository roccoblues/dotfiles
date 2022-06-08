vim.opt.tabstop = 4

local augroup = vim.api.nvim_create_augroup('cue_format', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '<buffer>',
  group = augroup,
  command = "CueFmt",
})
