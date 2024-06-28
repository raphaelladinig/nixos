{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = toggleterm-nvim;
      type = "lua";
      config = builtins.readFile ./toggleterm.lua;
    }
  ];
}
