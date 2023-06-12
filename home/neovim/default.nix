{
  programs.neovim.enable = true;

  home.file = {
    ".vimrc".source = ./vimrc;

    ".config/nvim/init.vim".text = ''
      set runtimepath^=~/.vim runtimepath+=~/.vim/after
      let &packpath = &runtimepath
      source ~/.vimrc
    '';

    ".config/vim/ale.vim".source = ./config/ale.vim;
    ".config/vim/aliases.vim".source = ./config/aliases.vim;
    ".config/vim/bundles.vim".source = ./config/bundles.vim;
    ".config/vim/coc.vim".source = ./config/coc.vim;
    ".config/vim/filetypes.vim".source = ./config/filetypes.vim;
    ".config/vim/nerdtree.vim".source = ./config/nerdtree.vim;
    ".config/vim/skeletons.vim".source = ./config/skeletons.vim;
    ".config/vim/test.vim".source = ./config/test.vim;

    ".vim/colors/Blaaark.vim".source = ./colors/Blaaark.vim;
    ".vim/colors/hashpunk-lapis.vim".source = ./colors/hashpunk-lapis.vim;
    ".vim/colors/monotonic.vim".source = ./colors/monotonic.vim;
    ".vim/colors/nighted.vim".source = ./colors/nighted.vim;
    ".vim/colors/photon.vim".source = ./colors/photon.vim;
    ".vim/colors/spartan.vim".source = ./colors/spartan.vim;

    ".vim/.skeleton.html".source = ./skeletons/.skeleton.html;
    ".vim/.skeleton.py".source = ./skeletons/.skeleton.py;
    ".vim/.skeleton.tex".source = ./skeletons/.skeleton.tex;
    ".vim/.skeleton.vue.test".source = ./skeletons/.skeleton.vue.test;
  };
}
