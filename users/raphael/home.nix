{ pkgs, inputs, ... }:

{
  home = {
    username = "raphael";
    homeDirectory = "/home/raphael";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    firefox
    tokei
    htop
    gnumake
    python3
    nodejs
    neofetch
  ];

  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./ssh
    ./git.nix
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/xdg-user-dirs.nix
    ../../modules/home-manager/mpv
    ../../modules/home-manager/zsh
    ../../modules/home-manager/bluetuith
    ../../modules/home-manager/kitty
    ../../modules/home-manager/lazygit
    ../../modules/home-manager/nvim
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;

    age = {
      keyFile = /home/raphael/.config/sops/age/keys.txt;
    };
  };
}
