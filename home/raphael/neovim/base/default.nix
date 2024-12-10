{
  imports = [
    ../plugins/dressing
    ../plugins/render-markdown
    ../plugins/img-clip
    ../plugins/fidget
    ../plugins/oil
    ../plugins/lualine
    ../plugins/telescope
    ../plugins/todo-comments
    ../plugins/comment
    ../plugins/conform
    ../plugins/nvim-lint
    ../plugins/nvim-lspconfig
    ../plugins/nvim-cmp
    ../plugins/nvim-surround
    ../plugins/indent-blankline
    ../plugins/vim-illuminate
    ../plugins/nvim-autopairs
    ../plugins/nvim-treesitter
    ../plugins/nightfox
  ];

  programs.neovim = {
    defaultEditor = true;
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
