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
set laststatus=0
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
Plug 'vimwiki/vimwiki'
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
call plug#end()

colorscheme base16-default-dark
highlight Normal ctermfg=7 ctermbg=None guifg=#d8d8d8 guibg=#181818

let mapleader = " "

let g:airline_theme='base16_default_dark'
let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$']

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

map <leader>n :NERDTreeFind<CR>
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

augroup FOO_BAR
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e

    " Format on save
    autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePre *.go lua OrgImports(1000)

    " Ensure files are read as what I want:
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

    " Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Reset cursor shape
    autocmd VimLeave * set guicursor=a:ver10-blinkon0
augroup END
