{ inputs, pkgs, ... }:

let
  inherit (import ../../vars) hashedPassword;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users.raphael = {
    hashedPassword = hashedPassword;
    isNormalUser = true;
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
