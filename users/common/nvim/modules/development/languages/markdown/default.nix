{ pkgs, ... }:

{
  imports = [ ../../linting ];

  home.packages = with pkgs; [ vale ];
}
