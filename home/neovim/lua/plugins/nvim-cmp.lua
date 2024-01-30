return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {'L3MON4D3/LuaSnip'},
  },
  config = function()
    -- Here is where you configure the autocompletion settings
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()

    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = function(fallback)
              if cmp.visible() then
                cmp.confirm()
              else
                fallback()
              end
            end,
            ['<Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end
        })
    })
  end
}
