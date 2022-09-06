vim.opt.number = true

vim.opt.mouse = "a"
vim.opt.mousemodel = "popup_setpos"
vim.opt.clipboard = "unnamedplus"
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
vim.keymap.set('i', '<S-Tab>', '<C-d>', { desc = 'Unindent current line' })
vim.keymap.set('n', 'gl', ':HopLine<CR>', { silent = true })
vim.keymap.set('n', 'g/', ':HopPattern<CR>', { silent = true })
vim.keymap.set('n', '<leader>ft', ':set filetype=')

vim.keymap.set({ 'n', 'v' }, '<C-e>', '3<C-e>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-y>', '3<C-y>', { silent = true })
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { silent = true })
vim.keymap.set('n', '<leader>bn', ':bn<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { silent = true })

vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'

vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25
augroup END
]]

require("user.options")
require("user.autocommands")
require("user.colorscheme")

require("user.bufferline")
require("user.telescope")
require("user.autopairs")
require("user.autocomplete")
require("user.alpha")

--------------------

require('user.plugins')
require('user.plugins.lualine')
-- require('user.plugins.hop')
require('user.plugins.nvim-treesitter')
require('user.plugins.mason')
require('user.plugins.indent-blankline')
