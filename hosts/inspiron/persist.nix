{
  environment.persistence."/persist" = {
    directories = [
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/log"
      "/var/lib/mysql"
      "/var/lib/sops-nix"
    ];
  };
}
