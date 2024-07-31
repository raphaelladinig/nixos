{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-dap;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      nvim-dap-virtual-text
      nvim-dap-ui
      neodev-nvim
      nvim-nio
      cmp-dap
    ];
  };
}
