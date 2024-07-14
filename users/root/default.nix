{
  inputs,
  config,
  ...
}:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;

    age = {
      keyFile = /home/raphael/.config/sops/age/keys.txt;
    };

    secrets = {
      password = {
        neededForUsers = true;
      };
    };
  };

  users.mutableUsers = false;

  users.users.root = {
    hashedPasswordFile = config.sops.secrets.password.path;
  };
}
