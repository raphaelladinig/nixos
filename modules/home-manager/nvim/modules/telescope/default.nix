{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = telescope-nvim;
      type = "lua";
      config = builtins.readFile ./telescope.lua;
    }
    telescope-fzf-native-nvim
  ];
}
