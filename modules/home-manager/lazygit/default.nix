{ pkgs, config, ... }:

let
  inherit (import ../../../vars) flake;
in
{
  home.file = {
    ".config/lazygit".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/lazygit/lazygit";
  };

  home.packages = with pkgs; [
    lazygit
  ];
}
