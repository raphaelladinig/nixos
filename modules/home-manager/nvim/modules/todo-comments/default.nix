{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = todo-comments-nvim;
      type = "lua";
      config = builtins.readFile ./todo-comments.lua;
    }
  ];
}
