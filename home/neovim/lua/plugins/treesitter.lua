return {
  'nvim-treesitter/nvim-treesitter.nvim',
  build = ":TSUpdate",
  url = 'git@github.com:nvim-treesitter/nvim-treesitter.git',
  config = function ()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
        highlight = {
          enable = true
        },
        ensure_installed = {
          'javascript',
          'typescript',
          'tsx',
          'json'
        },
        sync_install = false
    })
  end
}
