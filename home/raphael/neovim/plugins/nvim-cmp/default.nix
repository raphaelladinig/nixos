{ pkgs, ... }:
{
  imports = [ ../luasnip ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      cmp-cmdline
      lspkind-nvim
    ];
  };
}
