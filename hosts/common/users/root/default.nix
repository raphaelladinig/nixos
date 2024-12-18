{ config, inputs, ... }:
let
  secretsPath = "${builtins.toString inputs.nix-secrets}/secrets";
in
{
  imports = [
    ../../ssh
  ];

  sops.secrets.password_root = {
    neededForUsers = true;
    sopsFile = "${secretsPath}/password_root";
  };

  users.users.root = {
    initialPassword = "root";
    hashedPasswordFile = config.sops.secrets.password_root.path;

    openssh.authorizedKeys.keyFiles = [
      ../../ssh/id_raphael.pub
    ];
  };
}
