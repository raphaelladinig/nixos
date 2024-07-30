{ pkgs, ... }:

{
  imports = [ ../nvim-cmp ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      telescope-nvim
      cmp-nvim-lsp
      neodev-nvim
    ];
  };
}
