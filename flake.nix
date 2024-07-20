{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      forEachSystem = inputs.nixpkgs.lib.genAttrs [ "x86_64-linux" ];

      specialArgs = {
        inherit inputs;
      };
    in
    {
      formatter = forEachSystem (system: inputs.nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      devShells = forEachSystem (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        import ./shell.nix { inherit pkgs; }
      );

      nixosConfigurations = {
        inspiron = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs;
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.disko.nixosModules.disko
            ./hosts/inspiron/configuration.nix
          ];
        };
      };
    };
}
