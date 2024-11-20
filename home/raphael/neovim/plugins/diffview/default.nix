{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = diffview-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
