pedro:
  home-manager switch --flake '.#pedro'

system:
  sudo nixos-rebuild switch --flake '.#nixos'
