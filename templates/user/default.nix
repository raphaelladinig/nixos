{ inputs, ... }:

{
  users.users.username = {
    isNormalUser = true;
    initialPassword = "username";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.username = import ./home.nix;
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
