{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      {
        plugin = oil-nvim;
        type = "lua";
        config = builtins.readFile ./oil.lua;
      }
    ];
}
