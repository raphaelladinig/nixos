{ pkgs, ... }:
{
  imports = [
    ../../plugins/nvim-lspconfig
    ../../plugins/conform
  ];

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';
  };

  home.packages = with pkgs; [
    clang-tools
    clang
    lldb
  ];
}
