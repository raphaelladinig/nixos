{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = "/home/raphael/.ssh/id_raphael";
      };
    };
  };

  home.file = {
    ".ssh/id_raphael.pub".source = ./id_raphael.pub;
  };
}
