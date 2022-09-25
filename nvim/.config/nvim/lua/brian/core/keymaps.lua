--------------------------------------------------------------------------------
-- File Navigation
--------------------------------------------------------------------------------
-- Bigger scroll
vim.keymap.set({ 'n', 'v' }, '<C-e>', '3<C-e>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-y>', '3<C-y>', { silent = true })
-- Center line
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-b>', '<C-b>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<C-f>zz', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'G', 'Gzz', { silent = true })

--------------------------------------------------------------------------------
-- Buffer Navigation
--------------------------------------------------------------------------------
vim.keymap.set('n', 'gp', ':bp<CR>', { silent = true })
vim.keymap.set('n', 'gn', ':bn<CR>', { silent = true })

--------------------------------------------------------------------------------
-- Other
--------------------------------------------------------------------------------
vim.keymap.set('i', '<S-Tab>', '<C-d>', { silent = true, desc = 'Unindent current line' })
vim.keymap.set('n', '<leader>ft', ':set filetype=')

