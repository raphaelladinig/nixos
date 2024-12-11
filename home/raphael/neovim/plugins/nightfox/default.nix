{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nightfox-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
