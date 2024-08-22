{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = conform-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
