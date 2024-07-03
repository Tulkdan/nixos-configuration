let
  icons = rec {
    calendar = "󰃭 ";
    clock = " ";
    battery.charging = "󱐋";
    battery.horizontal = [" " " " " " " " " "];
    battery.vertical = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    battery.levels = battery.vertical;
    network.disconnected = "󰤮 ";
    network.ethernet = "󰈀 ";
    network.strength = ["󰤟 " "󰤢 " "󰤥 " "󰤨 "];
    bluetooth.on = "󰂯";
    bluetooth.off = "󰂲";
    bluetooth.battery = "󰥉";
    volume.source = "󱄠";
    volume.muted = "󰝟";
    volume.levels = ["󰕿" "󰖀" "󰕾"];
    idle.on = "󰈈 ";
    idle.off = "󰈉 ";
  };
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  programs.waybar.settings.mainBar = {
    layer = "bottom";
    modules-left = ["wireplumber" "wireplumber#source"];
    modules-center = ["clock#date" "clock"];
    modules-right = ["network"];

    clock = {
      interval = 1;
      format = "${icons.clock} {:%H:%M}";
    };

    "clock#date" = {
      format = "${icons.calendar} {:%Y-%m-%d}";
    };

    network = {
      tooltip-format = "{ifname}";
      format-disconnected = icons.network.disconnected;
      format-ethernet = icons.network.ethernet;
      format-wifi = "{icon} {essid}";
      format-icons = icons.network.strength;
    };

    bluetooth = {
      format = "{icon}";
      format-disabled = "";
      format-icons = {
        inherit (icons.bluetooth) on off;
        connected = icons.bluetooth.on;
      };
      format-connected = "{icon} {device_alias}";
    };
    "bluetooth#battery" = {
      format = "";
      format-connected-battery = "${icons.bluetooth.battery} {device_battery_percentage}%";
    };

    wireplumber = {
      format = "{icon} {volume}%";
      format-muted = "${icons.volume.muted} {volume}%";
      format-icons = icons.volume.levels;
      reverse-scrolling = 1;
      tooltip = false;
    };

    "wireplumber#source" = {
      format = "${icons.volume.source} {node_name}";
      tooltip = false;
    };

    # "group/volume" = {
    #   orientation = "horizontal";
    #   modules = [
    #     "wireplumber"
    #     "wireplumber#source"
    #   ];
    #   drawer = {
    #     transition-left-to-right = true;
    #   };
    # };

    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = icons.idle.on;
        deactivated = icons.idle.off;
      };
    };
  };
}
