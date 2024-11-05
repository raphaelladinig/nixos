{ pkgs, ... }:
{
  imports = [
    ../nvim-treesitter
    ../dressing
    ../copilot
    ../render-markdown
    ../img-clip
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = avante-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      nui-nvim
      plenary-nvim
    ];
  };
}
