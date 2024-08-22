{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lint;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };

  home.packages = with pkgs; [ vale ];
}
