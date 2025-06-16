{ li, ... }:
{
  boot.swraid.enable = true;

  disko.devices = let
    mkDisk = path: {
      type   = "disk";
      device = path;
      content = {
        type = "gpt";
        partitions = {
          bios = {
            size = "1M";
            type = "EF02";
            priority = 1;
          };

          esp = {
            size = "512M";
            type = "EF00";
            content = {
              type       = "filesystem";
              format     = "vfat";
              mountpoint = "/boot";
            };
            priority = 2;
          };

          root = {
            size = "100%";
            type = "FD00";
            content = { type = "mdraid"; name = "md_root"; };
          };
        };
      };
    };
  in {
    disk.nvme0 = mkDisk "/dev/nvme0n1";

    disk.nvme1 =
      lib.recursiveUpdate (mkDisk "/dev/nvme1n1")
        { content.partitions.esp.content.mountpoint = "/boot/efi/nvme1"; };

    mdadm.md_root = {
      type     = "mdadm";
      level    = 1;
      metadata = "1.2";
      content  = {
        type         = "filesystem";
        format       = "ext4";
        mountpoint   = "/";
        mountOptions = [ "noatime" "discard" ];
      };
    };
  };
  
  boot.loader.grub = {
    enable = true;
    devices = [ "/dev/nvme0n1" "/dev/nvme1n1" ];
    efiSupport = true;
    mirroredBoots = [
      { path = "/boot";           devices = [ "nodev" ]; }
      { path = "/boot/efi/nvme1"; devices = [ "nodev" ]; }
    ];
  };
}
