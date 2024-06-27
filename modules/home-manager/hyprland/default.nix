{ pkgs, ... }:

{
  home.file = {
    ".config/hypr".source = ./hypr;
  };

  home.packages = with pkgs; [
    bibata-cursors
    slurp
    grim
    brightnessctl
    cliphist
    waybar
    mako
    libnotify
    hyprlock
    rofi-wayland
  ];

  imports = [
    ../waybar
    ../mako
    ../rofi
    ../gtk.nix
  ];
}
