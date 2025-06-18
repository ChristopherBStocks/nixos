{ lib, ... }:
{
  disko.devices = {
    disk.sda = {
      device = "/dev/sda";
      type   = "disk";

      content = {
        type = "gpt";
        partitions = {

          esp = {
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
            type    = "8300";
            content = {
              type       = "filesystem";
              format     = "vfat";
              mountpoint = "/";
              mountOptions = [ "noatime" "discard" ];
            };
          };

        };
      };
    };
  };
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}