{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ../../configs/hydrogroup-server-colmena.nix
  ];
  system.stateVersion                   = "25.05";
  networking.hostName                   = "hgnixctl01";
  nix.settings.experimental-features    = ["nix-command" "flakes" ];
}
