{ config, ... }:

let
  inherit (import ../../../vars) flake;
in
{
  imports = [ ../sops.nix ];

  home.file = {
    ".ssh/ssh.pub".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/raphael/ssh/ssh.pub";
  };

  sops = {
    secrets = {
      ssh-key = {
        path = "/home/raphael/.ssh/ssh";
      };
    };
  };
}
