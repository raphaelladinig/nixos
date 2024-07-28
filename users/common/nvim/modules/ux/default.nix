{
  imports = [
    ./CopilotChat
    ./copilot
    ./toggleterm
    ./oil
    ./lualine
    ./nvim-treesitter
    ./telescope
    ./dressing
    ./todo-comments
    ./nvim-cmp
    ./comment
    ./nvim-surround
    ./indent-blankline
    ./nvim-autopairs
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
