{ pkgs, ... }:
{
  home.file = {
    ".config/gopass/config".source = ./config;
  };

  home.packages = with pkgs; [
    gopass
    age
  ];
}
