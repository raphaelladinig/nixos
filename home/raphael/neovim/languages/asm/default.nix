{ pkgs, ... }:
{
  imports = [
    ../../plugins/conform
  ];

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';
  };

  home.packages = with pkgs; [
    asmfmt
    nasm
  ];
}
