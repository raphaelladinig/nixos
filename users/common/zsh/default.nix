{ pkgs, ... }:

{
  programs.zsh.enable = true;

  home.file = {
    ".zshrc".source = ./.zshrc;
  };
  
  imports = [
    ../starship
    ../yazi
    ../nvim
    ../lazygit
  ];

  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
