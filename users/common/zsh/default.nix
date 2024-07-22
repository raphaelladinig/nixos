{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  imports = [
    ../starship
    ../yazi
    ../nvim
    ../lazygit
  ];

  programs.zsh.enable = true;

  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/zsh/.zshrc";
  };

  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
