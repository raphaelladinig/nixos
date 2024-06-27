{ pkgs, ... }:

{
  # home.file = {
  #   ".config/nvim".source = ./nvim;
  # };

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./misc.lua}
      ${builtins.readFile ./keymaps.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      telescope-nvim
    ];
  };

  home.packages = with pkgs; [
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
}
