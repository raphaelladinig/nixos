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
    ../../printing.nix
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

  environment.persistence."/persist" = {
    users.raphael = {
      directories = [
        "Desktop"
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Public"
        "Templates"
        "Videos"
        "Notes"
        "Development"
        "Android"
        ".android"
        ".java"
        ".jdks"
        ".gradle"
        ".ssh"
        ".platformio"
        ".dotnet"
        ".nuget"
        ".config/Google"
        ".config/BraveSoftware"
        ".config/github-copilot"
        ".local/share/gopass"
        ".local/share/zoxide"
        ".local/share/DaVinciResolve"
        ".local/share/Google"
        ".local/state/lazygit"
        ".local/share/direnv"
        ".local/state/wireplumber"
      ];
      files = [
        ".zsh_history"
      ];
    };
  };
}
