{
  programs.git = {
    enable = true;
    userName = "Pedro Correa";
    ignores = ["*~" "*.swp"];
    extraConfig = {
      commit.template = "~/.config/git/message";
      rerere = {
        enable = true;
        autoUpdate = true;
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
