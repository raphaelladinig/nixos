{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    plugins = [
      {
        name = "zsh-fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];
  };

  home.file = {
    ".zshrc".source = ./.zshrc;
  };

  imports = [ ../starship ];

  programs.neovim.enable = true;

  home.packages = with pkgs; [
    fzf
    zoxide
    yazi
    lazygit
  ];
}
