default:
  @just --list

rebuild host:
  git add *
  sudo nixos-rebuild switch --flake .#{{host}}

format-disk host:
  sudo nix run github:nix-community/disko -- --mode disko ./hosts/{{host}}/disko.nix

install host: (format-disk host)
  sudo nixos-install --no-root-passwd --flake .#{{host}}
