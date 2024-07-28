{ pkgs, ... }:

{
  imports = [ ../../../ux/telescope ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = neogit;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      plenary-nvim
      diffview-nvim
    ];
  };
}
