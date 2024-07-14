{ config, ... }:

{
  sops = {
    age = {
      keyFile = /home/raphael/.config/sops/age/keys.txt;
    };

    secrets = {
      root-password = {
        sopsFile = ./secrets.yaml;
        neededForUsers = true;
      };
    };
  };

  users.mutableUsers = false;

  users.users.root = {
    hashedPasswordFile = config.sops.secrets.root-password.path;
  };
}
