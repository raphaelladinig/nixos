{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".config/gopass/config".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/raphael/gopass/config";
  };

  home.packages = with pkgs; [
    gopass
    age
  ];
}
