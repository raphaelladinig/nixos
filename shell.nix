{
  pkgs ? import <nixpkgs> { },
}:

{
  default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      neovim
      nix
      git
      just
    ];
  };
}
