{
  additions = final: prev: import ../packages { pkgs = final; };

  modifications = final: prev: {
    nnn = import ./nnn.nix { inherit prev; };
    nerdfonts = import ./nerdfonts.nix { inherit prev; };
    zen-browser = (import ./zen-browser { inherit prev; }).specific;
  };
}
