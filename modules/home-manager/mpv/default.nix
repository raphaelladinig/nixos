{ config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/mpv".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/mpv/mpv";
  };
}
