{
  deployment = {
    targetHost = "91.99.175.119";
    targetUser = "colmena";
    targetPort = 2002;
    buildOnTarget = false;
    tags = [ "personal" "cloud" "hetzner" ];
    allowLocalDeployment = true;
  };
  imports = [
    ./configuration.nix
  ];
}
