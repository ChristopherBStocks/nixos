{
  deployment = {
    targetHost = "192.168.40.174";
    targetUser = "colmena";
    targetPort = 2002;
    buildOnTarget = false;
    tags = [ "personal" "server" "hetzner" ];
    allowLocalDeployment = true;
  };
  imports = [
    ./configuration.nix
  ];
}
