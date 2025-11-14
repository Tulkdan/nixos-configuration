{
  programs.git = {
    enable = true;
    ignores = ["*~" "*.swp"];
    settings = {
      user.name = "Pedro Correa";
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
      alias = {
        tree = "log --graph --oneline";
      };
    };
  };

  programs.jujutsu = {
    enable = true;
    settings.ui = {
      default-command = "log";
      pager = "delta";
      diff-formatter = ":git";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
    };
  };

  home.file.".config/git/message".source = ./message;
}
