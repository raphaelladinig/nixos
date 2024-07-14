{ pkgs, config, ... }:

let
  inherit (import ../../../config.nix) flake;
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
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/zsh/.zshrc";
    ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/zsh/.p10k.zsh";
  };

  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
