{
  imports = [
    ./hardware-configuration.nix
    ./static-ip.nix
    ./disko.nix
    <config>
  ];

  system.stateVersion                   = "25.05";
  networking.hostName                   = "<hostname>";
  nix.settings.experimental-features    = ["nix-command" "flakes" ];
}
