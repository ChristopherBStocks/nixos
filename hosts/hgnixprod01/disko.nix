{ lib, ... }:
{
  disko.devices.disk = {
    os = {
      type   = "disk";
      device = "/dev/disk/by-path/acpi-VMBUS:00-vmbus-1450460a2f0a4720af074acfdd31ba96-lun-0";

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
            };
          };

          root = {
            size  = "100%";
            type  = "8300";
            content = {
              type       = "filesystem";
              format     = "ext4";
              mountpoint = "/";
            };
          };

        };
      };
    };

    ssd-data = {
      type   = "disk";
      device = "/dev/disk/by-path/acpi-VMBUS:00-vmbus-1450460a2f0a4720af074acfdd31ba96-lun-1";

      content = {
        type   = "gpt";
        partitions = {
          data = {
            size  = "100%";
            type  = "8300";
            content = {
              type       = "filesystem";
              format     = "ext4";
              mountpoint = "/srv/data/ssd";
            };
          };
        };
      };
    };

    hdd-data = {
      type   = "disk";
      device = "/dev/disk/by-path/acpi-VMBUS:00-vmbus-1450460a2f0a4720af074acfdd31ba96-lun-1";

      content = {
        type   = "gpt";
        partitions = {
          data = {
            size  = "100%";
            type  = "8300";
            content = {
              type       = "filesystem";
              format     = "ext4";
              mountpoint = "/srv/data/hdd";
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
