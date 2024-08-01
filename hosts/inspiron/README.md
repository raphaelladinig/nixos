# Description

- Dell Inspiron 15 5515
- LUKS + Impermanence

# Installing


1. Clone the flake:

```sh
git clone https://github.com/raphaelladinig/nixos
```
```sh
cd nixos
```

2. Enter the nix-shell:

```sh
nix-shell
```

3. Install the flake:

```sh
just install inspiron
```

4. Boot in to the new system:
  - pull over your data.
  - rebuild the system again (os-prober)
