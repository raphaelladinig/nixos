{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nh
    firefox
    lazygit
    zoxide
    tokei
    killall
    neovim
    kitty
    nnn
    gnumake
    python3
    neofetch
    git
    htop
    libnotify
    bluetuith
    mpv
    pass
    gcc
    tree-sitter
    fzf
    nodejs
    unzip
    cargo
  ];

  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-tty;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "CascadiaCode" ]; }) ];
}
