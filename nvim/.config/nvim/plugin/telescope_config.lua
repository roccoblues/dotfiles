require("telescope").setup {
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            -- width = 0.8,
            -- height = 0.8,
            preview_width = 0.6,
            -- prompt_position = "bottom",
        },
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
        }
    },
    extensions = { fzf = {} }
}
require("telescope").load_extension("fzf")
