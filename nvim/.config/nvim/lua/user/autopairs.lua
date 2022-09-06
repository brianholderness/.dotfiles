local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

autopairs.setup {
    check_ts = true, -- Treesitter integration
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print("Failed to load plugin 'cmp'")
    return
end
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
