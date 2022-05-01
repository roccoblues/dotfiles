require('lualine').setup({
  options = {
    globalstatus = true,
    theme = 'gruvbox',
  },
  tabline = {
    lualine_a = {'buffers'},
  },
})
