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
    neofetch
  ];

  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./ssh
    ./git.nix
    ../common/hyprland
    ../common/xdg-user-dirs.nix
    ../common/mpv
    ../common/zsh
    ../common/bluetuith
    ../common/kitty
    ../common/lazygit
    ../common/nvim
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;

    age = {
      keyFile = /home/raphael/.config/sops/age/keys.txt;
    };
  };
}
