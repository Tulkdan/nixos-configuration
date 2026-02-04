pedro:
  home-manager switch --flake 'flake.nix#pedro'

system:
  sudo nixos-rebuild switch --flake 'flake.nix#nixos'
