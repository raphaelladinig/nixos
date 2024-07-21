{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".config/bluetuith".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/bluetuith/bluetuith";
  };

  home.packages = with pkgs; [ bluetuith ];
}
