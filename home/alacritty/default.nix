{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        dimensions = {
          columns = 90;
          lines = 20;
        };

        padding = {
          x = 15;
          y = 15;
        };

        dynamic_padding = false;

        decorations = "full";
      };

      font = {
        normal = {
          family = "Monaspace Krypton";
        };

        size = 11.0;
      };

      cursor.style = "Underline";

      colors = {
        primary = {
          background = "0x1D1F28";
          foreground = "0xFDFDFD";
        };
        normal = {
          black = "0x282A36";
          red = "0xF37F97";
          green = "0x5ADECD";
          yellow = "0xF2A272";
          blue = "0x8897F4";
          magenta = "0xC574DD";
          cyan = "0x79E6F3";
          white = "0xFDFDFD";
        };
        bright = {
          black = "0x414458";
          red = "0xFF4971";
          green = "0x18E3C8";
          yellow = "0xEBCB8B";
          blue = "0xFF8037";
          magenta = "0x556FFF";
          cyan = "0x3FDCEE";
          white = "0xBEBEC1";
        };
        indexed_colors = [];
      };
    };
  };
}
