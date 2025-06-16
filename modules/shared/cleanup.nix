{
    nix.gc = {
        automatic = true;
        options = "--delete-older-than 10d";
        dates = "3:00";
    };

    nix.optimise = {
        automatic = true;
        dates = [ "3:00" ];
    };
}
