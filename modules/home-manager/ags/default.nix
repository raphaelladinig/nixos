{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/ags".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/ags/ags";
  };

  home.packages = with pkgs; [ ags ];
}
