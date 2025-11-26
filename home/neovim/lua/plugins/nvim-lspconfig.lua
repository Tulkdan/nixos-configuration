return {
  'neovim/nvim-lspconfig',
  cmd = {'LspInfo', 'LspInstall', 'LspStart'},
  event = {'BufReadPre', 'BufNewFile'},
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    {'williamboman/mason-lspconfig.nvim'},
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require('lspconfig').gleam.setup({})

    require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').gopls.setup()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
    })
  end
}
