{
  users.users.colmena = {
    isNormalUser        = true;
    description         = "Colmena";
    extraGroups         = [ "networkManager" "wheel" ];
    openssh.authorizedKeys.keys = [
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMhLJQJ+iM+IC4L/3XgUCGrTv451TCjIfLgAMxJOqssI Colmena"
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
