{ pkgs, config, ... }:

let
  inherit (import ../../../options.nix) flake;
in
{
  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/zsh/.zshrc";
  };
  
  home.packages = with pkgs; [
    fzf
    zoxide
  ];

  imports = [
    ../yazi
  ];
}
