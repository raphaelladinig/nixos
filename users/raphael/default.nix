{
  inputs,
  pkgs,
  ...
}:

{
  programs.zsh.enable = true;

  users.users.raphael = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$pRkRmanRiGnG4rUsMHx0w/$4RmZjflzzhWpEy.H.jM7MfkOdez4/PnQcMy1ove2srA";
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
