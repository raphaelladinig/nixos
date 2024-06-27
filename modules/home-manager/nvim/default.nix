{ pkgs, ... }:

{
  imports = [
    ./modules/catppuccin
    ./modules/oil
    ./modules/telescope
    ./modules/nvim-lspconfig
    ./modules/nvim-cmp
    ./modules/conform
    ./modules/todo-comments
  ];

  programs.neovim = 
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

    extraPackages = with pkgs; [
      vim-language-server
      lua-language-server
      stylua
      nil
      nixfmt-rfc-style
    ];
  };
}
