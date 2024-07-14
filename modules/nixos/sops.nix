{ pkgs, inputs, ... }:

let
  inherit (import ../../options.nix) username;
in
{
  imports = [
    inputs.sops.nixosModules.sops
  ];
  
  environment.systemPackages = with pkgs; [ sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    age.keyfile = /home/${username}/.config/sops/age/keys.txt;

    secrets = {
      example-key = { };
    };
  };
}
