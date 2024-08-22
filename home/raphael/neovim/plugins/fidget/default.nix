{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = fidget-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
