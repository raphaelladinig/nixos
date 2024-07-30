{
  imports = [
    ../notes
    ../plugins/toggleterm
    ../plugins/overseer
    ../plugins/fidget
    ../plugins/oil
    ../plugins/lualine
    ../plugins/telescope
    ../plugins/dressing
    ../plugins/todo-comments
    ../plugins/comment
    ../plugins/nvim-cmp
    ../plugins/nvim-surround
    ../plugins/indent-blankline
    ../plugins/nvim-autopairs
    ../plugins/nvim-treesitter
    ../plugins/catppuccin
  ];

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
      ${builtins.readFile ./misc.lua}
    '';
  };
}
