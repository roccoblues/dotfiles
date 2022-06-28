require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "%.git/"
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden"
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      theme = "ivy",
      layout_config = {
        height = 0.2,
      },
    },
    buffers = {
      theme = "ivy",
      layout_config = {
        height = 0.2,
      },
    }
  },
})

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Telescope shortcuts
vim.keymap.set('n', '<leader>;', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>f', function()
  require('telescope.builtin').find_files { hidden = true, no_ignore = true }
end)
vim.keymap.set('n', '<leader>bf', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>ht', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>lt', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>/', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>bt', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>ls', function()
  require('telescope.builtin').lsp_document_symbols { ignore_filename = true }
end)
vim.keymap.set('n', '<leader>lw', function()
  require('telescope.builtin').lsp_dynamic_workspace_symbols { ignore_filename = true }
end)
-- vim.keymap.set('n', '<leader>lr', require('telescope.builtin').lsp_references)
-- vim.keymap.set('n', '<leader>li', require('telescope.builtin').lsp_implementations)
-- vim.keymap.set('n', '<leader>le', require('telescope.builtin').diagnostics)
-- vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions)
vim.keymap.set('n', '<leader>lc', require('telescope.builtin').git_commits)
