{ pkgs, config, ... }:

let
  inherit (import ../../../config.nix) flake;
in
{
  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/zsh/.zshrc";
    ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/zsh/.p10k.zsh";
  };

  home.packages = with pkgs; [
    fzf
    zoxide
  ];

  imports = [ ../yazi ];
}
