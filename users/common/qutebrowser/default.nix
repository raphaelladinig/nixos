{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  imports = [ ../mpv ];

  home.file = {
    ".config/qutebrowser".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/qutebrowser/qutebrowser";
  };

  home.packages = with pkgs; [ qutebrowser ];
}
