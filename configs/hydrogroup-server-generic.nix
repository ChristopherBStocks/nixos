{
  imports = [
        ../modules/shared/networking.nix
        ../modules/shared/services/openssh.nix
        ../modules/shared/services/fail2ban.nix
        ../modules/shared/services/docker.nix
        ../modules/shared/users/cstocks.nix
        ../modules/shared/users/hgcolmena.nix
        ../modules/shared/packages.nix
        ../modules/shared/locale.nix
        ../modules/shared/cleanup.nix
        ../modules/shared/updates/weekly.nix
	      ../modules/shared/aliases.nix
  ];
}
