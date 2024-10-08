{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox
    ./keyboard
    ./niri
    ./waybar
    ./ags
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    ghc
    jetbrains.idea-community
    gnucash
    ledger
    hledger
  ];

  programs.git = {
    userEmail = "pedro8correa@gmail.com";
    signing = {
      key = "2748A6200C9EE0B4";
      signByDefault = true;
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableZshIntegration = true;
      extraConfig = ''
        allow-emacs-pinentry
      '';
    };
  };
}
