{ inputs, ... }:
let
  secretsPath = "${builtins.toString inputs.nix-secrets}/secrets";
in
{
  imports = [ ../../common/network.nix ];

  sops.secrets."Cristallo.nmconnection" = {
    sopsFile = "${secretsPath}/Cristallo.nmconnection";
    path = "/etc/NetworkManager/system-connections/Cristallo.nmconnection";
  };
  
  sops.secrets."CristalloOsttirol.nmconnection" = {
    sopsFile = "${secretsPath}/CristalloOsttirol.nmconnection";
    path = "/etc/NetworkManager/system-connections/CristalloOsttirol.nmconnection";
  };

  # sops.secrets."HTLinn.nmconnection" = {
  #   sopsFile = "${secretsPath}/HTLinn.nmconnection";
  #   path = "/etc/NetworkManager/system-connections/HTLinn.nmconnection";
  # };
}
