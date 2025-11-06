# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services = {
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };

      updateDbusEnvironment = true;
    };

    # Enable CUPS to print documents.
    printing.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    pcscd.enable = true;

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Adding support for flatpak
    flatpak.enable = true;

    # Enable VPN
    tailscale.enable = true;

    syncthing = {
      enable = true;
      dataDir = "/home/pedro";
      user = "pedro";
    };

    ollama.enable = true;
    open-webui.enable = true;
    pulseaudio.enable = false;
  };

  # Enable sound with pipewire.
  # sound.enable = true;
  security.rtkit.enable = true;

  hardware.graphics.enable = true;

  hardware.keyboard.qmk.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      enableExtraSocket = true;
    };

    zsh.enable = true;

    niri.enable = false;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pedro = {
    isNormalUser = true;
    description = "Pedro";
    extraGroups = ["networkmanager" "wheel" "tty" "docker" "dialout"];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-text-editor
      gnome-music
      gnome-shell
      geary
      epiphany
      totem
    ];

    systemPackages = with pkgs; [
      git
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      home-manager
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  # Automatic GB
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Installing fonts
  fonts.packages = with pkgs; [
    departure-mono
    material-design-icons
    fira-code
    hasklig
    monaspace
  ];

  virtualisation.docker.enable = true;

  # https://nixos.wiki/wiki/OBS_Studio
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  nixpkgs.overlays = [ (final: prev: {
    inherit (prev.lixPackageSets.stable)
      nixpkgs-review
      nix-eval-jobs
      nix-fast-build
      colmena;
  }) ];

  nix.package = pkgs.lixPackageSets.stable.lix;
}
