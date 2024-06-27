{ pkgs, lib, ... }:

{
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

    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''${builtins.readFile ./plugins/telescope.lua}'';
      }
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = lib.fileContents ./plugins/catppuccin.lua;
      }
      {
        plugin = oil-nvim;
        type = "lua";
        config = ''${builtins.readFile ./plugins/oil.lua}'';
      }
    ];

    extraPackages = with pkgs; [
      vim-language-server
      lua-language-server
      stylua
      nil
      nixfmt-rfc-style
    ];
  };
}
