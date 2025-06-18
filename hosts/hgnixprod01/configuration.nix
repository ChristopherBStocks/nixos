{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./static-ip.nix
    ../../configs/hydrogroup-server-swarm.nix
  ];
  system.stateVersion                   = "25.05";
  networking.hostName                   = "hgnixprod01";
  nix.settings.experimental-features    = ["nix-command" "flakes" ];
}
