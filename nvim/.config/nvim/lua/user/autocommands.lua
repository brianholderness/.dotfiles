-- Use 'q' to quit from common plugins
local qToQuitGroup = vim.api.nvim_create_augroup("QToQuit", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = qToQuitGroup,
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
    callback = function()
        vim.keymap.set("n", "q", ":close<CR>", {
            buffer = true,
            silent = true,
        })
        vim.bo.buflisted = false
    end
})

local autoResizeWindowGroup = vim.api.nvim_create_augroup("AutoResizeWindow", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
    group = autoResizeWindowGroup,
    pattern = "*",
    command = "wincmd =",
    desc = "Automatically resize windows when the host window size changes",
})
