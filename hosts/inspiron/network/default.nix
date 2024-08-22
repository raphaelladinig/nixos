{
  imports = [ ../../common/network.nix ];

  sops.secrets."Cristallo.nmconnection" = {
    sopsFile = ../secrets/Cristallo.nmconnection;
    path = "/etc/NetworkManager/system-connections/Cristallo.nmconnection";
  };
  sops.secrets."HTLinn.nmconnection" = {
    sopsFile = ../secrets/HTLinn.nmconnection;
    path = "/etc/NetworkManager/system-connections/HTLinn.nmconnection";
  };
}
