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
    (python3.withPackages (python-pkgs: with python-pkgs; [ debugpy ]))
    black
    python311Packages.debugpy
    vale
    marksman
    lemminx
    texlab
    beautysh
    prettierd
    nodePackages.vscode-html-languageserver-bin
    emmet-language-server
    nodePackages.vscode-css-languageserver-bin
    tailwindcss-language-server
    nodePackages.typescript-language-server
    bash-language-server
    nodejs
    tree-sitter
    ripgrep
    gnumake
    cmake
  ];
}
