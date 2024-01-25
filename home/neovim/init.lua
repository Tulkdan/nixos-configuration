local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim...')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
    {'folke/tokyonight.nvim'},
    {'nvim-lualine/lualine.nvim'},
    {'nvim-treesitter/nvim-treesitter.nvim'},
    {'nvim-telescope/telescope.nvim'},
    {'tpope/vim-fugitive'},
    {'editorconfig/editorconfig-vim'}
})

vim.cmd.colorscheme('tokyonight')

local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('user.settings')
load('user.keymaps')

require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lualine')
