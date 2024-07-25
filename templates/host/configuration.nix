{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
    ./hardware-configuration.nix
    ./disko.nix
    ../../users/root
  ];

  networking.hostName = "host";

  system.stateVersion = "24.05";
}
