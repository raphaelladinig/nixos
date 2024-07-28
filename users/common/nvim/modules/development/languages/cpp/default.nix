{ pkgs, ... }:

{
  imports = [
    ../../formatting
    ../../lsp
    ../../dap
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ (nvim-treesitter.withPlugins (p: [ p.tree-sitter-cpp ])) ];

    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';
  };

  home.packages = with pkgs; [
    clang-tools
    clang
    gdb
  ];
}
