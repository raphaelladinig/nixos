{ pkgs, config, ... }:

let
  inherit (import ../../../variables.nix) flake;
in
{
  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${flake}/modules/home-manager/nvim/nvim";
  };

  home.packages = with pkgs; [
    vim-language-server
    lua-language-server
    clang-tools
    clang
    gdb
    stylua
    nil
    nixfmt-rfc-style
    pyright
    black
    debugpy
    bash-language-server
    bashdb
    nodejs
    tree-sitter
    gnumake
    cmake
  ];
}
