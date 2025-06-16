{
  users.users.hgcolmena = {
    isNormalUser        = true;
    description         = "Hydro Group Colmena";
    extraGroups         = [ "networkManager" "wheel" ];
    openssh.authorizedKeys.keys = [
    	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN6Ov0TRdMAOGgtaX43e0QiapO4vKUJg26QSYwEDibwg Hydrogroup Colmena"
    ];
  };
  security.sudo.extraRules= [
      {
          users = [ "hgcolmena" ];
          commands = [
              {
                  command = "ALL" ;
                  options= [ "NOPASSWD" ];
              }
          ];
      }
  ];
}
