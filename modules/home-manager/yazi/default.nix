{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/yazi".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/yazi/yazi";
  };

  home.packages = with pkgs; [
    yazi
  ];
}
