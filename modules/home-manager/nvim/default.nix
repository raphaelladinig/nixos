{ pkgs, lib, ... }:

{
  imports = with ./modules; [
    catppuccin
    telescope
    oil
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
