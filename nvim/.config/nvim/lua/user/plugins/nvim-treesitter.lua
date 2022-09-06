require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'vim', 'lua', 'help',
        'bash',
        'html', 'css', 'scss', 'javascript', 'typescript', 'json', 'vue', 'svelte',
        'go',
        'rust', 'toml',
        'python', 'yaml',
        'sql',
        'markdown'
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
	additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
}

