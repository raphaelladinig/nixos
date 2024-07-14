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

Move the flake to the root partition (so that symlinks work)

Change Directory into the flake and edit vars

Install flake

```sh
nixos-install --flake .#inspiron
```
