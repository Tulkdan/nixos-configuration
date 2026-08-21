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
    ./ghostty
    ./emacs
    ./git
    ./gtk
    ./halloy
    ./helix
    ./neovim
    ./vscode
    ./zed
    ./noctalia
  ];

  home.packages = with pkgs; [
    # Languages
    nodejs
    go
    sqlc
    gofumpt

    # Utilities
    ripgrep
    jq
    yq-go
    delta
    zmx
    just
    tealdeer
    bat
    fzf
    btop
    gopls

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
    openlogi
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
      extraPackages = [ pkgs.jj-starship ];
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
