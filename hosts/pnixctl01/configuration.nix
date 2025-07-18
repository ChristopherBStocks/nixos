{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ../../configs/personal-server-colmena.nix
  ];
  system.stateVersion                   = "25.05";
  networking.hostName                   = "pnixctl01";
  nix.settings.experimental-features    = ["nix-command" "flakes" ];
}
