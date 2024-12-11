{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = img-clip-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}
