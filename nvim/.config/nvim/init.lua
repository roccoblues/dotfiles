-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-surround' -- Surround text objects
  use 'tpope/vim-sleuth' -- Automatically set shiftwidth and expandtab
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use 'kyazdani42/nvim-tree.lua' -- File browser
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'gruvbox-community/gruvbox' -- The only theme you'll ever need
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'christoomey/vim-tmux-navigator' -- Seamless switching between tmux and vim
  use 'buoto/gotests-vim' -- Generate tests for go functions
  use 'vim-test/vim-test' -- Run go tests
  use 'benmills/vim-golang-alternate' -- Switch between implementation and test
  use 'rhysd/git-messenger.vim' -- Show git message below the cursor
  use { 'rrethy/vim-hexokinase', run = 'make hexokinase' } -- Show colors
  use 'romainl/vim-qf' -- Quickfix window improvements
end)

require('options')
require('mappings')
require('autocmds')

--Set statusbar
require('lualine').setup {
  options = {
    globalstatus = true,
    theme = 'gruvbox',
  },
  tabline = {
    lualine_a = { 'buffers' },
  },
}

--Enable Comment.nvim
require('Comment').setup()

--Enable file browser
require 'nvim-tree'.setup()

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Hexokinase
vim.g['Hexokinase_highlighters'] = { 'virtual' }

--Don't place tags files in project folder
vim.g['gutentags_cache_dir'] = '~/.local/share/ctags'

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Telescope
require('telescope_config')

-- Treesitter
require('treesitter_config')

-- LSP
require('lsp_config')

-- vim: ts=2 sts=2 sw=2 et
