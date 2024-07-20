{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
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
    brightnessctl
    cliphist
    hyprlock
    wl-clipboard
  ];

  imports = [
    ../gtk.nix
    ../ags
    ../swappy
    ../kitty
    ../qutebrowser
  ];
}
