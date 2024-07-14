{
  inputs,
  pkgs,
  config,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;

    age = {
      keyFile = /home/raphael/.config/sops/age/keys.txt;
    };

    secrets = {
      password = {
        neededForUsers = true;
      };
    };
  };

  users.mutableUsers = false;

  users.users.raphael = {
    isNormalUser = true;
    # hashedPassword = config.sops.secrets.password.path;
    password = "test";
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
