# Installing

Clone the flake

```sh
git clone https://github.com/raphaelladinig/nixos
```
```sh
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
```
```sh
nixos-install --flake .#inspiron
```

Change password of users & deploy your secrets
