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
    ./halloy
    ./obsidian
    ./neovim
    ./vicinae
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
    yq-go
    delta
    zellij
    just
    tealdeer
    bat

    # Tools
    pass
    gopass
    hurl
    kubectl
    zotero
    ffmpeg
    obs-studio
    mpv
    podman
    podman-compose
    bitwarden-cli
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    MANPAGER = "nvim --clean +Man!";
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
      dotDir = "${config.xdg.configHome}/zsh";
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
