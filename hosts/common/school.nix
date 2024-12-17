{ pkgs, ... }:

{
  services.udev.packages = with pkgs; [
    platformio-core.udev
  ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  environment.systemPackages = with pkgs; [
    platformio
  ];
}
