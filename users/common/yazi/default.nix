{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".config/yazi".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/yazi/yazi";
  };

  home.packages = with pkgs; [ yazi ];
}
