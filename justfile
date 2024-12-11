default:
  @just --list

rebuild mode='switch' host='${HOSTNAME}':
  git add *
  sudo nixos-rebuild {{mode}} --flake .#{{host}}

rebuild-boot host='${HOSTNAME}': (rebuild 'boot' host)

format-disk host='${HOSTNAME}':
  sudo nix run --experimental-features "nix-command flakes" github:nix-community/disko -- --mode disko ./hosts/{{host}}/disko.nix

install host='${HOSTNAME}': (format-disk host)
  sudo nixos-install --no-root-passwd --flake .#{{host}}

update: 
  nix flake update

clean:
  sudo nix-collect-garbage -d
