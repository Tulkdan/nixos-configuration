{
  programs.neovim.enable = true;

  home.file = {
    ".vimrc".source = ./vimrc;

    ".config/nvim/init.lua".source = ./init.lua;

    ".config/nvim/lua/user/keymaps.lua".source = ./lua/user/keymaps.lua;
    ".config/nvim/lua/user/settings.lua".source = ./lua/user/settings.lua;

    ".config/nvim/lua/plugins/telescope.lua".source = ./lua/plugins/telescope.lua;
    ".config/nvim/lua/plugins/treesitter.lua".source = ./lua/plugins/treesitter.lua;

    ".config/vim/coc.vim".source = ./config/coc.vim;

    ".vim/.skeleton.html".source = ./skeletons/.skeleton.html;
    ".vim/.skeleton.py".source = ./skeletons/.skeleton.py;
    ".vim/.skeleton.tex".source = ./skeletons/.skeleton.tex;
    ".vim/.skeleton.vue.test".source = ./skeletons/.skeleton.vue.test;
  };
}
