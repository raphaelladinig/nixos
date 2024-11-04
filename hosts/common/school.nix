{ pkgs, ... }:

{
  services.udev.packages = with pkgs; [ platformio-core ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  environment.systemPackages = with pkgs; [
    platformio-core
  ];
}
