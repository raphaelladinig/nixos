{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = todo-comments-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      plenary-nvim
    ];
  };
}
