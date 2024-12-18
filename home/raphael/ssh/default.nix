{ inputs, ... }:
let
  secretsPath = "${builtins.toString inputs.nix-secrets}/secrets";
in
{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = [
          "/home/raphael/.ssh/id_raphael"
        ];
      };
    };
  };

  home.file = {
    ".ssh/id_raphael.pub".source = ../../../hosts/common/ssh/id_raphael.pub;
    ".ssh/id_yubi.pub".source = ../../../hosts/common/ssh/id_yubi.pub;
  };

  sops.secrets.id_raphael = {
    sopsFile = "${secretsPath}/id_raphael";
    path = ".ssh/id_raphael";
  };

  sops.secrets.id_yubi = {
    sopsFile = "${secretsPath}/id_yubi";
    path = ".ssh/id_yubi";
  };
}
