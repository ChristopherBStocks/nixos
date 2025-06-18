{
  deployment = {
    targetHost = "192.168.40.19";
    targetUser = "hgcolmena";
    targetPort = 2002;
    buildOnTarget = false;
    tags = [ "hydrogroup" "vm" "hyperv" ];
    allowLocalDeployment = false;
  };
  imports = [
    ./configuration.nix
  ];
  nix.settings = {
    require-sigs = true;
    trusted-public-keys = [
      "hydrogroup:NWYXdVZW8PS2E/Fx04nH/mxV/pIuMMU7OuLD8RLMcrI="
      "cache.nixos.org-1:viIS5cG7z5S4FjVHaY2Pc6mfis/9+r7Zg47D6R4wlmY="
    ];
  };
}
