{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = trouble-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
