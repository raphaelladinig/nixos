{ config, ... }:

let
  inherit (import ../../../vars) flake;
in
{
  home.file = {
    ".config/mpv".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/mpv/mpv";
  };
}
