{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = luasnip;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      friendly-snippets
    ];
  };
}
