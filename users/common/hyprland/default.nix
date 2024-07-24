{ pkgs, ... }:

{
  home.file = {
    ".config/hypr".source = ./hypr;
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
    ../firefox.nix
  ];
}
