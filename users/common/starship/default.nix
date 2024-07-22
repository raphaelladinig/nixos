{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/zsh/starship.toml";
  };

  home.packages = with pkgs; [ starship ];
}
