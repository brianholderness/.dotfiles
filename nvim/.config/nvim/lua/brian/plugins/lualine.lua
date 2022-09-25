local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Failed to load plugin 'lualine'")
    return
end

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'nord',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = ' ', right = ' ' },
        disabled_filetypes = {
            'packer',
            -- 'NvimTree',
            -- 'neo-tree',
        }

    }
}

