{
  description = "Tulk'dan's system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    hostname = "nixos";
    stateVersion = "23.11";
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
  in {
    formatter.x86_64-linux = pkgs.alejandra;
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/desktop
        ];
      };
    };
    homeConfigurations = {
      pedro = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit stateVersion;
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
