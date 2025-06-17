{
  deployment = {
    targetHost = "192.168.40.18";
    targetUser = "colmena";
    targetPort = 2002;
    buildOnTarget = false;
    tags = [ "hydrogroup" "vm" "hyperv" ];
    allowLocalDeployment = false;
  };
  imports = [
    ./configuration.nix
  ];
}
