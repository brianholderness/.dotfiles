vim.g.nord_uniform_diff_background = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme nord")
if not status_ok then
    print("Failed to change colorscheme to 'nord'")
    return
end
