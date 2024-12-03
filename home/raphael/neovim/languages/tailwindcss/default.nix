{ pkgs, ... }:
{
  imports = [
    ../../plugins/nvim-lspconfig
  ];

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';
  };

  home.packages = with pkgs; [
    tailwindcss-language-server
  ];
}
