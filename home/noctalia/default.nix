{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here
      bar = {
        barType = "floating";
        density = "compact";
        position = "top";
        showCapsule = false;
        marginVertical = 6;
        marginHorizontal = 6;
        widgets = {
          left = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          center = [
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
          right = [
            {id = "Volume";}
            {
              id = "Bluetooth";
            }
            {
              id = "Network";
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Eldritch";
      general = {
        radiusRatio = 0.2;
      };
      location = {
        name = "Sao Paulo, Brazil";
      };

      ui = {
        fontDefault = "Monaspace Krypton";
        fontFixed = "Monaspace Krypton";
      };
    };
  };
}
