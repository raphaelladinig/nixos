{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".config/swappy".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/swappy/swappy";
  };

  home.packages = with pkgs; [ swappy ];
}
