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
      nvim-dap-python
      nvim-dap-ui
      neodev-nvim
      nvim-nio
    ];
  };

  home.packages = with pkgs; [
    gdb
    (python3.withPackages (python-pkgs: with python-pkgs; [ debugpy ]))
  ];
}
