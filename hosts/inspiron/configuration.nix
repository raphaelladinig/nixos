{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./impermanence.nix
    ../../users/raphael
    ../../users/root
    ../common/audio.nix
    ../common/sudo.nix
    ../common/usb.nix
    ../common/network.nix
    ../common/hyprland.nix
    ../common/greetd.nix
    (import ../common/system.nix {
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
