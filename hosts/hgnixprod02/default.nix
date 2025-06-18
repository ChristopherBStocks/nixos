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
    trusted-users = [ "hgcolmena" ];
  };
}
