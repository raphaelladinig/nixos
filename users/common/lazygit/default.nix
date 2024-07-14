{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".config/lazygit".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/lazygit/lazygit";
  };

  home.packages = with pkgs; [ lazygit ];
}
