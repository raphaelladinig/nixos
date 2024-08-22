{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = overseer-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
