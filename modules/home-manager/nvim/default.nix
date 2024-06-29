{ pkgs, config, ... }:

{
  # imports = [ ./modules ];
  #
  # programs.neovim = {
  #   enable = true;
  #
  #   viAlias = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #
  #   extraLuaConfig = ''
  #     ${builtins.readFile ./options.lua}
  #     ${builtins.readFile ./keymaps.lua}
  #     ${builtins.readFile ./misc.lua}
  #   '';
  #
  #   # extraPackages = with pkgs; [ ];
  # };
  #
  # home.packages = with pkgs; [
  #   vim-language-server
  #   lua-language-server
  #   clang-tools
  #   clang
  #   gdb
  #   stylua
  #   nil
  #   nixfmt-rfc-style
  # ];

  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "./nvim";
    };
  };
}
