{
  description = "Tulk'dan's system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
    micasa.url = "github:cpcloud/micasa";
    noctalia.url = "github:noctalia-dev/noctalia/legacy-v4";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    niri,
    micasa,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    hostname = "nixos";
    stateVersion = "25.11";
    pkgs = import nixpkgs {
      inherit system;
    };
    users = {
      pedro = {
        username = "pedro";
      };
    };
  in {
    formatter.x86_64-linux = pkgs.alejandra;
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          niri.nixosModules.niri
          ({pkgs, ...}: {
            nixpkgs.overlays = [
              (final: prev: {
                libdisplay-info_0_2 = prev.libdisplay-info_0_3;
              })
            ];
            programs.niri.package = pkgs.niri;
            # programs.niri.package = pkgs.niri-stable;
            # programs.niri.package = pkgs.niri-unstable.override {libdisplay-info_0_2 = pkgs.libdisplay_0_3;};
            environment.variables.NIXOS_OZONE_WL = "1";
            environment.systemPackages = with pkgs; [
              wl-clipboard
              wayland-utils
              libsecret
              cage
            ];
          })

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              extraSpecialArgs = inputs;
            };
          }
          ./hosts/desktop
        ];
      };
    };
    homeConfigurations = {
      pedro = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit stateVersion;
          inherit inputs;
          username = users.pedro.username;
        };
        modules = [
          ./home
          ./home/personal.nix
        ];
      };
    };
  };
}
