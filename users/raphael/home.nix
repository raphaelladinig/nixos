{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ../common/gopass.nix
    ../common/hyprland
    ../common/xdg-user-dirs.nix
    ../common/zsh
    ../common/lazygit
    ../common/bluetuith
    ../common/nvim
  ];

  home = {
    username = "raphael";
    homeDirectory = "/home/raphael";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tokei
    htop
    gnumake
    neofetch
  ];
}
