vim.opt.expandtab = false
vim.opt.tabstop = 4

-- test shortcuts
vim.keymap.set('n', '<leader>t', '<cmd>TestNearest<cr>', { silent = true })
vim.keymap.set('n', '<leader>T', '<cmd>TestFile<cr>', { silent = true })
vim.keymap.set('n', '<leader>a', '<cmd>TestSuite<cr>', { silent = true })
vim.keymap.set('n', 'ga', '<cmd>A<cr>', { silent = true })

function OrgImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

local augroup = vim.api.nvim_create_augroup('lsp_buf_format', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre',
  { pattern = '<buffer>', group = augroup, callback = vim.lsp.buf.formatting_sync }
)

vim.api.nvim_create_autocmd('BufWritePre',
  { pattern = '<buffer>', group = augroup, callback = function() OrgImports(1000) end}
)
