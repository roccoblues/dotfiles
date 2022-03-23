-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", ",e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", ",q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    require "lsp_signature".on_attach(
        {
            hint_enable = false
        }
    )

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", ",wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", ",wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        ",wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", ",D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", ",rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", ",ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", ",f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local lspconfig = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {"gopls"}
for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150
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

require("telescope").setup {
    defaults = {
        layout_strategy = "vertical",
        file_ignore_patterns = {
            ".git/.*"
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
        }
    },
    extensions = {fzf = {}}
}
require("telescope").load_extension("fzf")

require "nvim-treesitter.configs".setup {
    highlight = {enable = true}
}
