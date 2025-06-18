{ lib, ... }:

let
  iface = "eth0";
in {
  networking.useDHCP = false;

  networking.interfaces.${iface} = {
    ipv4.addresses = [{
      address      = "192.168.40.19";
      prefixLength = 23;
    }];
  };

  networking.nameservers = [
    "1.1.1.3"
    "1.0.0.3"
  ];

  networking.defaultGateway  = "192.168.41.251";
}
