set noexpandtab
set tabstop=4
set shiftwidth=4

augroup lsp_buf_format
    au! BufWritePre <buffer>
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePre <buffer> lua OrgImports(1000)
augroup END

