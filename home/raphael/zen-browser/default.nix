{ pkgs, ... }:
{
  home.file = {
    ".zen/profiles.ini".source = ./zen/profiles.ini;
    ".zen/default/user.js".source = ./zen/default/user.js;
    ".zen/default/search.json.mozlz4" = {
      force = true;
      source = ./zen/default/search.json.mozlz4;
    };
  };

  home.packages = with pkgs; [
    zen-browser
  ];
}
