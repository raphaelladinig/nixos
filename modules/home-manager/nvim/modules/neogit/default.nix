{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neogit; 
      type = "lua";
      config = builtins.readFile ./neogit.lua;
    }
    telescope-nvim
    plenary-nvim
    diffview-nvim
    fzf-lua
  ];
}
