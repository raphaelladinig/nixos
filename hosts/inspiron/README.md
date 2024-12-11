# Description

- Dell Inspiron 15 5515
- LUKS + Impermanence

# Installing

1. Clone:

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

3. Install:

- get ssh key for nix-secrets

```sh
just install inspiron
```

4. Boot:

- get age keys for sops
- rebuild again (os-prober)

```sh
git clone git@github.com:raphaelladinig/zettelkasten.git
```

```sh
gopass clone git@github.com:raphaelladinig/password-store.git
```

- move data over
