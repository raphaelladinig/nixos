{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = conform-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };

  home.packages = with pkgs; [
    clang-tools
    stylua
    nixfmt-rfc-style
    black
    vale
    beautysh
    prettierd
  ];
}
