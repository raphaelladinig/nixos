{ pkgs, inputs, ... }:

let
  inherit (import ../../options.nix) username;
in
{

  home.packages = with pkgs; [ sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = /home/${username}/.config/sops/age/keys.txt;
    };

    secrets = {
      ssh-key = {
        path = "/home/${username}/.ssh/id_ed25519";
      };
    };
  };
}
