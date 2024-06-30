{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/hyprland/hypr";
    "/etc/greetd/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/hyprland/greetd.conf";
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
    ../waybar
    ../mako
    ../rofi-wayland
    ../gtk.nix
  ];
}
