{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ../../network.nix
    ../../virtualisation.nix
    ../../home-manager.nix
  ];

  sops.secrets.password_raphael = {
    neededForUsers = true;
    sopsFile = ./secrets/password_raphael;
  };

  users.users.raphael = {
    isNormalUser = true;
    initialPassword = "raphael";
    hashedPasswordFile = config.sops.secrets.password_raphael.path;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "input"
      "networkmanager"
      "libvirtd"
    ];

    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager.users.raphael = import ../../../../home/raphael/home.nix;
}
