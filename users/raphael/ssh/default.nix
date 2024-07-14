{ config, ... }:

let
  inherit (import ../../../vars) flake;
in
{
  imports = [ ../sops.nix ];

  home.file = {
    ".ssh/id_ed25519.pub".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/raphael/ssh/id_ed25519";
  };

  sops = {
    secrets = {
      ssh-key = {
        path = "/home/raphael/.ssh/id_ed25519";
      };
    };
  };
}
