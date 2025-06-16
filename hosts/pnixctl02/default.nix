{
  deployment = {
    targetHost = "91.99.170.218";
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
