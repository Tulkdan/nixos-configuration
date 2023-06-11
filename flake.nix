{
  description = "Tulk'dan's system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    system = "x86_64-linux";
    hostname = "nixos";
    stateVersion = "22.11";
    pkgs = import nixpkgs {inherit system;};
    users = {
      pedro = {
        username = "pedro";
      };
      work = {
        username = "pedro-correa";
      };
    };
  in {
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
        ];
      };
    };
    homeConfigurations = {
      work = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [{
          # Home Manager needs a bit of information about you and the paths it should
          # manage.
          home.username = users.workusername;
          home.homeDirectory = "/home/${users.work.username}";
    
          home.stateVersion = stateVersion; # Please read the comment before changing.
    
          programs = {
            home-manager.enable = true;
          };
    
          imports = [
            ./alacritty
            ./emacs
            ./neovim
            ./vscode
          ];
        }];
      };
    };
  };
}
