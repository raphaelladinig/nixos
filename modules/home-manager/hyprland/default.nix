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
    hyprlock
  ];

  imports = [
    ../waybar
    ../mako
    ../gtk.nix
  ];
}
