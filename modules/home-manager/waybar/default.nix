{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/waybar/waybar";
  };

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    waybar
  ];
}
