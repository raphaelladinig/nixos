<div align="center">
  <h1>Nixos</h1>
</div>

# Installing

Clone this repo:

```sh
git clone https://github.com/raphaelladinig/nixos
cd nixos
```

Create a host folder for your machine

```sh
cp -r hosts/default hosts/<your-desired-hostname>
```

Generate your hardware.nix:

```sh
nixos-generate-config --show-hardware-config > hosts/<your-desired-hostname>/hardware.nix
```

Run this to enable flakes and install the flake:

```sh
NIX_CONFIG="experimental-features = nix-command flakes" 
sudo nixos-rebuild switch --flake .#hostname
