{ config, pkgs, username, stateVersion, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./git
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = stateVersion; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
      neovim
      nodejs
      ghc
      direnv
      wezterm
      vscodium
      bibata-cursors

      gnomeExtensions.paperwm
      gnome.gnome-tweaks
      just

      eww-wayland
      ripgrep
      jq
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pedro/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    VISUAL = "emacs";
    BROWSER = "firefox";
  };

  # Let Home Manager install and manage itself.
  programs = {
    alacritty.enable = true;

    firefox = {
      enable = true;

      profiles.${username} = {
        settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "findbar.highlightAll" = true;
        };

        userChrome = ''
          /*===KeyFox by AlfarexGuy2019===*/ 

          /*===COLORS===*/

          :root {
          --accent-color: 45, 45, 45;
          --tab-color: 240, 240, 244;
          --tab-text-color: 255, 255, 255;
          --secondary-accent-color: 127,127,127;
          --second-tab-text-color: 127,127,127;
          --third-accent-color: 235, 219, 178;
          --light-color: 255, 255, 255;
          --dark-color: 0, 0, 0;
          --url-back: 249, 249, 251;	
          --caption-min-color: 215, 153, 33;
          --caption-max-color: 69, 133, 136;
          --caption-close-color: 177, 98, 134;
          }


          /* MIN MAX CLOSE Remove */
          #TabsToolbar > .titlebar-buttonbox-container {
          visibility: collapse !important;}

          /*Basic Settings*/


          :root {
          --navbarWidth     : 40vw; /* Set width of navbar. Use px for a fixed width 
                                          or vw for a percentage of your window. */
          --animationSpeed  : 0.5s;
          }


          #TabsToolbar {
          margin-left : var(--navbarWidth) !important;
          }

          #nav-bar {
          margin-right: calc(100vw - var(--navbarWidth)) !important;
          }

          #urlbar-container {
          min-width   : 0px !important;
          }

          :root[uidensity="compact"] #nav-bar {
          margin-top  : -37px !important;
          height      : 37px !important;
          }

          :root:not([uidensity="compact"]):not([uidensity="touch"]) #nav-bar {
          margin-top  : -44px !important;
          height      : 44px !important;
          }

          :root[uidensity="touch"] #nav-bar {
          margin-top  : -49px !important;
          height      : 49px !important;
          }


          /* Back Hide */
          #back-button[disabled="true"] { display: none !important }

          /* Forward Hide */
          #forward-button[disabled="true"] { display: none !important }

          /* Site information button */
          #identity-box { display: none !important }

          /* "Shield" icon */
          #tracking-protection-icon-container { display: none !important }


          /* Simplifying interface */

          #nav-bar {
          background  : none !important;
          box-shadow  : none !important;
          }

          #navigator-toolbox {
          border      : none !important;
          }

          .titlebar-spacer {
          display     : none !important;
          }

          #urlbar-background {
          border      : none !important;
          }

          #urlbar:not(:hover):not([breakout][breakout-extend]) > #urlbar-background {
          box-shadow  : none !important;
          background  : none !important;
          }


          /* Element Hiding stuff */

          .urlbar-icon, #userContext-indicator, #userContext-label {
          fill        : transparent !important;
          background  : transparent !important;
          color       : transparent !important;
          }

          #urlbar:hover .urlbar-icon,
          #urlbar:active .urlbar-icon, 
          #urlbar[focused] .urlbar-icon {
          fill        : var(--toolbar-color) !important;
          }

          /*================== TABS BAR ==================*/

          #titlebar #TabsToolbar {
          background: rgba(var(--dark-color), 1) !important;
          }


          #PersonalToolbar {
          background: rgba(var(--dark-color), 1) !important;
          color: rgba(var(--light-color), 1) !important;
          padding-bottom: 6px !important;
          padding-top: 1px !important;
          }

          toolbar#nav-bar {
          background: rgba(var(--dark-color), 1) !important;
          box-shadow: none !important;
          padding-bottom: 4px !important;
          }

          /*================ DARK THEME ================*/
          :root:-moz-lwtheme-brighttext,
          .sidebar-panel[lwt-sidebar-brighttext],
          body[lwt-sidebar-brighttext] {
          --main-bgcolor: var(--dark-color);
          --transparent-bgcolor: var(--dark-color);
          }

          tab[selected="true"] .tab-content {
          color: rgba(var(--secondary-accent-color), 1) !important;
          }

          tab[selected="true"] .tab-background {
          background: rgba(var(--accent-color), 1) !important;
          }
          .tabbrowser-tab>.tab-stack>.tab-background:not([selected="true"]) {
          transition: all 0.3s ease !important;
          }

          .tabbrowser-tab:hover>.tab-stack>.tab-background:not([selected="true"]) {
          background-color: rgba(var(--transparent-bgcolor), 0.7) !important;
          }

          .tab-line {
          height: 0px !important;
          }

          .tabbrowser-tab {
          margin-right: 5px !important;
          }

          .tabbrowser-tab:not([visuallyselected="true"]),
          .tabbrowser-tab:-moz-lwtheme {
          color: rgba(var(--second-tab-text-color), 1) !important;
          }

          tab[selected="true"] .tab-content {
          color: rgba(var(--tab-text-color), 1) !important;
          }

          tab[selected="true"] .tab-background {
          background: rgba(var(--accent-color), 1) !important;
          }

          .tabbrowser-tab::after,
          .tabbrowser-tab::before {
          border-left: 0 !important;
          opacity: 0 !important;
          }

          .tab-close-button {
          transition: all 0.3s ease !important;
          border-radius: 4px !important;
          }

          .tabbrowser-tab .tab-label  { color: var(--uc-inverted-colour) !important; }
          .tab-close-button { fill: var(--uc-inverted-colour) !important }
        '';
      };
    };

    home-manager.enable = true;

    emacs.enable = true;

    gpg.enable = true;

    starship.enable = true;

    # Enabling zsh
    zsh = {
      enable = true;
      enableSyntaxHighlighting = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableZshIntegration = true;
      extraConfig = ''
        allow-emacs-pinentry
      '';
    };

    emacs = {
      enable = true;

      client.enable = true;

      defaultEditor = true;
    };
  };

  xdg.enable = true;
}
