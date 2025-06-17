# nix run github:nix-community/nixos-anywhere -- --flake .#<host> -i ~/.ssh/deploy --generate-hardware-config nixos-generate-config ./hosts/<host>/hardware-configuration.nix root@<ip>
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
       pnixctl01 = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           disko.nixosModules.disko
           ./hosts/pnixctl01/configuration.nix
         ];
       };
       pnixctl02 = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           disko.nixosModules.disko
           ./hosts/pnixctl02/configuration.nix
         ];
       };
       hgnixctl01 = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           disko.nixosModules.disko
           ./hosts/hgnixctl01/configuration.nix
         ];
       };
       hgnixctl02 = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           disko.nixosModules.disko
           ./hosts/hgnixctl02/configuration.nix
         ];
       };
    };
    colmena = {
      meta = {
        nixpkgs = import nixpkgs { system = "x86_64-linux"; };
        specialArgs = { inherit inputs; };
      };
      defaults.imports = [
        disko.nixosModules.disko
      ];
      pnixctl01 = ./hosts/pnixctl01;
      pnixctl02 = ./hosts/pnixctl02;
      hgnixctl01 = ./hosts/hgnixctl01;
      hgnixctl02 = ./hosts/hgnixctl02;
    };
  };
}