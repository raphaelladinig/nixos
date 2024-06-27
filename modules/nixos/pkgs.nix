{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nh
    firefox
    lazygit
    zoxide
    tokei
    neovim
    kitty
    nnn
    neofetch
    git
    htop
    libnotify
    bluetuith
    mpv
    pass
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
