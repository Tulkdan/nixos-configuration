{pkgs, ...}: {
  home.packages = with pkgs; [
    swaybg
  ];

  programs.fuzzel.enable = true;

  services.mako = {
    enable = true;
    borderRadius = 8;
    format = "%a\n%s\n%b";
  };

  home.file.".config/niri/config.kdl".source = ./config.kdl;

  home.file.".config/systemd/user/swaybg.service".source = ./swaybg.service;
  home.file.".config/systemd/user/niri.service.wants/swaybg.service".source = ./swaybg.service;
}
