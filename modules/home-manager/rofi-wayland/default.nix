{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/rofi/rofi";
  };

  home.packages = with pkgs; [
    rofi-wayland
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];
}
