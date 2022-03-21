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
Plug 'arcticicestudio/nord-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
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

colorscheme nord

let g:UltiSnipsSnippetDirectories=["ulti-snippets"]

"  Trouble
	nnoremap <leader>xx <cmd>TroubleToggle<cr>
	nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
	nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
	nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
	nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
	nnoremap gR <cmd>TroubleToggle lsp_references<cr>

"  Format on save
	autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()

" Enable the list of buffers
	let g:airline#extensions#tabline#enabled = 1

" Cycle through buffers
	nnoremap <Tab> :bnext<CR>
	nnoremap <S-Tab> :bprevious<CR>

" open telescope with ,ff
	nnoremap <leader>ff :Telescope find_files hidden=true no_ignore=true<CR>
	nnoremap <leader>fg :Telescope live_grep<CR>
	nnoremap <leader>ls :Telescope lsp_document_symbols<CR>

" Use tab for snippet expansion
	let g:UltiSnipsJumpForwardTrigger="<tab>"

" Autocompletion
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

lua <<EOF
	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap=true, silent=true }
	vim.api.nvim_set_keymap('n', ',e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	vim.api.nvim_set_keymap('n', ',q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ',D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ',ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ',f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	end

	local lspconfig = require('lspconfig')

	-- Use a loop to conveniently call 'setup' on multiple servers and
	-- map buffer local keybindings when the language server attaches
	local servers = { 'gopls' }
	for _, lsp in pairs(servers) do
		lspconfig[lsp].setup {
			on_attach = on_attach,
			flags = {
				-- This will be the default in neovim 0.7+
				debounce_text_changes = 150,
				}
			}
	end

	function OrgImports(wait_ms)
		local params = vim.lsp.util.make_range_params()
		params.context = {only = {"source.organizeImports"}}
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit)
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end


	require('telescope').setup {
		defaults = {
			file_ignore_patterns = {
				".git/.*"
			},
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				'--hidden'
			},

		},
		extensions = { fzf = {} }
	}
	require('telescope').load_extension('fzf')
	require("trouble").setup{}
EOF

autocmd BufWritePre *.go lua OrgImports(1000)
