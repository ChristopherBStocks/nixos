
  deployment = {
    targetHost = "<host>";
    targetUser = "colmena";
    targetPort = 2002;
    buildOnTarget = false;
    tags = [ "hetzner-cloud" ];
    # allowLocalDeployment = true;
  };
  imports = [
    ./configuration.nix
  ];
}
