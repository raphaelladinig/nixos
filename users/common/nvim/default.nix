{ pkgs, ... }:

{
  imports = [
    ./modules/development/languages/cpp
    ./modules/development/languages/lua
    ./modules/development/languages/nix
    ./modules/development/git
    ./modules/ux
    ./modules/notes
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [ wl-clipboard ];
  };
}
