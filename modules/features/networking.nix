{
	flake.nixosModules.networking = {
		networkmanager.enable = true;
		enableIPv6 = true;
		firewall.enable = true;
	};
}
