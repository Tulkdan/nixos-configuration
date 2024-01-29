{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      LazyVim
    ];

    extraLuaConfig = ''
      local lazy = {}

      function lazy.setup(plugins)
        if vim.g.plugins_ready then
          return
        end

        vim.opt.rtp:prepend(lazy.path)

        require('lazy').setup(plugins, lazy.opts)
        vim.g.plugins_ready = true
      end

      lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
      lazy.opts = {}

      local load = function(mod)
        package.loaded[mod] = nil
        require(mod)
      end

      load('user.settings')
      load('user.keymaps')

      lazy.setup("plugins")

      vim.cmd.colorscheme('icy')
    '';
  };

  home.file = {
    ".config/nvim/lua/user/keymaps.lua".source = ./lua/user/keymaps.lua;
    ".config/nvim/lua/user/settings.lua".source = ./lua/user/settings.lua;

    ".config/nvim/lua/plugins/editorconfig.lua".source = ./lua/plugins/editorconfig.lua;
    ".config/nvim/lua/plugins/lualine.lua".source = ./lua/plugins/lualine.lua;
    ".config/nvim/lua/plugins/telescope.lua".source = ./lua/plugins/telescope.lua;
    ".config/nvim/lua/plugins/tokyonight.lua".source = ./lua/plugins/tokyonight.lua;
    ".config/nvim/lua/plugins/icy.lua".source = ./lua/plugins/icy.lua;
    ".config/nvim/lua/plugins/treesitter.lua".source = ./lua/plugins/treesitter.lua;
    ".config/nvim/lua/plugins/vim-fugitive.lua".source = ./lua/plugins/vim-fugitive.lua;

    ".vim/.skeleton.html".source = ./skeletons/.skeleton.html;
    ".vim/.skeleton.py".source = ./skeletons/.skeleton.py;
    ".vim/.skeleton.tex".source = ./skeletons/.skeleton.tex;
    ".vim/.skeleton.vue.test".source = ./skeletons/.skeleton.vue.test;
  };
}
