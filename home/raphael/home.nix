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
    ./ssh
    ./gopass
    ./git.nix
    ./virt-manager.nix
    ./mpv
    ./hyprland
    ./zsh
  ];

  home = {
    username = "raphael";
    homeDirectory = "/home/raphael";
    stateVersion = "24.11";
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
    home-manager
    nasm
  ];
}
