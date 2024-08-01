{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
    inputs.impermanence.nixosModules.impermanence
    ./hardware-configuration.nix
    ./disko.nix
    ./impermanence.nix
    ../../users/raphael
    ../../users/root
    ../common/audio.nix
    ../common/sudo.nix
    ../common/usb.nix
    ../common/network.nix
    ../common/yubikey.nix
    ../common/hyprland.nix
    ../common/greetd.nix
    (import ../common/system-config.nix {
      locale = "en_US.UTF-8";
      timezone = "Europe/Vienna";
    })
    ../common/bluetooth.nix
    ../common/virtualisation.nix
    ../common/power-management.nix
  ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };

  networking.hostName = "inspiron";

  system.stateVersion = "24.05";
}
