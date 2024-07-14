# Installing

Clone the flake

```sh
git clone https://github.com/raphaelladinig/nixos
cd nixos
```

Format disk

```sh
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/inspiron/disko.nix
```

Move the flake to /mnt/etc/nixos (so that symlinks work)

Change directory & Install flake

```sh
cd /mnt/etc/nixos
nixos-install --flake .#inspiron
```
