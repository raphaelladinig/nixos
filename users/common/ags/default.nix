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
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];
}
