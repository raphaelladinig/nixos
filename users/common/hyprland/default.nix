{ pkgs, config, ... }:

let
  inherit (import ../../../config.nix) flake;
in
{
  home.file = {
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/hyprland/hypr";
  };

  home.packages = with pkgs; [
    bibata-cursors
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    slurp
    grim
    swappy
    brightnessctl
    cliphist
    hyprlock
    wl-clipboard
  ];

  imports = [
    ../ags
    ../gtk.nix
  ];
}
