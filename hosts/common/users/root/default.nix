{ config, inputs, ... }:
let
  secretsPath = "${builtins.toString inputs.nix-secrets}/secrets";
in
{
  sops.secrets.password_root = {
    neededForUsers = true;
    sopsFile = "${secretsPath}/password_root";
  };

  users.users.root = {
    initialPassword = "root";
    hashedPasswordFile = config.sops.secrets.password_root.path;
  };
}
