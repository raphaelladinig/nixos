{
  inputs,
  pkgs,
  ...
}:

{
  programs.zsh.enable = true;

  users.users.raphael = {
    isNormalUser = true;
    initialPassword = "raphael";
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
