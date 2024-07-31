{
  imports = [
    ./base
    # ./ai
    ./git
    ./notes
    ./languages/lua
    ./languages/nix
    ./languages/cpp
  ];

  programs.neovim = {
    enable = true;
  };
}
