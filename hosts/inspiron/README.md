# Installing

enter nix-shell

```sh
nix-shell
```

Clone the flake

```sh
git clone https://github.com/raphaelladinig/nixos
```
```sh
cd nixos
```

Format disk

```sh
just format-disk inspiron
```

Move the flake to /mnt/etc/nixos (so that symlinks work)

Change directory & Install flake

```sh
just install inspiron
```

Change the passwords of the users & deploy secrets
