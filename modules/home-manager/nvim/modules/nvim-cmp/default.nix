{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-cmp;
      type = "lua";
      config = builtins.readFile ./nvim-cmp.lua;
    }
    luasnip
    cmp_luasnip
    cmp-nvim-lsp
    cmp-path
    cmp-buffer
    cmp-cmdline
    lspkind-nvim
  ];
}
