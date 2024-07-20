{ pkgs, ... }:

let
  inherit (import ../../lib/config.nix) flake;
  locale = "en_US.UTF-8";
  timezone = "Europe/Vienna";
in
{
  imports = [ ../../users/root ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ nh ];

  environment.variables = {
    FLAKE = "${flake}";
  };

  time.timeZone = "${timezone}";

  i18n.defaultLocale = "${locale}";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${locale}";
    LC_IDENTIFICATION = "${locale}";
    LC_MEASUREMENT = "${locale}";
    LC_MONETARY = "${locale}";
    LC_NAME = "${locale}";
    LC_NUMERIC = "${locale}";
    LC_PAPER = "${locale}";
    LC_TELEPHONE = "${locale}";
    LC_TIME = "${locale}";
  };
}
