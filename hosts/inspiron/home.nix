let
  inherit (import ../../variables.nix) username;
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
    ../../modules/home-manager/nvim
    ../../modules/home-manager/git.nix
  ];
  
  programs.home-manager.enable = true;
}
