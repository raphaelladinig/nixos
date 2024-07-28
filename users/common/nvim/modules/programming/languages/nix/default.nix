{ pkgs, ... }:

{
  imports = [ ../../formatting ];

  programs.neovim.extraLuaConfig = ''
    ${builtins.readFile ./config.lua}
  '';

  home.packages = with pkgs; [ nixfmt-rfc-style ];
}
