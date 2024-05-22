{
  config,
  pkgs,
  username,
  stateVersion,
  ...
}: {
  home.packages = with pkgs; [
    pass
    wl-clipboard
    nodePackages.mermaid-cli
  ];

  programs.git = {
    signing = {
      key = "B67C86C563761C3A";
      signByDefault = true;
    };
  };
}
