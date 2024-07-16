{ config, ... }:

let
  inherit (import ../../../lib/config.nix) flake;
in
{
  home.file = {
    ".gnupg/public.gpg".source = config.lib.file.mkOutOfStoreSymlink "${flake}/users/raphael/gpg/public.gpg";
  };

  sops = {
    secrets = {
      private.gpg = {
        path = "/home/raphael/.gnupg/private.gpg";
      };
    };
  };
}
