{ pkgs, config, ... }:

let
  inherit (import ../../../config.nix) flake;
in
{
  home.file = {
    ".config/bluetuith".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/bluetuith/bluetuith";
  };

  home.packages = with pkgs; [ bluetuith ];
}
