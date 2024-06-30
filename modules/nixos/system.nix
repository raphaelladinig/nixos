let
  inherit (import ../../variables.nix) flake browser terminal;
in
{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    FLAKE = "${flake}";
    BROWSER = "${browser}";
    TERMINAL = "${terminal}";
  };
}
