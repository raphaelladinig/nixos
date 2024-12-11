{
  pkgs ? import <nixpkgs> { },
}:
{
  default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      git
      just
      sops
      age
      ssh-to-age
      cryptsetup
      vim
    ];
  };
}
