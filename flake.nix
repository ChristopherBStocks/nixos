{
  description = "NixOS System Deployment and Management Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs?ref=ee930f9755f58096ac6e8ca94a1887e0534e2d81";
    colmena.url = "github:zhaofengli/colmena";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, disko, colmena, ... } @inputs:
  let
   system    = "x86_64-linux";
   unstable  = import nixpkgs-unstable { inherit system; };
  in
  {
    nixosConfigurations = {
       personal-nix-control = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           disko.nixosModules.disko
           ./hosts/personal-nix-control/configuration.nix
         ];
       };
       hydrogroup-nix-control = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           disko.nixosModules.disko
           ./hosts/hydrogroup-nix-control/configuration.nix
         ];
       };
    };
    colmena = {
      meta = {
        nixpkgs = import nixpkgs { system = "x86_64-linux"; };
        specialArgs = { inherit inputs; };
      };
      defaults.imports = [ disko.nixosModules.disko ];
      personal-nix-control = ./hosts/personal-nix-control;
      hydrogroup-nix-control = ./hosts/hydrogroup-nix-control;
    };
  };
}
