{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter;
      type = "lua";
      config = builtins.readFile ./nvim-treesitter.lua;
    }
    nvim-treesitter-textobjects
    nvim-ts-autotag
    nvim-treesitter-context
  ];
}
