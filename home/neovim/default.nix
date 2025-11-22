{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

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
    '';
  };

  home.file = {
    ".config/nvim/lua/" = {
      source = ./lua;
      recursive = true;
    };

    ".vim/.skeleton.html".source = ./skeletons/.skeleton.html;
    ".vim/.skeleton.py".source = ./skeletons/.skeleton.py;
    ".vim/.skeleton.tex".source = ./skeletons/.skeleton.tex;
    ".vim/.skeleton.vue.test".source = ./skeletons/.skeleton.vue.test;
  };
}
