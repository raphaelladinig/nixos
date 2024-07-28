{ pkgs, ... }:

{
  programs.neovim =
    {
      plugins = with pkgs.vimPlugins; [
        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./config.lua;
        }
        telescope-fzf-native-nvim
        plenary-nvim
        nvim-web-devicons
      ];
    };
}
