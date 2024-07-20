{ pkgs, ... }:

{
  imports = [
    ./gopass
    ./git.nix
    ../common/hyprland
    ../common/xdg-user-dirs.nix
    ../common/mpv
    ../common/zsh
    ../common/bluetuith
    ../common/lazygit
    ../common/nvim
  ];

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
}
