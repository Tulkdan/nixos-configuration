{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox
    ./keyboard
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    anki
    ghc
    ledger
    hledger
    gh
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
