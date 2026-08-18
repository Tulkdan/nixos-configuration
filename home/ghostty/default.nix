{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    systemd.enable = true;
    settings = {
      # Font
      font-size = 11;
      font-family = "Monaspace Krypton";

      # Misc
      desktop-notifications = true;
      clipboard-trim-trailing-spaces = true;

      # Cursor configuration
      cursor-style = "underline";
      shell-integration-features = "no-cursor";

      # Window and style
      window-decoration = "none";
      window-padding-balance = true;
      window-padding-x = 10;
      window-padding-y = 10;
      theme = "Lovelace";
    };
  };
}
