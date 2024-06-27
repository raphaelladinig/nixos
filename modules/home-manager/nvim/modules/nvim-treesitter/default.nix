{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter.withPlugins (p: [
        p.tree-sitter-lua
        p.tree-sitter-nix
      ]);
      type = "lua";
      config = builtins.readFile ./nvim-treesitter.lua;
    }
    nvim-treesitter-textobjects
    nvim-ts-autotag
    nvim-treesitter-context
  ];
}
