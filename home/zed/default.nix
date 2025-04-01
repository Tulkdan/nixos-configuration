{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "elixir"
      "make"
      "gleam"
      "0x96f"
      "just"
    ];

    ## everything inside of these brackets are Zed options.
    userSettings = {
      assistant = {
        enabled = true;
        version = "2";
        default_model = {
          provider = "ollama";
          model = "deepseek-r1:1.5b";
        };
      };

      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };

      hour_format = "hour24";
      auto_update = false;
      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [".env" "env" ".venv" "venv"];
            activate_script = "default";
          };
        };
        env = {
          TERM = "alacritty";
        };
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = "system";
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
      };

      lsp = {
        nix = {
          binary = {
            path_lookup = true;
          };
        };
      };

      vim_mode = true;
      load_direnv = "shell_hook";
      theme = {
        mode = "system";
        light = "0x96f Theme";
        dark = "0x96f Theme";
      };
      show_whitespaces = "boundary";
      soft_wrap = "editor_width";
      ui_font_size = 13;
      buffer_font_size = 13;
      relative_line_numbers = true;
    };
  };
}
