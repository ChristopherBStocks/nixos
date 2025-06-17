{ lib, ... }:

let
  iface = "eth0";
in {
  networking.useDHCP = false;

  networking.interfaces.${iface} = {
    ipv4.addresses = [{
      address      = "192.168.40.18";
      prefixLength = 23;
    }];
  };

  networking.defaultGateway  = "192.168.41.251";
}
