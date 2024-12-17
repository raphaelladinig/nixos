{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
    ./disko.nix
    inputs.impermanence.nixosModules.impermanence
    ../common/impermanence.nix
    ./persist.nix
    inputs.sops-nix.nixosModules.sops
    ./sops.nix
    ../common/users/raphael
    ../common/users/root
    (import ../common/system-config.nix {
      locale = "en_US.UTF-8";
      timezone = "Europe/Vienna";
    })
    ./network
    ../common/power-management.nix
    ../common/logind.nix
  ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };

  networking.hostName = "inspiron";

  system.stateVersion = "25.05";
}
