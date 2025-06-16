{
  users.users.cstocks = {
    isNormalUser        = true;
    description         = "Christopher Stocks";
    extraGroups         = [ "networkManager" "wheel" "docker" ];
    openssh.authorizedKeys.keys = [
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILcbcqr/Qvw8FtcSW0xSa6e/MJ4mw5IbRntBMLkz6ZoB Mac Mini - 2025/06/02"
    ];
  };
  security.sudo.extraRules= [
      {
          users = [ "cstocks" ];
          commands = [
              {
                  command = "ALL" ;
                  options= [ "NOPASSWD" ];
              }
          ];
      }
  ];
}
