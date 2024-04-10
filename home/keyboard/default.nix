{pkgs, ...}: {
  home.packages = with pkgs; [
    qmk
    qmk-udev-rules
    vial
    avrdude
  ];

  home.file.".config/qmk/qmk.ini".source = ./qmk.ini;
}
