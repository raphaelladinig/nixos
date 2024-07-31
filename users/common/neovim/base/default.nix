{
  imports = [
    ../plugins/toggleterm
    ../plugins/overseer
    ../plugins/trouble
    ../plugins/fidget
    ../plugins/oil
    ../plugins/lualine
    ../plugins/telescope
    ../plugins/dressing
    ../plugins/todo-comments
    ../plugins/comment
    ../plugins/conform
    ../plugins/nvim-lint
    ../plugins/nvim-dap
    ../plugins/nvim-lspconfig
    ../plugins/nvim-cmp
    ../plugins/nvim-surround
    ../plugins/indent-blankline
    ../plugins/vim-illuminate
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
