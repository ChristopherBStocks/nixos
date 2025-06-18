{ lib, ... }:
{
    disko.devices = {

      os = {
        type   = "disk";
        device = "/dev/disk/by-path/acpi-VMBUS:00-vmbus-acc06c62e8ca4e5ca460cf6589ccb067-lun-0";
        content = {
          type   = "gpt";
          partitions = {
            esp = {
              type  = "EF00";
              size  = "512M";
              content = {
                type       = "filesystem";
                format     = "vfat";
                mountpoint = "/boot/efi";
                mountOptions = [ "umask=0077" "noatime" ];
              };
            };
            root = {
              type  = "8300";
              size  = "remaining";
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

      ssd-data = {
        type   = "disk";
        device = "/dev/disk/by-path/acpi-VMBUS:00-vmbus-acc06c62e8ca4e5ca460cf6589ccb067-lun-1";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size    = "100%";
              type    = "8300";
              content = {
                type        = "filesystem";
                format      = "ext4";
                mountpoint  = "/srv/data/sdd";
                mountOptions = [ "noatime" "discard" ];
              };
            };
          };
        };
      }

      hdd-data = {
        type   = "disk";
        device = "/dev/disk/by-path/acpi-VMBUS:00-vmbus-acc06c62e8ca4e5ca460cf6589ccb067-lun-2";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size    = "100%";
              type    = "8300";
              content = {
                type        = "filesystem";
                format      = "ext4";
                mountpoint  = "/srv/data/hdd";
                mountOptions = [ "noatime" "discard" ];
              };
            };
          };
        };
      }
    };

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
}