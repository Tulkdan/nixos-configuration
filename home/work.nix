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
}
