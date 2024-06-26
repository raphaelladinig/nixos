{ pkgs, ... }:

{
  home.file = {
    ".config/nvim".source = ./nvim;
  };

  home.packages = with pkgs; [
    vim-language-server
    lua-language-server
    stylua
    clang-tools
    nil
    nixfmt-rfc-style
  ];
}
