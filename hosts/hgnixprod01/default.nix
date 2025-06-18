{
  deployment = {
    targetHost = "192.168.40.18";
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
      "hydrogroup-sec:j3puB8CA+1ERuJ9RDFVrTrgj70GyDo7+5L9OGb7sqh8="
    ];
  };
}
