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
  ];

  programs.git = {
    userEmail = "pedro.correa@zigpay.com.br";
    signing = {
      key = "B67C86C563761C3A";
      signByDefault = true;
    };
  };
}
