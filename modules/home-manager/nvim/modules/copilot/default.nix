{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = copilot-nvim;
      type = "lua";
      config = builtins.readFile ./copilot.lua;
    }
    CopilotChat-nvim
    plenary-nvim
  ];
}
