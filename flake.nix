{
  description = "Tulk'dan's system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: let
    system = "x86_64-linux";
    hostname = "nixos";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
    
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
    	useGlobalPkgs = true;
    	useUserPackages = true;
    	users.pedro = import ./home.nix;
          };
        }
      ];
    };
  };
}
