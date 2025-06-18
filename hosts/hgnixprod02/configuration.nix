{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./static-ip.nix
    ../../configs/hydrogroup-server-colmena.nix
  ];
  system.stateVersion                   = "25.05";
  networking.hostName                   = "hgnixprod02";
  nix.settings.experimental-features    = ["nix-command" "flakes" ];
}
