{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ../../users/raphael
    ../common/audio.nix
    ../common/network.nix
    ../common/hyprland.nix
    ../common/greetd.nix
    ../common/system.nix
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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.initrd.kernelModules = [ "amdgpu" ];

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

  system.stateVersion = "24.05";
}
