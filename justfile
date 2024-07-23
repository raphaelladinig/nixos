default:
  @just --list

rebuild host:
  git add *
  nixos-rebuild switch --flake .#{{host}}

format-disk host:
  nix run github:nix-community/disko -- --mode disko ./hosts/{{host}}/disko.nix

install host: (format-disk host)
  nixos-install --no-root-passwd --flake .#{{host}}

makeIso output:
  nix run nixpkgs#nixos-generators -- --format iso --flake .#iso -o {{output}}
