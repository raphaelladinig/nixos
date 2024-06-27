{ pkgs, ... }:

{
  home.file = {
    ".config/nvim".source = ./nvim;
  };

  home.packages = with pkgs; [
    nodejs
    unzip
    python3
    gnumake
    tree-sitter
  ];
}
