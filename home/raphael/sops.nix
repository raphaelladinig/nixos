{
  sops = {
    defaultSopsFormat = "binary";
    age.sshKeyPaths = [ "/home/raphael/.ssh/id_raphael" ];
  };

  sops.secrets.age_raphael = {
    sopsFile = ./secrets/age_raphael;
    path = ".config/sops/age/keys.txt";
  };
}
