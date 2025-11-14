{pkgs, ...}: {
  home.packages = with pkgs; [halloy];

  home.file.".config/halloy/config.toml".source = ./config.toml;
}
