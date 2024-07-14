{
  inputs,
  pkgs,
  config,
  ...
}:

{
  programs.zsh.enable = true;

  sops = {
    age = {
      keyFile = /home/raphael/.config/sops/age/keys.txt;
    };

    secrets = {
      raphael-password = {
        sopsFile = ./secrets.yaml;
        neededForUsers = true;
      };
    };
  };

  users.mutableUsers = false;

  users.users.raphael = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.raphael-password.path;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "input"
      "networkmanager"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.raphael = import ./home.nix;
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
