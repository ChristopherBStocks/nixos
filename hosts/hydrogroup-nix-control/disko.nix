{ lib, ... }:
{
  disko.devices = {
    disk.sda = {
      device = "/dev/sda";
      type   = "disk";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            size       = "1G";
            type       = "EF00";
            content = {
              type      = "filesystem";
              format    = "fat32";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" "noatime" ];
            };
          };
          root = {
            size    = "100%";
            content = {
              type       = "filesystem";
              format     = "ext4";
              mountpoint = "/";
              mountOptions = [ "defaults" "noatime" "discard" ];
            };
          };
        };
      };
    };
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

