{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = luasnip-nvim; 
      type = "lua";
      config = builtins.readFile ./luasnip.lua;
    }
    friendly-snippets-nvim
  ];
}
