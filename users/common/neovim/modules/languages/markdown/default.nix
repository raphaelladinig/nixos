{ pkgs, ... }:

{
  imports = [ ../../plugins/nvim-lint ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-markdown
        p.tree-sitter-markdown_inline
      ]))
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';
  };

  home.packages = with pkgs; [ vale ];
}
