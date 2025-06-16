{
  virtualisation.docker = {
      enable = true;
      daemon.settings = {
          userland-proxy = false;
          icc = false;
          "no-new-privileges" = true;
          "log-driver" = "json-file";
          "log-level" = "info";
          "live-restore" = true;
          "storage-driver" = "overlay2";
      };
  };
  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 80;
}
