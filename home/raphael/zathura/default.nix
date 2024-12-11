{ pkgs, ... }:

{
  home.file = {
    ".config/zathura".source = ./zathura;
  };

  home.packages = with pkgs; [ zathura ];
}
