vim.opt.number = true

vim.opt.mouse = "a"
vim.opt.mousemodel = "popup_setpos"
vim.opt.showmode = false
vim.opt.laststatus = 3
--------------------
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 24

vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.signcolumn = 'yes'

-- vim.wo.colorcolumn = '81'
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.g.mapleader = ' '

vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'

vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25
augroup END
]]

-- local ok, impatient = pcall(require, "impatient")
-- if ok then
--     impatient.enable_profile()
-- end

-- Global config namespace
-- We namespace the config so that when we reload our modules it picks up all
-- the files in that scope and clears the package cache
-- Ref: https://www.reddit.com/r/neovim/comments/puuskh/comment/he5vnqc
_G.config_namespace = "brian"

-- Allow us to use :source $MYVIMRC to reload portions of our config
_G.reload = function(module)
    package.loaded[module] = nil
    return require(module)
end


local ok, _ = reload(config_namespace .. ".core")

if not ok then
    vim.notify("Error: Could not load user core modules")
end

require("brian.options")
require("brian.autocommands")
require("brian.colorscheme")

require("brian.bufferline")
require("brian.telescope")
require("brian.autopairs")
require("brian.autocomplete")
require("brian.alpha")

--------------------

require('brian.plugins')
require('brian.plugins.lualine')
-- require('brian.plugins.hop')
require('brian.plugins.nvim-treesitter')
require('brian.plugins.mason')
require('brian.plugins.indent-blankline')
