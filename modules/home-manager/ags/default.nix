{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/ags".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/ags/ags";
    "/etc/greetd/greeter.js" = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/ags/greeter.js";
  };

  home.packages = with pkgs; [
    ags
    bun
  ];
}
