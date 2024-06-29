{ pkgs, config, ... }:

{
  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./nvim;
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
  ];
}
