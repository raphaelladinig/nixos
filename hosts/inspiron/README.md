# Installing

Clone the flake

```sh
git clone https://github.com/raphaelladinig/nix-config
cd nix-config
```

Format disk

```sh
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/inspiron/disko.nix
```

Move the flake to the new root partition (so that symlinks work)

Change directory & Install flake

```sh
cd <path-to-flake>
nixos-install --flake .#inspiron
```
