{ pkgs, ... }:
{
  home.file = {
    ".config/ags".source = ./ags;
  };

  home.packages = with pkgs; [
    ags
    libnotify
    upower
    fd
    bun
    sassc
    xdg-terminal-exec
    nerd-fonts.caskaydia-cove
  ];
}
