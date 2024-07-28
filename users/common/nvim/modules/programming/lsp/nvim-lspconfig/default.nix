{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      telescope-nvim
      cmp-nvim-lsp
      neodev-nvim
    ];
  };

  home.packages = with pkgs; [
    vim-language-server
    lua-language-server
    pyright
    bash-language-server
    nil
    vscode-langservers-extracted
    nodePackages.typescript-language-server
    emmet-language-server
    tailwindcss-language-server
  ];
}
