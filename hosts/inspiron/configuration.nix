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
    ../../modules/nixos/hyprland
    ../../modules/nixos/system.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/locales.nix
    ../../modules/nixos/virtualisation.nix
    ../../modules/nixos/opengl.nix
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
    backupFileExtension = "bak";
    users.${username} = import ./home.nix;
  };

  environment.systemPackages = with pkgs; [
    nh
    firefox
    lazygit
    tokei
    gnumake
    cmake
    python3
    rustc
    ags
    kitty
    nnn
    neovim
    neofetch
    git
    htop
    bluetuith
    mpv
    pass
    nodejs
  ];

  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-tty;
    };
  };

  system.stateVersion = "24.05";
}
