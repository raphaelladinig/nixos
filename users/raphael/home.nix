{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ../common/gopass.nix
    ../common/virt-manager.nix
    ../common/school.nix
    ../common/yazi
    ../common/lazygit
    ../common/neovim
    ../common/mpv
    ../common/hyprland
    ../common/xdg-user-dirs.nix
    ../common/zsh
    ../common/bluetuith
    ../common/davinci-resolve.nix
  ];

  home = {
    username = "raphael";
    homeDirectory = "/home/raphael";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tokei
    tree
    htop
    gnumake
    cryptsetup
    just
  ];
}
