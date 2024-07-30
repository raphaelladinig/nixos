{ pkgs, ... }:

{
  imports = [
    ../plugins/gitsigns
    ../plugins/neogit
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ (nvim-treesitter.withPlugins (p: [ p.tree-sitter-diff ])) ];
  };
}
