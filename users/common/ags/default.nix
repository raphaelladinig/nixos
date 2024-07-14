{ pkgs, config, ... }:

let
  inherit (import ../../../config.nix) flake;
in
{
  home.file = {
    ".config/ags".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/ags";
  };

  home.packages = with pkgs; [
    ags
    libnotify
    upower
    fd
    bun
    sassc
  ];
}
