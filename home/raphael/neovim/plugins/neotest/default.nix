{ pkgs, ... }:
{
  imports = [ ../nvim-treesitter ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = neotest;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      nvim-nio
      plenary-nvim
    ];
  };
}
