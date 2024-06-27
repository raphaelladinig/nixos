{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = builtins.readFile ./nvim-lspconfig.lua;
    }
    telescope-nvim
    neodev-nvim
    cmp-nvim-lsp
  ];
}
