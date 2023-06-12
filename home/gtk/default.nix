{pkgs, ...}: {
  home.packages = with pkgs; [
    bibata-cursors

    gnomeExtensions.appindicator
    gnomeExtensions.paperwm
    gnomeExtensions.dash-to-dock

    adw-gtk3
  ];

  dconf = {
    enable = true;

    settings = {
      "org/gnome/shell" = {
        enable-extensions = [
          "paperwm@hedning:matrix.org"
          "appindicatorsupport@rgcjonas.gmail.com"
          "dash-to-dock@micxgx.gmail.com"
        ];
      };

      "org/gnome/desktop/interface" = {
        gtk-theme = "adw-gtk3";
        font-name = "Fira Code 11";
        cursor-theme = "Bibata-Modern-Classic";
      };
    };
  };
}
