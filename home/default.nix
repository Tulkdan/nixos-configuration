{
  config,
  pkgs,
  username,
  stateVersion,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = stateVersion;

  imports = [
    ./alacritty
    ./emacs
    ./git
    ./gtk
    ./neovim
    ./vscode
    ./zed
  ];

  home.packages = with pkgs; [
    # Languages
    nodejs
    go
    sqlc

    # Utilities
    ripgrep
    jq
    delta
    zellij
    just

    # Tools
    pass
    gopass
    tomb
    hurl
    kubectl
    foliate
    zotero
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
  };

  programs = {
    home-manager.enable = true;

    gpg.enable = true;

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    # Enabling zsh
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      dotDir = ".config/zsh";
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "pass" "kubectl"];
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  xdg.enable = true;
}
