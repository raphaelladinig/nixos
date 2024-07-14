{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko
    ./disko.nix
    ../../users/raphael
    ../../modules/nixos/audio.nix
    ../../modules/nixos/network.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/virtualisation.nix
    ../../modules/nixos/power-management.nix
  ];

  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    efiSupport = true;
  };

  networking.hostName = "inspiron";

  environment.systemPackages = with pkgs; [
    firefox
    tokei
    gnumake
    cmake
    python3
    rustc
    nodejs
    neofetch
    htop
    pass
  ];

  programs = {
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-tty;
    };
  };

  systemd.services.fix-touchpad = {
    path = [ pkgs.kmod ];
    serviceConfig.ExecStart = ''${pkgs.systemd}/bin/systemd-inhibit --what=sleep --why="fixing touchpad must finish before sleep" --mode=delay  ${./fix_touchpad.sh}'';
    serviceConfig.Type = "oneshot";
    description = "reload touchpad driver";
    wantedBy = [
      "display-manager.service"
      "post-resume.target"
    ];
    after = [ "post-resume.target" ];
  };

  hardware.graphics.enable = true;

  boot.initrd.kernelModules = [ "amdgpu" ];

  system.stateVersion = "24.05";
}
