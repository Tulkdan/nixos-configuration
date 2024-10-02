{
  config,
  pkgs,
  username,
  stateVersion,
  ...
}: {
  home.packages = with pkgs; [
    wl-clipboard
    nodePackages.mermaid-cli
    davmail
    d2
  ];

  programs.git = {
    signing = {
      key = "B67C86C563761C3A";
      signByDefault = true;
    };
  };
}
