{ modulesPath, ... }:

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ../../users/raphael
    ../../users/root
    ../common/hyprland.nix
    ../common/greetd.nix
    ../common/system.nix
  ];

  networking.hostName = "iso";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.05";
}
