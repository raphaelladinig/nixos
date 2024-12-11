{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
