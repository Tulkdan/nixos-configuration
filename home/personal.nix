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
    ghc
    ledger
    hledger
    qutebrowser
  ];

  programs.git = {
    settings.user.email = "pedro8correa@gmail.com";
    signing = {
      key = "2748A6200C9EE0B4";
      signByDefault = true;
    };
  };

  programs.jujutsu.settings = {
    user = {
      name = "Pedro Correa";
      email = "pedro8correa@gmail.com";
    };

    signing = {
      behavior = "own";
      backend = "gpg";
      key = "2748A6200C9EE0B4";
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
