{

description = "Tulk'dan's system config";

inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
};

outputs = {self, nixpkgs}: let
  system = "x86_64-linux";
  hostname = "nixos";
  pkgs = import nixpkgs {inherit system;};
in {

  nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
    inherit system;

    modules = [ ./system/configuration.nix ];
  };

};

}
