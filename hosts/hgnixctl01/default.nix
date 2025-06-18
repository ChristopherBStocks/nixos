{
  deployment = {
    targetHost = "192.168.40.16";
    targetUser = "hgcolmena";
    targetPort = 2002;
    buildOnTarget = false;
    tags = [ "hydrogroup" "vm" "hyperv" ];
    allowLocalDeployment = true;
    deployment.copyClosure.toTarget.extraArgs = [
      "--sign-by" "home/hgcolmena/nixos/keys/hydrogroup-sec.pem"
    ];
  };
  imports = [
    ./configuration.nix
  ];
  nix.settings = {
    require-sigs = true;
    secret-key-files = [ "/home/hgcolmena/nixos/keys/hydrogroup-sec.pem" ];
    trusted-public-keys = [
      "hydrogroup-sec:j3puB8CA+1ERuJ9RDFVrTrgj70GyDo7+5L9OGb7sqh8="
    ];
  };
}
