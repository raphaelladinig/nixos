{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = copilot-lua;
      type = "lua";
      config = builtins.readFile ./copilot.lua;
    }
    CopilotChat-nvim
    plenary-nvim
  ];
}
