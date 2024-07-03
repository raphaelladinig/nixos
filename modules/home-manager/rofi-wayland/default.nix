{ pkgs, config, ... }:

let
  inherit (import ../../../options.nix) flake;
in
{
  home.file = {
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/rofi-wayland/rofi";
  };

  home.packages = with pkgs; [
    rofi-wayland
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];
}
