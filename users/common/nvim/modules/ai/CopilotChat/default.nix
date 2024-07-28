{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = CopilotChat-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      plenary-nvim
    ];
  };
}
