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
    ./niri
    ./waybar
  ];

  home.packages = with pkgs; [
    nodejs
    ripgrep
    jq
    sioyek
    delta
    zellij
    lazydocker
    gccgo
    hurl
    zed-editor
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
  };

  programs = {
    home-manager.enable = true;

    gpg.enable = true;

    starship.enable = true;

    # Enabling zsh
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      dotDir = ".config/zsh";
      oh-my-zsh = {
        enable = true;
        plugins = ["git"];
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  xdg.enable = true;
}
