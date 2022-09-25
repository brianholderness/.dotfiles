local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    print("Failed to load plugin 'alpha'")
    return
end

require("alpha.term")
local dashboard = require("alpha.themes.dashboard")

-- dashboard.section.terminal.command = "cat | lolcat --seed=160 -t --freq=0.025 " .. os.getenv("XDG_CONFIG_HOME") .. "/nvim/assets/alpha-splash.txt"
dashboard.section.terminal.command = "cat " .. os.getenv("HOME") .. "/.config/nvim/assets/alpha-splash-static.txt"
dashboard.section.terminal.width = 86
dashboard.section.terminal.height = 21

dashboard.section.buttons.val = {
    dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
    dashboard.button("r", "  > Recent" , ":Telescope oldfiles<CR>"),
    dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h<CR>"),
    dashboard.button("p", "  > Sync plugins", ":PackerSync<CR>"),
    dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}
-- dashboard.section.buttons.opts.spacing = 0

dashboard.config.layout = {
    { type = "padding", val = 1 },
    dashboard.section.terminal,
    { type = "padding", val = 27 },
    dashboard.section.buttons,
}

alpha.setup(dashboard.opts)

vim.cmd [[
    autocmd FileType alpha setlocal nofoldenable
]]
