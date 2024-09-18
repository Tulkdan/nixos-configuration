vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { noremap = true })

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      version = '^1.0.0',
    },
  },
  config = function()
    local telescope = require('telescope')

    telescope.load_extension('live_grep_args')
  end
}
