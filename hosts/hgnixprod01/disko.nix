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
              format    = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" "noatime" ];
            };
          };

          root = {
            size    = "100%";
            type    = "8300";
            content = {
              type       = "filesystem";
              format     = "ext4";
              mountpoint = "/";
              mountOptions = [ "noatime" "discard" ];
            };
          };

        };
      };
    };

    disk.sdb = {
      device = "/dev/sdb";
      type = "disk";

      content = {
        type = "gpt";
        partitions = {

          root = {
            size    = "100%";
            type    = "8300";
            content = {
              type        = "filesystem";
              format      = "ext4";
              mountpoint  = "/srv/data"
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