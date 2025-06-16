{ lib, ... }:
{
  disko.devices = {
    disk.sda = {
      device = "/dev/sda";
      type   = "disk";

      content = {
        type   = "gpt";
        partitions = {

          bios = {
            size   = "1M";
            type   = "EF02";
          };

          esp = {
            size   = "244M";
            type   = "EF00";
            content = {
              type       = "filesystem";
              format     = "vfat";
              mountpoint = "/boot/efi";
              mountOptions = [ "umask=0077" ];
            };
          };

          root = {
            size      = "100%";
            type     = "8300";
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
  };
  boot.loader = {
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
    efi = {
      efiSysMountPoint   = "/boot/efi";
    };
  };
}
