{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pass
  ];

  programs = {
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-tty;
    };
  };
}
