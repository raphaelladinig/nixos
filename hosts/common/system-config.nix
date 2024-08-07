{ locale, timezone }:

{
  imports = [ ../../users/root ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
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

  nixpkgs.config.allowUnfree = true;
}
