{ inputs, pkgs, ... }:

let
  inherit (import ../../variables.nix) username;
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-hardware.nixosModules.dell-inspiron-5515
    ../../modules/nixos/audio.nix
    ../../modules/nixos/network.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/nix-settings.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/power-management.nix
    ../../modules/nixos/pkgs.nix
    ../../modules/nixos/locales.nix
    ../../modules/nixos/virtualisation.nix
  ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };

  networking.hostName = "inspiron";

  time.timeZone = "Europe/Vienna";

  users.users.${username} = {
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
    users.${username} = import ./home.nix;
  };

  system.stateVersion = "24.05";
}
