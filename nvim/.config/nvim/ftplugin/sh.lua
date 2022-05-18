local augroup = vim.api.nvim_create_augroup('lsp_buf_format', { clear = true })

-- vim.api.nvim_create_autocmd('BufWritePre',
--   { pattern = '<buffer>', group = augroup, callback = vim.lsp.buf.formatting_sync }
-- )
