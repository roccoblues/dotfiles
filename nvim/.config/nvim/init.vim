let mapleader =","

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
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'arcticicestudio/nord-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-obsession'
call plug#end()

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
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme nord

lua require("lsp_config")

let g:UltiSnipsSnippetDirectories=["ulti-snippets"]

"  Format on save
	autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()
	autocmd BufWritePre *.go lua OrgImports(1000)

" Enable the list of buffers
	let g:airline#extensions#tabline#enabled = 1

" Cycle through buffers
	nnoremap <Tab> :bnext<CR>
	nnoremap <S-Tab> :bprevious<CR>

" open telescope with ,ff
	nnoremap <leader>ff :Telescope find_files hidden=true no_ignore=true<CR>
	nnoremap <leader>fg :Telescope live_grep<CR>
	nnoremap <leader>ls :Telescope lsp_document_symbols<CR>
	nnoremap <leader>lr :Telescope lsp_references<CR>
	nnoremap <leader>li :Telescope lsp_implementations<CR>
	nnoremap <leader>le :Telescope diagnostics<CR>

" Use tab for snippet expansion
	let g:UltiSnipsJumpForwardTrigger="<tab>"

" Enable completion triggered by <c-x><c-o>
	autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	" Enable autocompletion:
	set wildmode=longest,list,full
	" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
	" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	if has('nvim')
		let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
	else
		let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
	endif

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Ensure files are read as what I want:
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Quickfix list navigation
	nnoremap <C-n> :cnext<CR>zz
	nnoremap <C-p> :cprev<CR>zz

" Reset cursor shape
	au VimLeave * set guicursor=a:ver10-blinkon0

" Behave vim
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

" Launch tmux-sessionizer from vim
    nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
