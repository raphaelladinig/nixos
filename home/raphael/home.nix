{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../common/xdg-user-dirs.nix
    ../common/nixpkgs
    inputs.sops-nix.homeManagerModules.sops
    ./sops.nix
    ./virtualisation.nix
    ./ssh
    ./zathura
    ./git.nix
    ./mpv
    ./hyprland
    ./zsh
    ./school.nix
    ./yubikey.nix
  ];

  home = {
    username = "raphael";
    homeDirectory = "/home/raphael";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fastfetch
    tokei
    tree
    htop
    gnumake
    cryptsetup
    just
    pandoc
    pavucontrol
    blueman
    davinci-resolve
    nodejs
    bun
    glow
    unzip
    zip
    home-manager
    pnpm
    sqlite
    sops
  ];
}
