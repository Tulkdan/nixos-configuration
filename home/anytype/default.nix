{pkgs, ...}: let
  version = "0.32.3";
  anytype = pkgs.appimageTools.wrapType2 {
    name = "Anytype";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://anytype-release.fra1.cdn.digitaloceanspaces.com/Anytype-0.32.3.AppImage";
      sha256 = "sha256-usRGwQuYNETQu+a23UeW384tOFXLfsjO6Tc+57utCvk=";
    };
    extraPkgs = pkgs: with pkgs; [libsecret xdg-desktop-portal hicolor-icon-theme];
  };
in {
  home.packages = [anytype];
}
