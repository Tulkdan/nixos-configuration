{
  programs.git = {
    enable = true;
    userName = "Pedro Correa";
    ignores = ["*~" "*.swp"];
    extraConfig = {
      commit = {
        template = "~/.config/git/message";
        verbose = true;
      };
      rerere = {
        enable = true;
        autoUpdate = true;
      };
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      init.defaultBranch = "main";
      merge.conflictstyle = "zdiff3";
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      push = {
        autoSetupRemote = true;
        followTags = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
      };
    };
  };

  home.file.".config/git/message".source = ./message;
}
