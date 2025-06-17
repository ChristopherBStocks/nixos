{ lib, ... }:

let
  iface = "<interface>";
in {
  networking.useDHCP = false;

  networking.interfaces.${iface} = {
    ipv4.addresses = [{
      address      = "<ipv4>";
      prefixLength = <ipv4 prefix>;
    }];

    ipv6.addresses = [{
      address      = "<ipv6>";
      prefixLength = <ipv6 prefix>;
    }];
  };

  networking.nameservers = [
    "1.1.1.3"
    "1.0.0.3"
  ];

  networking.defaultGateway  = "<ipv4 gateway>";
  networking.defaultGateway6 = "<ipv6 gateway>";
}
