{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-dap;
      type = "lua";
      config = builtins.readFile ./nvim-dap.lua;
    }
    nvim-dap-virtual-text
    nvim-dap-ui
    neodev-nvim
    neotest
  ];
}
