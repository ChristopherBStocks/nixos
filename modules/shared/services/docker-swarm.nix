{
  virtualisation.docker = {
      enable = true;
      daemon.settings = {
          userland-proxy = false;
          icc = false;
          "no-new-privileges" = true;
          "log-driver" = "json-file";
          "log-level" = "info";
          "live-restore" = false;
          "storage-driver" = "overlay2";
      };
  };
  boot.kernelModules = [ "overlay" "vxlan" "br_netfilter" ];
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward"                  = 1;
    "net.bridge.bridge-nf-call-iptables"   = 1;
    "net.bridge.bridge-nf-call-ip6tables"  = 1;
    "net.ipv4.ip_unprivileged_port_start"  = 80;
  };

  networking.firewall.allowedTCPPorts = [ 2377 7946 ];
  networking.firewall.allowedUDPPorts = [ 4789 7946 ];
}
