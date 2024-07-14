{ pkgs, config, ... }:

let
  inherit (import ../../../vars) flake;
in
{
  home.file = {
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/kitty/kitty";
  };

  home.packages = with pkgs; [
    kitty
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];
}
