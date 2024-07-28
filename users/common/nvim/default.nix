{ pkgs, ... }:

{
  imports = [
    ./modules/programming/languages/cpp
    ./modules/programming/languages/lua
    ./modules/programming/languages/nix
    ./modules/programming/git
    ./modules/ux
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [ wl-clipboard ];
  };
}
