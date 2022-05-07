local augroup = vim.api.nvim_create_augroup('defaults', { clear = true })

--Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" },
  { pattern = '*', group = augroup, command = ':%s/\\s\\+$//e' }
)

--Disable automatic commenting on newline
vim.api.nvim_create_autocmd({ "FileType" },
  { pattern = '*', group = augroup, command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' }
)

--Reset cursor shape when leaving
vim.api.nvim_create_autocmd({ "VimLeave" },
  { pattern = '*', group = augroup, command = 'set guicursor=a:ver10-blinkon0' }
)

--When editing a file, always jump to the last known cursor position.
--Don't do it for commit messages, when the position is invalid, or when
--inside an event handler (happens when dropping a file on gvim).
vim.api.nvim_create_autocmd({ "BufReadPost" },
  { pattern = '*', group = augroup, command = [[
     if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
       exe "normal g`\"" |
     endif
  ]] }
)

--Ensure files are read as what I want
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = '*.tex', group = augroup, command = 'set filetype=tex' }
)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = '*.md', group = augroup, command = 'set filetype=markdown' }
)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = '.zshrc.local,.zshrc', group = augroup, command = 'set filetype=zsh' }
)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = '.gitconfig.local', group = augroup, command = 'set filetype=gitconfig' }
)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = '.tmux.conf.local', group = augroup, command = 'set filetype=tmux' }
)
