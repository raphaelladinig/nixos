{ pkgs, ... }:
{
  imports = [
    ../../plugins/nvim-lspconfig
    ../../plugins/nvim-dap
    ../../plugins/conform
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-dap-python
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';
  };

  home.packages = with pkgs; [
    pyright
    black
    (python3.withPackages (p: [
      p.debugpy
    ]))
  ];
}
