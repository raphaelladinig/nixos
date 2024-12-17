{
  pkgs,
  config,
  inputs,
  ...
}:
let
  secretsPath = "${builtins.toString inputs.nix-secrets}/secrets";
in
{
  imports = [
    ../../network.nix
    ../../home-manager.nix
    ../../yubikey.nix
    ../../school.nix
    ../../yubikey.nix
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
    sopsFile = "${secretsPath}/password_raphael";
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

  security.pam = {
    u2f = {
      enable = true;
      settings = {
        authfile = "/home/raphael/.config/Yubico/u2f_keys";
      };
    };
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
  };

  home-manager.users.raphael = import ../../../../home/raphael;

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
        ".config/sops"
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
