{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ../../network.nix
    ../../home-manager.nix
    ../../yubikey.nix
    ../../school.nix
    ../../yubikey.nix
    ../../ssh.nix
    ../../audio.nix
    ../../sudo.nix
    ../../usb.nix
    ../../hyprland.nix
    ../../greetd.nix
    ../../bluetooth.nix
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
    ];

    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager.users.raphael = import ../../../../home/raphael/home.nix;
}
