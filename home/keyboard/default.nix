{pkgs, ...}: {
  home.packages = with pkgs; [
    qmk
    qmk-udev-rules
    vial
  ];

  home.file.".config/qmk/qmk.ini".source = ./qmk.ini;
}
