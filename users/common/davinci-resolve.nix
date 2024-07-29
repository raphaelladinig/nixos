{ pkgs, ... }:

{
  home.packages = with pkgs; [
    davinci-resolve
    # davinci-resolve-studio
  ];
}
