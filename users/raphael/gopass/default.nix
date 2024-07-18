{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  # home.file = {
  #   ".password-store/".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/raphael/pass/.password-store/";
  # };

  home.packages = with pkgs; [
    gopass
    age
    git
  ];
}
