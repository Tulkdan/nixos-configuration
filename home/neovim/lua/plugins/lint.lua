return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile'
  },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      typescript = {'eslint'},
      javascript = {'eslint'}
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end
}
