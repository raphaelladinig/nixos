{ pkgs, ... }:
{
  home.file = {
    ".config/swappy".source = ./swappy;
  };

  home.packages = with pkgs; [ swappy ];
}
