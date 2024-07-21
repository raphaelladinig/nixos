default:
  @just --list

rebuild host:
  git add *
  nixos-rebuild switch --flake .#{{host}}

format-disk host:
  nix run github:nix-community/disko -- --mode disko ./hosts/{{host}}/disko.nix

install host:
  nixos-install --flake .#{{host}}
