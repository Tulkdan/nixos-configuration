{
  programs.git = {
    enable = true;
    userName = "Pedro Correa";
    userEmail = "pedro8correa@gmail.com";
    signing = {
      key = "2748A6200C9EE0B4";
      signByDefault = true;
    };
    ignores = [ "*~" "*.swp" ];
    extraConfig = {
      commit.template = "~/.config/git/message";
    };
  };
}
