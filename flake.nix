{
  description = "Tulk'dan's system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    ags.url = "github:Aylur/ags";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    niri,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    hostname = "nixos";
    stateVersion = "25.05";
    pkgs = import nixpkgs {
      inherit system;
    };
    users = {
      pedro = {
        username = "pedro";
      };
      work = {
        username = "pedro-correa";
      };
    };
    shared-modules = [
      niri.nixosModules.niri
      ({pkgs, ...}: {
        nixpkgs.overlays = [niri.overlays.niri];
        programs.niri.package = pkgs.niri-unstable;
        # programs.niri.package = pkgs.niri-stable;
        # programs.niri.package = pkgs.niri-unstable.override {src = niri-working-tree;};
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
    ];
  in {
    formatter.x86_64-linux = pkgs.alejandra;
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;

        modules =
          shared-modules
          ++ [
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
    homeConfigurations = {
      work = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit stateVersion;
          username = users.work.username;
        };
        modules = [
          ./home
          ./home/work.nix
        ];
      };
    };
  };
}
