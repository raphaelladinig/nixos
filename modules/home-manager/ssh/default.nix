{ config, ... }:

let
  inherit (import ../../../vars) username flake;
in
{
  imports = [ ../sops.nix ];

  home.file = {
    ".ssh/ssh.pub".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/ssh/ssh.pub";
  };

  sops = {
    secrets = {
      ssh-key = {
        path = "/home/${username}/.ssh/ssh";
      };
    };
  };
}
