local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    print("Failed to load plugin 'bufferline'")
    return
end

vim.keymap.set("n", "gb", ":BufferLinePick<CR>", { silent = true })

bufferline.setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                highlight = "Directory",
                text_align = "left",
            },
        },
    },
}
