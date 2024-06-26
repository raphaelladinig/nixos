<div class="align-center">
  <h1>Nixos</h1>
</div>

# INSTALLING

Clone this repo:

```
git clone https://github.com/raphaelladinig/nixos
cd nixos
```

Create a host folder for your machine

```
cp -r hosts/default hosts/<your-desired-hostname>
```

Generate your hardware.nix:

```
nixos-generate-config --show-hardware-config > hosts/<your-desired-hostname>/hardware.nix
```

Run this to enable flakes and install the flake:

```
NIX_CONFIG="experimental-features = nix-command flakes" 
sudo nixos-rebuild switch --flake .#hostname
