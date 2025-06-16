{
    services.openssh = {
        enable = true;
        ports = [ 2002 ];
        settings = {
            PasswordAuthentication = false;
            PermitRootLogin = "no";
            PubkeyAuthentication = "yes";
        };
    };
    networking.firewall.allowedTCPPorts = [ 2002 ];
}
