{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/zsh/.zshrc";
    ".zprofile".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/zsh/.zprofile";
  };
  
  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
