{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  
  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [ polkit_gnome ];
  
  imports = [
    ./polkit.nix
  ];
}
