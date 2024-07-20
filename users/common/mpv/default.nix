{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".config/mpv".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/mpv/mpv";
  };

  home.packages = with pkgs; [
    mpv
    yt-dlp
  ];
}
