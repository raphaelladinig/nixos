{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = dressing-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
