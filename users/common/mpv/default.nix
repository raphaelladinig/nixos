{ config, ... }:

let
  inherit (import ../../../config.nix) flake;
in
{
  home.file = {
    ".config/mpv".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/mpv/mpv";
  };
}
