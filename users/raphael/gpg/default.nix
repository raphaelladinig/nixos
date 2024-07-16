{ pkgs, ... }:

{
  sops = {
    secrets = {
      "private.gpg" = { };
    };
  };

  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = ./public.gpg;
        trust = 5;
      }
    ];
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
  };
}
