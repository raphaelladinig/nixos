{ pkgs, ... }:

{
  imports = [ ../../plugins/conform ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ (nvim-treesitter.withPlugins (p: [ p.tree-sitter-lua ])) ];

    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';
  };

  home.packages = with pkgs; [
    stylua
    lua-language-server
  ];
}
