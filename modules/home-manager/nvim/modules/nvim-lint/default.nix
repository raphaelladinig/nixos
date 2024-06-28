{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-lint;
      type = "lua";
      config = builtins.readFile ./nvim-lint.lua;
    }
  ];
}
