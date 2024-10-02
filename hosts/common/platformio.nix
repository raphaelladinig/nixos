{ pkgs, ... }:

{
  services.udev.packages = with pkgs; [ platformio-core ];

  environment.systemPackages = with pkgs; [
    platformio-core
  ];
}
