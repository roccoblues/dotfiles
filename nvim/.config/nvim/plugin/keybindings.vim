let mapleader = " "

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Telescope keybindings
nnoremap <leader>ff :Telescope find_files hidden=true no_ignore=true<CR>
nnoremap <leader>ps :Telescope live_grep<CR>
nnoremap <leader>ls :Telescope lsp_document_symbols<CR>
nnoremap <leader>lr :Telescope lsp_references<CR>
nnoremap <leader>li :Telescope lsp_implementations<CR>
nnoremap <leader>le :Telescope diagnostics<CR>

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

map <leader>n :NERDTreeToggle<CR>
map <leader>g :Git<CR>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <silent> Q <nop>

nnoremap <leader>x :silent !chmod +x %<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Quickfix list navigation
nnoremap <C-n> :cnext<CR>zz
nnoremap <C-p> :cprev<CR>zz

nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

inoremap <C-c> <esc>
