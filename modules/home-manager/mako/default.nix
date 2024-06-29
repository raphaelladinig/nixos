{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/mako".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/mako/mako";
  };

  home.packages = with pkgs; [
    mako
    libnotify
  ];
}
