" augroup lsp_buf_format
"     au! BufWritePre <buffer>
"     autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
" augroup END
