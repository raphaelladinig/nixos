{ pkgs, ... }:

{
  home.file = {
    ".config/yazi".source = ./yazi;
  };

  home.packages = with pkgs; [ yazi ];
}
