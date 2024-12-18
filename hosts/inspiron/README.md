# Description

- Dell Inspiron 15 5515
- LUKS2 + Impermanence

# Prerequisites

- ssh key for nix-secrets
- /tmp/disk.key for luks2 encryption password

# Installing

1. Clone nix-config:
```sh
git clone https://github.com/raphaelladinig/nix-config
```

```sh
cd nix-config
```

2. Enter the nix-shell:

```sh
nix-shell
```

3. Install:

```sh
just install inspiron
```

4. Post-Install:

- place age keys for sops in correct locations
- rebuild again (os-prober & sops)
- configure disk for yubikey fido2 decryption
- move data over
