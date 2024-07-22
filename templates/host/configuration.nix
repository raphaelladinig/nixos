{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ../../users/root
  ];

  networking.hostName = "host";

  system.stateVersion = "24.05";
}
