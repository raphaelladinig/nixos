{ inputs, pkgs, ... }:
let
  inherit (import ../../variables.nix) username;
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
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
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };

  networking.hostName = "inspiron";

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
    backupFileExtension = "bak";
    users.${username} = import ./home.nix;
  };

  environment.systemPackages = with pkgs; [
    nh
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
    zsh.enable = true;
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

  hardware.opengl.enable = true;

  boot.initrd.kernelModules = [ "amdgpu" ];

  system.stateVersion = "24.05";
}
