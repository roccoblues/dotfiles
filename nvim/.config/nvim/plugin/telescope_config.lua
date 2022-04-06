require("telescope").setup {
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
        }
    },
    extensions = {fzf = {}}
}
require("telescope").load_extension("fzf")
