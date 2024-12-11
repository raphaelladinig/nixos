{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = copilot-lua;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };

  home.packages = with pkgs; [ nodejs ];
}
