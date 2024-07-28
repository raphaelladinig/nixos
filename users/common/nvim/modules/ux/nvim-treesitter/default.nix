{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = (
          nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
          ])
        );
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      nvim-treesitter-context
      nvim-ts-autotag
    ];
  };
}
