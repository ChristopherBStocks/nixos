{
  imports = [
    ./hardware-configuration.nix
    ./static-ip.nix
    ./disko.nix
    ../../configs/personal/servers/generic.nix
  ];

  system.stateVersion                   = "25.05";
  networking.hostName                   = "<hostname>";
  nix.settings.experimental-features    = ["nix-command" "flakes" ];
}
