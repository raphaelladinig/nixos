{ pkgs, ... }:

{
  imports = [
    ../../plugins/nvim-lspconfig
    ../../plugins/conform
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ (nvim-treesitter.withPlugins (p: [ p.tree-sitter-nix ])) ];

    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';
  };

  home.packages = with pkgs; [
    nixfmt-rfc-style
    nil
  ];
}
