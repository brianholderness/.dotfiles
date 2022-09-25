local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    print("Failed to load plugin 'indent_blankline'")
end

vim.cmd [[highlight def link IndentBlanklineContextChar comment]]

indent_blankline.setup {
    char = "▏",
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    show_current_context = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
    },
}
