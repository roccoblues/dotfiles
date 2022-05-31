--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Show relative numbers
vim.opt.relativenumber = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Autoload file changes
vim.opt.autoread = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250

--Always show signcolumn
vim.wo.signcolumn = 'yes'

-- Disable bold text
vim.g['gruvbox_bold'] = 0

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox]]

-- Dim inactive window
vim.cmd [[highlight Normal guibg=None]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Always copy to system clipboard
vim.opt.clipboard:append({ 'unnamedplus' })

-- Don't show extra mode indicator line
vim.opt.showmode = false

-- Don't show partial cmd on last line
vim.opt.showcmd = false

-- Don't show extra ruler
vim.opt.ruler = false

-- Write file before :next, make etc.
vim.opt.autowrite = true

-- Set default tabstop to 4
vim.opt.tabstop = 4

-- Indent smarter
vim.opt.smartindent = true

-- Don't wrap lines
vim.opt.wrap = false

-- No backups or swap files
vim.opt.swapfile = false
vim.opt.backup = false

-- Show at least 8 lines above/below current line
vim.opt.scrolloff = 8

-- Show 80 character ruler
vim.opt.colorcolumn = { 80 }

-- Saner cmd completion
vim.opt.wildmode = { 'longest', 'list', 'full' }

-- Open new buffers in the right place
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show cursor line
vim.opt.cursorline = true

-- Write all buffers before navigating from vim to tmux
vim.g['tmux_navigator_save_on_switch'] = 2

-- Open files in current window
vim.g.netrw_browse_split = 0

-- Automatically close netrw buffer
vim.g.netrw_fastbrowse = 0

--Disable some builtins
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logipat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_matchit = 1
