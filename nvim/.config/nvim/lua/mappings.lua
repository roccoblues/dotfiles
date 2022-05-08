--Remap <space> as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--Cycle through buffers
vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { silent = true })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<cr>', { silent = true })

--Perform dot commands over visual blocks
vim.keymap.set('v', '.', '<cmd>normal .<cr>')

--Open git buffer
vim.keymap.set('n', '<leader>g', '<cmd>Git<cr>', { silent = true })

--Replace all is aliased to S
vim.keymap.set('n', 'S', ':%s//g<Left><Left>')

vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFindFileToggle<cr>', { silent = true })

--Yank until end of line
vim.keymap.set('n', 'Y', 'y$', { silent = true })

--Keeping it centered
vim.keymap.set('n', 'n', 'nzzzv', { silent = true })
vim.keymap.set('n', 'N', 'nzzzv', { silent = true })

--Don't move cursor when joining lines
vim.keymap.set('n', 'J', 'mzJ`z', { silent = true })

--Silence Q
vim.keymap.set('n', 'Q', '<nop>', { silent = true })

--Save file as sudo on files that require root permission
vim.keymap.set('c', 'W', 'execute ":silent w !sudo tee % > /dev/null" | :edit!')

--Undo break points
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '!', '!<c-g>u')
vim.keymap.set('i', '?', '?<c-g>u')

--Move text
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { silent = true })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Quickfix window
vim.keymap.set('n', '<leader>cc', '<plug>(qf_qf_toggle)')
vim.keymap.set('n', '<C-p>', '<Plug>(qf_qf_previous)zz', { silent = true })
vim.keymap.set('n', '<C-n>', '<Plug>(qf_qf_next)zz', { silent = true })
