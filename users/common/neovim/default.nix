{ pkgs, ... }:

{
  imports = [
    ./modules/base
    ./modules/ai
    ./modules/git
    ./modules/languages/lua
    ./modules/languages/nix
    ./modules/languages/cpp
    ./modules/languages/markdown
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [ wl-clipboard ];
  };
}
