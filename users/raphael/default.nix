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
    initialPassword = "raphael";
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
