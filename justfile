pedro:
  home-manager switch --flake 'flake.nix#pedro'

work:
  home-manager switch --flake 'flake.nix#work'

system:
  sudo nixos-rebuild switch --flake 'flake.nix#nixos'
