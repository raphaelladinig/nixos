let
  inherit (import ../../vars) gitUsername gitEmail;
in
{
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
    extraConfig = {
      pull = {
        rebase = false;
      };
    };
  };
}
