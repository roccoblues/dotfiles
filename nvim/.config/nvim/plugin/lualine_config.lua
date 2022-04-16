require('lualine').setup({
  options = {
    globalstatus = true,
  },
  tabline = {
    lualine_a = {'buffers'},
  },
})
