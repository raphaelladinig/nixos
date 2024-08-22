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

- deploy ssh key for raphael (sops)
- rebuild the system again (os-prober)
- syncronise your data

```sh
git clone git@github.com:raphaelladinig/zettelkasten.git
```

```sh
gopass clone git@github.com:raphaelladinig/password-store.git
```
