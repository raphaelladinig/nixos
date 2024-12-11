{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      nvim-web-devicons
    ];
  };
}
