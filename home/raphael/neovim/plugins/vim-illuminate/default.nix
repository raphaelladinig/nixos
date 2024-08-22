{ pkgs, ... }:
{
  imports = [ ../nvim-treesitter ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = vim-illuminate;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
