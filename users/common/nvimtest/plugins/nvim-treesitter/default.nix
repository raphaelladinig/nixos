{ pkgs, ... }:

{
  programs.neovim =
    let
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
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
          config = toLuaFile ./nvim-treesitter.lua;
        }
      ];
    };
}
