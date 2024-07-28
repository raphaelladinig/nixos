{
  imports = [
    ./toggleterm
    ./oil
    ./lualine
    ./telescope
    ./dressing
    ./todo-comments
    ./comment
    ./nvim-surround
    ./indent-blankline
    ./nvim-autopairs
    ./nvim-cmp
    ./nvim-treesitter
    ./catppuccin
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
