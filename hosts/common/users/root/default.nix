{ config, ... }:
{
  sops.secrets.password_root = {
    neededForUsers = true;
    sopsFile = ./secrets/password_root;
  };

  users.users.root = {
    initialPassword = "root";
    hashedPasswordFile = config.sops.secrets.password_root.path;
  };
}
