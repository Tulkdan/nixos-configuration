return {
  'nvim-lualine/lualine.nvim',
  config = function ()
    local configs = require('lualine')

    configs.setup({
        options = {
          icons_enabled = false
        }
    })
  end
}

