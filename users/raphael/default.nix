let
  inherit (import ../../vars) username;
in
{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };

  imports = [
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/xdg-user-dirs.nix
    ../../modules/home-manager/mpv
    ../../modules/home-manager/zsh
    ../../modules/home-manager/bluetuith
    ../../modules/home-manager/kitty
    ../../modules/home-manager/lazygit
    ../../modules/home-manager/nvim
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/ssh
  ];

  programs.home-manager.enable = true;
}
