{
  home = {
    username = "raphael";
    homeDirectory = "/home/raphael";
    stateVersion = "24.05";
  };

  imports = [
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

  programs.home-manager.enable = true;
}
