{ pkgs, ... }:

{
  home.file = {
    ".zshrc".source = ./.zshrc;
    ".zprofile".source = ./.zprofile;
  };

  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
