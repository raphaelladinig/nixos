# Installing

Clone the config

```sh
git clone https://github.com/raphaelladinig/nixos
cd nixos
```

Format disk

```sh
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/inspiron/disko.nix
```

Install flake

```sh
nixos-install --flake .#inspiron
```
