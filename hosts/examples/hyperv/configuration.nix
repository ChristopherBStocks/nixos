{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    <config>
  ];
  system.stateVersion                   = "25.05";
  networking.hostName                   = "<hostname>";
  nix.settings.experimental-features    = ["nix-command" "flakes" ];
}
