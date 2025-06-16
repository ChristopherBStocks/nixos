{
  users.users.colmena = {
    isNormalUser        = true;
    description         = "Colmena";
    extraGroups         = [ "networkManager" "wheel" ];
    openssh.authorizedKeys.keys = [
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL37nfobDa9If15qDp7/KjitjBKZ7PF16htSjdcWrK+b Colmenaa"
    ];
  };
  security.sudo.extraRules= [
      {
          users = [ "colmena" ];
          commands = [
              {
                  command = "ALL" ;
                  options= [ "NOPASSWD" ];
              }
          ];
      }
  ];
}
