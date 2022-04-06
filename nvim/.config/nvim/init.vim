syntax on
set encoding=utf-8
set number relativenumber
set nocompatible
set title
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=2
set noshowcmd
set autowrite
set updatetime=100
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set wildmenu
set wildmode=longest,list,full
set splitbelow splitright
set nojoinspaces

filetype plugin on

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'chriskempson/base16-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-obsession'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

colorscheme base16-default-dark
highlight Normal ctermfg=7 ctermbg=None guifg=#d8d8d8 guibg=#181818

let mapleader = " "

let g:airline_theme='base16_default_dark'
let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$']

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Telescope keybindings
nnoremap <leader>ff :Telescope find_files hidden=true no_ignore=true<CR>
nnoremap <leader>ps :Telescope live_grep<CR>
nnoremap <leader>ls :Telescope lsp_document_symbols ignore_filename=true<CR>
nnoremap <leader>lw :Telescope lsp_dynamic_workspace_symbols ignore_filename=true<CR>
nnoremap <leader>lr :Telescope lsp_references<CR>
nnoremap <leader>li :Telescope lsp_implementations<CR>
nnoremap <leader>le :Telescope diagnostics<CR>
nnoremap gd :Telescope lsp_definitions<CR>
nnoremap <leader>lc :Telescope git_commits<CR>
nnoremap <leader>lb :Telescope git_branches<CR>

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

map <leader>n :NERDTreeFind<CR>
map <leader>g :Git<CR>

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

inoremap <C-c> <esc>

augroup FOO_BAR
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e

    " Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Reset cursor shape when leaving
    autocmd VimLeave * set guicursor=a:ver10-blinkon0

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    " Ensure files are read as what I want:
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile .zshrc.local,*.zsh, set filetype=sh
    autocmd BufRead,BufNewFile .gitconfig.local set filetype=gitconfig
    autocmd BufRead,BufNewFile .tmux.conf.local set filetype=tmux
    autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END
