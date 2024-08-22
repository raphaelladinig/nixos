{ pkgs, ... }:
{
  imports = [ ../nvim-treesitter ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      nvim-ts-context-commentstring
    ];
  };
}
