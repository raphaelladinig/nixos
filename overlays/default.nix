{
  additions = final: prev: import ../packages { pkgs = final; };

  modifications = final: prev: {
    nnn = import ./nnn.nix { inherit prev; };
  };
}
