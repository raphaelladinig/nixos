{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = oil-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      nvim-web-devicons
    ];
  };
}
