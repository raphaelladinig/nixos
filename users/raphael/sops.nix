{ inputs, ... }:

{ 
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;

    age = {
      keyFile = /home/raphael/.config/sops/age/keys.txt;
    };
  };
}
