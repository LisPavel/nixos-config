{
  description = "My NixOS config";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nixos-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hosts/default.nix
          ./hosts/nixos-laptop/default.nix
          ./users/default.nix
          ./users/mk/default.nix
          ./users/pl/default.nix
        ];
      };
    };
  };
}
