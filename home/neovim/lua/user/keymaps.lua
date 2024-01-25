vim.keymap.set('n', '<F5>', '<cmd>Lexplore<cr>')

-- Jump between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Tabs
vim.keymap.set('n', '<C-t>k', '<cmd>tabr<cr>')
vim.keymap.set('n', '<C-t>t', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<C-t>h', '<cmd>tabp<cr>')
vim.keymap.set('n', '<C-t>l', '<cmd>tabn<cr>')

-- Resize control
vim.keymap.set('n', '<left>', '<cmd>vertical resize -5<cr>')
vim.keymap.set('n', '<up>', '<cmd>resize -5<cr>')
vim.keymap.set('n', '<down>', '<cmd>resize +5<cr>')
vim.keymap.set('n', '<right>', '<cmd>vertical resize +5<cr>')
