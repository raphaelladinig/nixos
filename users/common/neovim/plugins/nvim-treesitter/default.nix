{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-treesitter;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      (nvim-treesitter.withPlugins (p: [ p.tree-sitter-vimdoc ]))
      nvim-treesitter-context
      nvim-ts-autotag
    ];
  };

  home.packages = with pkgs; [ tree-sitter ];
}
