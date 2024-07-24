{ pkgs, ... }:

{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [ qemu ];
}
