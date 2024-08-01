{
  inputs,
  pkgs,
  config,
  ...
}:
let
  inherit (import ../../lib/ifGroupExists.nix { inherit config; }) ifGroupExists;
in
{
  programs.zsh.enable = true;

  users.users.raphael = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$0S8dScjAcf4KywNEGa7271$wUYa5b5xXQCCj4SwEbpJGCGXAVCPRV0q0XoCo2gc4W9";
    extraGroups =
      [ "wheel" ]
      ++ ifGroupExists [
        "video"
        "audio"
        "input"
        "networkmanager"
        "libvirtd"
      ];

    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.raphael = import ./home.nix;
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
