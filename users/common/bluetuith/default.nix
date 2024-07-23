{ pkgs, ... }:

{
  home.file = {
    ".config/bluetuith".source = ./bluetuith;
  };

  home.packages = with pkgs; [ bluetuith ];
}
