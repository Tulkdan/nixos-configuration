{
  programs.git = {
    enable = true;
    userName = "Pedro Correa";
    ignores = ["*~" "*.swp"];
    extraConfig = {
      commit.template = "~/.config/git/message";
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
      };
    };
  };

  home.file.".config/git/message".source = ./message;
}
