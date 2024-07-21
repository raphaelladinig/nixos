{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/kitty/kitty";
  };

  home.packages = with pkgs; [
    kitty
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];
}
