# Installing

```sh
nix --experimental-features "nix-command flakes" run "github:nix-community/disko#disko-install" -- --flake "github:raphaelladinig/nixos#<host>" --disk <disk-name> <disk-device>
```
