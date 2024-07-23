{
  description = "This flake contains my NixOS configuration files";

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

    impermanence = {
      url = "github:nix-community/impermanence";
    };
  };

  outputs =
    inputs:
    let
      inherit (import ../../lib/forEachSystem.nix { inherit inputs; }) forEachSystem;

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
            inputs.impermanence.nixosModules.impermanence
            ./hosts/inspiron/configuration.nix
          ];
        };
        iso = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs;
          modules = [
            inputs.home-manager.nixosModules.home-manager
            ./hosts/iso/configuration.nix
          ];
        };
      };
    };
}
