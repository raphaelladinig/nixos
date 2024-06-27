{ pkgs, lib, ... }:

{
  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
      ${builtins.readFile ./misc.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugins/nvim-telescope.lua;
      }
      {
        plugin = catppuccin-nvim;
        config = toLuaFile ./plugins/catppuccin.lua;
      }
      {
        plugin = oil-nvim;
        config = toLuaFile ./plugins/oil.lua;
      }
    ];

    extraPackages = with pkgs; [
    vim-language-server
    lua-language-server
    stylua
    clang-tools
    vscode-extensions.vadimcn.vscode-lldb
    nil
    nixfmt-rfc-style
    nodePackages.vscode-html-languageserver-bin
    emmet-language-server
    nodePackages.vscode-css-languageserver-bin
    tailwindcss-language-server
    nodePackages.typescript-language-server
    prettierd
    pyright
    black
    python312Packages.debugpy
    marksman
    vale
    nodePackages.vscode-json-languageserver-bin
    nodePackages.bash-language-server
    beautysh
    bashdb
    lemminx
    texlab
    jdt-language-server
    vscode-extensions.vscjava.vscode-java-test
    vscode-extensions.vscjava.vscode-java-debug
    
    ];
  };
}
