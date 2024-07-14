{ config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".ssh/id_ed25519.pub".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/raphael/ssh/id_ed25519";
  };

  sops = {
    secrets = {
      id_ed25519 = {
        path = "/home/raphael/.ssh/id_ed25519";
      };
    };
  };
}
