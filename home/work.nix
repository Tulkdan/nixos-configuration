{
  config,
  pkgs,
  username,
  stateVersion,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home.packages = with pkgs; [
    wl-clipboard
    nodePackages.mermaid-cli
    code-cursor
    d2
    jetbrains.datagrip
  ];

  programs.git = {
    signing = {
      key = "B67C86C563761C3A";
      signByDefault = true;
    };
  };

  programs.jujutsu.settings = {
    signing = {
      behavior = "own";
      backend = "gpg";
      key = "B67C86C563761C3A";
    };
  };
}
