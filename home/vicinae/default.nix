{
  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
    settings = {
      close_on_focus_loss = true;
      font.normal = "Monaspace Krypton";
      theme = {
        dark.name = "vicinae-dark";
        light.name = "vicinae-dark";
      };
      launcher_window.opacity = 1;
    };
  };
}
