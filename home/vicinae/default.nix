{
  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    settings = {
      font.normal = "Monaspace Krypton";
      theme.name = "catppuccin-mocha.json";
    };
  };
}
