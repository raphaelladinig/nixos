{ pkgs, ... }:

{
  home.file = {
    ".config/nvim".source = ./nvim;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    nodejs
    tree-sitter
    ripgrep
    gnumake
    cmake
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
    nodePackages.vscode-json-languageserver
    bash-language-server
  ];
}
