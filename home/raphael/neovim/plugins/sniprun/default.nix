{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = sniprun;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
