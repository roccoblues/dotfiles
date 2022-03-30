augroup FOO_BAR
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e

    " Format on save
    autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePre *.go lua OrgImports(1000)

    " Enable completion triggered by <c-x><c-o>
    autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

    " Ensure files are read as what I want:
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

    " Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Reset cursor shape
    autocmd VimLeave * set guicursor=a:ver10-blinkon0
augroup END
