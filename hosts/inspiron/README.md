# Installing

Format disk

```sh
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix
```

Install flake

```sh
nixos-install --flake "github:raphaelladinig/nixos#inspiron"
```
