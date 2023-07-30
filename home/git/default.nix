{
  programs.git = {
    enable = true;
    userName = "Pedro Correa";
    ignores = ["*~" "*.swp"];
    extraConfig = {
      commit.template = "~/.config/git/message";
    };
  };

  home.file.".config/git/message".source = ./message;
}
