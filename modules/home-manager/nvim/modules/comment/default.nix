{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = comment-nvim;
      type = "lua";
      config = builtins.readFile ./comment.lua;
    }
    nvim-treesitter
    nvim-ts-context-commentstring
  ];
}
