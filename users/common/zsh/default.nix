{ pkgs, config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  imports = [ ../yazi ];

  programs = {
    zsh.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };

  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/zsh/.zshrc";
    ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/common/zsh/.p10k.zsh";
  };

  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
